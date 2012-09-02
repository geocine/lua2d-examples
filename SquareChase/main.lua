require "32log"
require "Rectangle"

local currentSquare
playerScore = 0
timeRemaining = 0.0
TimePerSquare = 0.75
local colors = {
		{ r = 255,g = 0,b = 0 },
		{ r = 0,g = 128,b = 0 },
		{ r = 0,g = 0,b = 255},
	}
screenWidth = 0
screenHeight = 0

-- initialize in XNA
function love.load()
	love.mouse.setVisible(true)
	squareBoundWidth = love.graphics.getWidth()
	squareBoundHeight = love.graphics.getHeight()
	-- content load
	squareTexture = love.graphics.newImage("square.bmp");
	currentSquare = Rectangle:new(math.random(0,squareBoundWidth),math.random(0,squareBoundHeight),25,25)
	currentSquare.color = colors[1]
end

-- update in XNA
function love.update(dt)
	if timeRemaining == 0.0 then
		currentSquare.x = math.random(0,squareBoundWidth)
		currentSquare.y = math.random(0,squareBoundHeight)
		timeRemaining = TimePerSquare
	end
	
	if love.mouse.isDown("l") then
		contain = currentSquare:contains(love.mouse.getX(),love.mouse.getY())
		if contain then
			playerScore = playerScore + 1
			timeRemaining = 0.0
		end
	end
	
	timeRemaining = math.max(0,timeRemaining-dt)
	love.graphics.setCaption("Score : " .. playerScore)	
end

-- draw in XNA
function love.draw()
	love.graphics.setBackgroundColor(128,128,128)
    colorIndex = (playerScore % 3) + 1
	currentSquare.color = colors[colorIndex]
	currentSquare:draw()
end