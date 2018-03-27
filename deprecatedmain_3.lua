Object = require "classic";
require "rectangle";

function love.load()
     r1 = Rectangle(400, 100, 200, 200);
     r2 = Rectangle(30, 100, 50, 50);
end

function love.update(dt)
     if not checkCollision(r1, r2) then
          r2.x = r2.x + r2.speed * dt;
     end
end

function love.draw()
     local mode;
     if checkCollision(r1, r2) then
          mode = "fill";
     else
          mode = "line";
     end
     love.graphics.rectangle(mode, r1.x, r1.y, r1.width, r1.height);
     love.graphics.rectangle(mode, r2.x, r2.y, r2.width, r2.height);
end

function checkCollision(a, b)
     local a_left = a.x;
     local a_right = a.x + a.width;
     local a_top = a.y;
     local a_bottom = a.y + a.height;

     local b_left = b.x;
     local b_right = b.x + b.width;
     local b_top = b.y;
     local b_bottom = b.y + b.height;

     if a_right > b_left and a_left < b_right and a_bottom > b_top and a_top < b_bottom then
          return true;
     else
          return false;
     end
end
