--! file: bullet.lua

Bullet = Object:extend();

function Bullet:new(x, y, speed)
     self.image = love.graphics.newImage("towerDefense_tile251.png");
     self.x = x;
     self.y = y;
     self.speed = speed;
     self.width = self.image:getWidth();
     self.height = self.image:getHeight();
     self.dead = false;
end

function Bullet:update(dt)
     self.y = self.y + self.speed * dt;

     if self.y < 0 then
          love.load();
     end
end

function Bullet:draw()
     love.graphics.draw(self.image, self.x, self.y);
end

function Bullet:checkCollision(obj)
     local self_left = self.x;
     local self_right = self.x + self.width;
     local self_top = self.y;
     local self_bottom = self.y + self.height;

     local other_left = obj.x;
     local other_right = obj.x + obj.width;
     local other_top = obj.y;
     local other_bottom = obj.y + obj.height;

     if self_right > other_left and self_left < other_right and self_top < other_bottom and self_bottom > other_top then
          self.dead = true;
          if obj.speed > 0 then
               obj.speed = obj.speed + 50;
          else
               obj.speed = obj.speed - 50;
          end
     end
end
