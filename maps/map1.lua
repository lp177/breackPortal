local map = {
	{
		x = 0,
		y = 30,
		width = 10,
		height = love.window.getHeight() - 60
	},
	{
		x = love.window.getWidth() - 10,
		y = 30,
		width = 10,
		height = love.window.getHeight() - 60
	},
	{
		rotate = 10,
		x = love.window.getWidth() / 2 - 260,
		y = love.window.getHeight() / 2 - 130,
	},
	{
		x = love.window.getWidth() / 2 - 180,
		y = love.window.getHeight() / 2 - 90,
	},
	{
		x = love.window.getWidth() / 2 - 120,
		y = love.window.getHeight() / 2 - 60,
	},
	{
		x = love.window.getWidth() / 2 - 60,
		y = love.window.getHeight() / 2 - 30,
	},
	{
		x = love.window.getWidth() / 2,
		y = love.window.getHeight() / 2,
	},
	{
		x = love.window.getWidth() / 2 + 60,
		y = love.window.getHeight() / 2 + 30,
	},
	{
		x = love.window.getWidth() / 2 + 120,
		y = love.window.getHeight() / 2 + 60,
	},
	{
		x = love.window.getWidth() / 2 + 180,
		y = love.window.getHeight() / 2 + 90,
	},
	{
		rotate = -10,
		x = love.window.getWidth() / 2 + 260,
		y = love.window.getHeight() / 2 + 130,
	}
}

return map