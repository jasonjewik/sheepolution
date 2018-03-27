--initialization
function love.load()
	--creates a table of fruits
	fruits = {"apples", "bananas", "pears"};
	table.insert(fruits, "grapes");

	--creates a table of rectangles
	rectTable = {};

	--accesses example.lua
	example = require("example");
	--accesses tick.lua (note that parentheses are optional)
	tick = require "tick";

	drawRect = false;
	--the first argument is the function to run after the delay specified in the second argument
	tick.delay(function()
		drawRect = true
		end, 2);
end

--creates rectangles to populate rectTable
function createRect()
	--creates a rectangle object
	rect = {};
	rect.x = 100;
	rect.y = 200;
	rect.width = 50;
	rect.height = 80;
	rect.speed = 100; --pixels per second

	table.insert(rectTable, rect);
end

function love.keypressed(key)
	if key == "space" then
		createRect();
	end
end

--then update
function love.update(dt)
--[[
	--dt stands for delta time, used to syncrhonize speeds across different computers
	xDir = 0; --direction to go
	yDir = 0;

	if love.keyboard.isDown("up") then yDir = -1;
	elseif love.keyboard.isDown("down") then yDir = 1;
	else yDir = 0;
	end
	if love.keyboard.isDown("right") then xDir = 1;
	elseif love.keyboard.isDown("left") then xDir = -1;
	else xDir = 0;
	end

	rect.x = rect.x + rect.speed * xDir * dt;
	rect.y = rect.y + rect.speed * yDir * dt;
]]--

--updates tick
tick.update(dt);

--sets the rectangles to move
for i, v in ipairs(rectTable) do
	v.x = v.x + v.speed * dt;
end

end

--then draw
function love.draw()
	-- printing the value from example.lua
	love.graphics.print(example);

	--printing the table
	--note that lua indexes at 1 instead of 0
	--put # in front of a table variable to access its size
	--for i=1,#fruits do
		--love.graphics.print(fruits[i], 100, 100 + 50 * i);
	--end

	--prints the table with ipairs
	--v is the value at position i
	for i,v in ipairs(fruits) do
		love.graphics.print(v, 100, 100 + 50 * i);
	end

	--creates the rectangles
	for i,v in ipairs(rectTable) do
		love.graphics.rectangle("line", v.x, v.y, v.width, v.height);
	end

	if drawRect then
		love.graphics.rectangle("fill", math.random(0, 300), math.random(0, 300), 100, 100);
	end
end
