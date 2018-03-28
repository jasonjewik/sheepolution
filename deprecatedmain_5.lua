function love.load()
     --creates a circle object
     circle = {};
     --sets the circle's properties
     circle.x = 100;
     circle.y = 100;
     circle.radius = 25;
     circle.speed = 200;

     --creates an arrow object
     arrow = {};
     arrow.x = 200;
     arrow.y = 200;
     arrow.speed = 100;
     arrow.angle = 0;
     arrow.image = love.graphics.newImage("arrow_right.png");
     arrow.origin_x = arrow.image:getWidth()/2;
     arrow.origin_y = arrow.image:getHeight()/2;
end

function love.update(dt)
     --gets the mouse coordinates
     mouse_x = love.mouse.getX();
     mouse_y = love.mouse.getY();

     --returns the angle (in radians) between the mouse and the circle
     angle = math.atan2(mouse_y - circle.y, mouse_x - circle.x);

     local distance = getDistance(circle.x, circle.y, mouse_x, mouse_y);
     --moves the circle
     if distance < 400 then
          circle.x = circle.x + circle.speed * math.cos(angle) * (distance/100) * dt;
          circle.y = circle.y + circle.speed * math.sin(angle) * (distance/100) * dt;
     end

     arrow.angle =  math.atan2(mouse_y - arrow.y, mouse_x - arrow.x);
     local distance2 = getDistance(arrow.x, arrow.y, mouse_x, mouse_y);
     arrow.x = arrow.x + arrow.speed * math.cos(arrow.angle) * (distance2/100) * dt;
     arrow.y = arrow.y + arrow.speed * math.sin(arrow.angle) * (distance2/100) * dt;
end

function love.draw()
     --draws the circle
     love.graphics.circle("line", circle.x, circle.y, circle.radius);
     --prints the angle
     love.graphics.print(math.deg(angle) .. " degrees");
     love.graphics.print(angle .. " radians", 0, 32);
     --draws lines to help visualize the vectors
     love.graphics.line(circle.x, circle.y, mouse_x, circle.y);
     love.graphics.line(circle.x, circle.y, circle.x, mouse_y);
     --draws lines to help visaulize the angle
     love.graphics.line(circle.x, circle.y, mouse_x, mouse_y);
     --draws a line to  create a triangle
     love.graphics.line(mouse_x, circle.y, circle.x, mouse_y);

     local distance = getDistance(circle.x, circle.y, mouse_x, mouse_y);
     love.graphics.circle("line", circle.x, circle.y, distance);

     --draws the arrow
     love.graphics.draw(arrow.image, arrow.x, arrow.y, arrow.angle, 1, 1, arrow.origin_x, arrow.origin_y);
end

function love.keypressed(key)
     if key == "escape" then
          love.window.close();
     end
end

function getDistance(x1, y1, x2, y2)
     local hDist = x1 - x2;
     local vDist = y1 - y2;

     local a = hDist ^ 2;
     local b = vDist ^ 2;
     local c = math.sqrt(a + b);

     return c;
end
