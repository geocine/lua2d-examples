speed = 200
imgx = 0
imgy = 0
function love.load()
	
	
	
	image = love.graphics.newImage("queen_pig.png")
	local f = love.graphics.newFont(12)
	love.graphics.setFont(f)
	-- love.graphics.setColor(0,0,0,255)
	love.graphics.setBackgroundColor(255,255,255)
	text = "Click and drag the cake around or use the arrow keys"
end

function love.draw()
	--love.graphics.print("Hello World", 400, 300)
	-- transparent
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(image, imgx, imgy)
	love.graphics.setColor(255,0,0)
	love.graphics.print(text, 10, 10)
end

function love.update(dt)
	if gameIsPaused then return end
	-- The rest of your love.update code goes here
	if love.keyboard.isDown("up") then
	  -- num = num + 100 * dt -- this would increment num by 100 per second
	  imgy = imgy - speed * dt
	end
	if love.keyboard.isDown("down") then
	  -- num = num + 100 * dt -- this would increment num by 100 per second
	  imgy = imgy + speed * dt
	end
	if love.keyboard.isDown("left") then
	  -- num = num + 100 * dt -- this would increment num by 100 per second
	  imgx = imgx - speed * dt
	end
	if love.keyboard.isDown("right") then
	  -- num = num + 100 * dt -- this would increment num by 100 per second
	  imgx = imgx + speed * dt
	end
	love.graphics.print(text, 10, 10)
end

function love.mousepressed(x, y, button)
	if button == 'l' then
	  -- center of image
	  imgx = x - image:getWidth()/2 -- move image to where mouse clicked
	  imgy = y - image:getHeight()/2
	end
end

function love.mousereleased(x, y, button)
	if button == 'l' then
	  -- fireSlingshot(x,y) -- this totally awesome custom function is defined elsewhere
	end
end


function love.focus(f)
	gameIsPaused = not f
	if not f then
	print("LOST FOCUS")
	else
	print("GAINED FOCUS")
	end
end

function love.keypressed(key, unicode)
	if key == 'b' then
	  text = "The B key was pressed."
	elseif key == 'a' then
	  a_down = true
	end
end

function love.keyreleased(key, unicode)
	if key == 'b' then
	  text = "The B key was released."
	elseif key == 'a' then
	  a_down = false
	end
end

function love.quit()
	print("Thanks for playing! Come back soon!")
end

