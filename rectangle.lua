--! file: rectangle.lua

--note the colon instead of the dot
--this makes rectangle an object class (generally written with Uppercase)
require "shape";
Rectangle = Shape:extend();

--use the colon as short hand
--overrides shape.lua's 'new' function
function Rectangle:new(x, y, width, height)
     --the property 'super' references Rectangle's parent class
     --can't use a colon because we're calling the function of another class
     Rectangle.super.new(self, x, y)
     self.width = width;
     self.height = height;
end

--we don't need an update function because we can inherit that from shape.lua

--or you can pass in self as the argument
function Rectangle.draw(self)
     love.graphics.rectangle("line", self.x, self.y, self.width, self.height);
end
