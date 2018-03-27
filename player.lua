--! file: player.lua

Player = Object:extend();

--initialize variables
function Player:new(x, y, speed)
     self.image = love.graphics.newImage("towerDefense_tile249.png");
     self.x = x;
     self.y = y;
     self.speed = speed;
     self.width = self.image:getWidth();
     self.height = self.image:getHeight();
end

function Player:update(dt)
     --movement
     local xDir = 0; local yDir = 0;
     if love.keyboard.isDown("down") then
           yDir = 1;
     elseif love.keyboard.isDown("up") then
          yDir = -1;
     end
     if love.keyboard.isDown("right") then
          xDir = 1;
     elseif love.keyboard.isDown("left") then
          xDir = -1;
     end

     self.x = self.x + self.speed * dt * xDir;
     self.y = self.y + self.speed * dt * yDir;

     --checking for collisions with the edges of the window
     local windowWidth = love.graphics.getWidth();
     local windowHeight = love.graphics.getHeight();

     if self.x < 0 then
          self.x = 0;
     end
     if self.x + self.width > windowWidth then
          self.x = windowWidth - self.width;
     end
     if self.y < 0 then
          self.y = 0;
     end
     if self.y + self.height > windowHeight then
          self.y = windowHeight - self.height;
     end
end

function Player:draw()
     love.graphics.draw(self.image, self.x, self.y);
end

function Player:keyPressed(key)
     if key == "space" then
          --add a bullet instance to the bulletTable
          table.insert(bulletTable, Bullet(self.x, self.y, -500));
     end
end
