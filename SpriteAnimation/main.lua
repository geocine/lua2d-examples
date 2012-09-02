local Quad = love.graphics.newQuad
function love.load()
	sprite = love.graphics.newImage "sprite.png"
	quads = {
		down = {
			Quad( 2,   2, 32, 48, 104, 202);
			Quad(36,   2, 32, 48, 104, 202);
			Quad( 2,   2, 32, 48, 104, 202);
			Quad(70,   2, 32, 48, 104, 202);
		};
		left = {
			Quad( 2,  52, 32, 48, 104, 202);
			Quad(36,  52, 32, 48, 104, 202);
			Quad( 2,  52, 32, 48, 104, 202);
			Quad(70,  52, 32, 48, 104, 202);
		};
		right = {
			Quad( 2, 102, 32, 48, 104, 202);
			Quad(36, 102, 32, 48, 104, 202);
			Quad( 2, 102, 32, 48, 104, 202);
			Quad(70, 102, 32, 48, 104, 202);
		};
		up = {
			Quad( 2, 152, 32, 48, 104, 202);
			Quad(36, 152, 32, 48, 104, 202);
			Quad( 2, 152, 32, 48, 104, 202);
			Quad(70, 152, 32, 48, 104, 202);
		};
	}
	iterator = 1
	max = 4
	timer = 0
	moving = false
	direction = "down"
end

function love.update(dt)
	if moving then
		timer = timer + dt
		if timer > 0.2 then
			timer = 0
			iterator = iterator + 1
			if iterator > max then
				iterator = 1
			end
		end
	end
end

function love.draw()
	love.graphics.drawq(sprite, quads[direction][iterator], 5, 5)
end

function love.keypressed(key)
	if quads[key] then -- this is really ugly. Don't do it like this in your final game.
		moving = true
		direction = key
		-- output on console love.exe --console directory
		sf=string.format
		print(sf("Character is moving %s.",key))
	end
end
function love.keyreleased(key)
	if quads[key] and direction == key then -- only stop moving if we're still moving in only that direction.
		moving = false
		direction = "down"
		iterator = 1
	end
end
