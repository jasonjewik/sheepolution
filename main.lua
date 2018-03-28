function love.load()
     --get the tile image
     image = love.graphics.newImage("tileset.png");
     local image_width = image:getWidth();
     local image_height = image:getHeight();
     local rows = 2;
     local columns = 3;
     --subtract two because that's how much buffer space the quads need to prevent bleeding
     width = (image_width / columns) - 2;
     height = (image_height / rows) - 2;

     --create the quads
     quad = {};
     for i = 0, 1 do
          for j = 0, 2 do
               table.insert(quad, love.graphics.newQuad(1 + j * (width + 2), 1 + i * (height + 2), width, height, image_width, image_height));
          end
     end

     --create a tile map
     tilemap = {
         {1, 6, 6, 2, 1, 6, 6, 2},
         {3, 0, 0, 4, 5, 0, 0, 3},
         {3, 0, 0, 0, 0, 0, 0, 3},
         {4, 2, 0, 0, 0, 0, 1, 5},
         {1, 5, 0, 0, 0, 0, 4, 2},
         {3, 0, 0, 0, 0, 0, 0, 3},
         {3, 0, 0, 1, 2, 0, 0, 3},
         {4, 6, 6, 5, 4, 6, 6, 5}
     }
     --Create a table named colors
     colors = {
         --Fill it with tables filled with RGB numbers
         {255, 255, 255},
         {255, 0, 0},
         {255, 0, 255},
         {0, 0, 255},
         {0, 255, 255}
     }
     --create the player
     player = {};
     player.image = love.graphics.newImage("player.png");
     player.tile_x = 2;
     player.tile_y = 2;
end

function love.draw()
     --loops through the rows in tilemap
     for i,row in ipairs(tilemap) do
          --loops through the tiles in each row
          for j,tile in ipairs(row) do
               --checks to see if a tile was placed
               if tile ~= 0 then
                    --love.graphics.setColor(colors[tile]);
                    love.graphics.draw(image, quad[tile], j * width, i * height);
                    --love.graphics.rectangle("fill", j * 25, i * 25, 25, 25)
               end
          end
     end

     --draws the player
     love.graphics.draw(player.image, player.tile_x * width, player.tile_y * height);
end

function love.keypressed(key)
     local x = player.tile_x;
     local y = player.tile_y;

     if key == "left" then
          x = x - 1;
     elseif key == "right" then
          x = x + 1;
     end
     if key == "down" then
          y = y + 1;
     elseif key == "up" then
          y = y - 1;
     end

     if isEmpty(x, y) then
          player.tile_x = x;
          player.tile_y = y;
     end
end

function isEmpty(x, y)
     --flipped because y is row and x is column
     return tilemap[y][x] == 0;
end
