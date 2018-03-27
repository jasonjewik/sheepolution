--! file: main.lua
function love.load()
     --getting the class library
     Object = require "classic";
     --getting the rectangle class file
     require "rectangle";
     require "circle";

     --creates rectangles and a circle
     r1 = Rectangle(100, 200, 50, 60);
     r2 = Rectangle(300, 150, 20, 40);
     c1 = Circle(60, 80, 35);

     --gets a reference to raichu.png and creates an image object
     --has to be a PNG file
     raichu = love.graphics.newImage("raichu.png");
     --because this is an object, we can use functions to change or access properties
     width = raichu:getWidth();
     height = raichue:getHeight();
end

function love.update(dt)
     --passing in arguments to the method
     r1.update(r1, dt);
     --or we can use colon as shorthand to automatically pass in anything left of the colon as the first argument
     r2:update(dt);
     c1:update(dt);
end

function love.draw()
     r1.draw(r1);
     r2:draw();
     c1:draw();

     love.graphics.draw(raichu, 100, 100);
end
