function love.load()
     --creates an image table
     --[[images = {};
     for i = 1, 5 do
          table.insert(images, love.graphics.newImage("jump/jump" .. i .. ".png"));
     end]]--

     --setting up the same thing but with a sprite sheet instead
     image = love.graphics.newImage("jump.png");
     frames = {};
     local frame_width = 117;
     local frame_height = 233;
     local image_width = image:getWidth();
     local image_height = image:getHeight();
     for i = 0, 4 do
          table.insert(frames, love.graphics.newQuad(i * frame_width, 0, frame_width, frame_height, image_width, image_height));
     end

     --current frame
     currentFrame = 1;
end

function love.update(dt)
     --multiplying by 10 speeds up the animation, higher number is faster speed
     currentFrame = currentFrame + 10 * dt;
     --resets back to the beginning
     if currentFrame >= 6 then
          currentFrame = 1;
     end
end

function love.draw()
     --we need math.floor because otherwise adding dt would result in a decimal frame count
     --love.graphics.draw(images[math.floor(currentFrame)]);
     love.graphics.draw(image, frames[math.floor(currentFrame)], 100, 100);
end
