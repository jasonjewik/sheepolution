--initialization
function love.load()
	rectX = 100;
	rectY = 200;
	speed = 100; --pixels per second
	fruits = {"apples", "bananas", "pears"};
	table.insert(fruits, "grapes");
end

--then update
function love.update(dt)
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

	rectX = rectX + speed * xDir * dt;
	rectY = rectY + speed * yDir * dt;
end

--then draw
function love.draw()
	-- printing hello world!
	love.graphics.print("Hello World!");

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

	--draws a rectangle
	love.graphics.rectangle("fill", rectX, rectY, 50, 80);
end
