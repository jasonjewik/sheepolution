--! file: circle.lua
require "shape";
Circle = Shape:extend();

function Circle:new(x, y, radius)
     Circle.super.new(self, x, y);
     self.radius = radius;
end

--we don't need an update function because we can inherit that from shape.lua

function Circle:draw()
     love.graphics.circle("line", self.x, self.y, self.radius);
end
