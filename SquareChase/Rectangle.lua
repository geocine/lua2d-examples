class "Rectangle" {
	name = "Rectangle";
	type = "Rectangle";
	x = 0;
	y = 0;
	width = 0;
	height = 0;
	color = {};
}

function Rectangle:__init(x, y, width,height)
	self.x = x
	self.y = y
	self.width = width
	self.height = height
end

function Rectangle:draw()
	love.graphics.setColor(self.color.r,self.color.g,self.color.b)
	love.graphics.rectangle( "fill",self.x,self.y,self.width,self.height)
end

function Rectangle:contains(mx,my)
   return mx > self.x and  mx < self.x+self.width and my > self.y and my < self.y+self.height
end