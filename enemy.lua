--! file: enemy.lua

Enemy = Object:extend();

function Enemy:new(x, y, speed)
     self.image = love.graphics.newImage("towerDefense_tile250.png");
     self.x = x;
     self.y = y;
     self.speed = speed;
     self.width = self.image:getWidth();
     self.height = self.image:getHeight();
end

function Enemy:update(dt)
     self.x = self.x + self.speed * dt;

     --checking for collisions with the edges of the window
     local windowWidth = love.graphics.getWidth();
     local windowHeight = love.graphics.getHeight();

     if self.x < 0 then
          self.x = 0;
          self.speed = -self.speed;
     end
     if self.x + self.width > windowWidth then
          self.x = windowWidth - self.width;
          self.speed = -self.speed;
     end
     if self.y < 0 then
          self.y = 0;
     end
     if self.y + self.height > windowHeight then
          self.y = windowHeight - self.height;
     end
end

function Enemy:draw()
     love.graphics.draw(self.image, self.x, self.y, -math.pi);
end
