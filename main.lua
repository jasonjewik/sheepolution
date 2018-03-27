function love.load()
     Object = require "classic";
     require "player";
     require "enemy";
     require "bullet";
     player = Player(100, 400, 150);
     enemy = Enemy(100, 100, 75);
     bulletTable = {};
end

function love.update(dt)
     player:update(dt);
     enemy:update(dt);

     for i, v in ipairs(bulletTable) do
          v:update(dt);
          v:checkCollision(enemy);
          if v.dead then
               table.remove(bulletTable, i);
          end
     end
end

function love.draw()
     player:draw();
     enemy:draw();

     for i, v in ipairs(bulletTable) do
          v:draw();
     end
end

function love.keypressed(key)
     player:keyPressed(key);
end
