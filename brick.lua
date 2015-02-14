local brick = {}

function brick:collide(brk, ball)
    env.balls.dx = brk.shape._polygon.centroid.x - ball.shape._center.x
end

function brick:load()
	brick.table = {}
	return brick
end

function brick:basicBrick()
	return {
			x = love.window.getWidth() / 2,
			y = love.window.getHeight() / 2,
			width = 30,
			height = 10,
			orientation = 0,
			callback = nil
		}
end

function brick:new(param)
	local newBrick = brick:basicBrick()

	if param ~= nil then
		for index, value in pairs(param) do
			newBrick[index] = value
		end
	end
	newBrick.shape = env.collider:addRectangle(newBrick.x, newBrick.y, newBrick.width, newBrick.height)
	table.insert(brick.table, newBrick)
end

function brick:update(dt)
end

function brick:draw()
	love.graphics.setColor(255, 255, 255, 255)
	for index, brk in ipairs(brick.table) do
		brk.shape:draw('fill')
	end
end

return brick