local portal = {}

function portal:load()
	portal.mode = 1
	portal.table = {}
	portal:new()
	portal:new({
		x = 200,
		y = 0,
		color = {r = 240, g = 147, b = 0, a = 255},
		keyboard = {left = "a", right = "d"}
	})
	return portal
end

function portal:new(param)
	local newPortal = portal:basicPortal()

	if param ~= nil then
		for index, value in pairs(param) do
			newPortal[index] = value
		end
	end
	newPortal.shape = env.collider:addRectangle(newPortal.x, newPortal.y, newPortal.width, newPortal.height)
	table.insert(portal.table, newPortal)
end

function portal:update(dt)
	env.collider:update(dt)
	for index, door in pairs(portal.table) do
		if love.keyboard.isDown(door.keyboard.right)
			and door.x < love.window.getWidth()
			and not door.shape:collidesWith(env.balls.shape)
		then
			door.shape:move(dt * env.frameRate, 0)
		end
		if love.keyboard.isDown(door.keyboard.left)
			and door.x > 0
			and not door.shape:collidesWith(env.balls.shape)
		then
			door.shape:move(- dt * env.frameRate, 0)
		end
	end
end

function portal:draw()
	for index, door in pairs(portal.table) do
		if portal.mode == 1 then
			love.graphics.setColor(door.color.r, door.color.g, door.color.b, door.color.a)
		else
			love.graphics.setColor(255, 255, 255, 200)
		end
		door.shape:draw('fill')
	end
end

function portal:keypressed(button)
	if button == " " then
		if portal.mode == 1 then
			portal.mode = 0
		else
			portal.mode = 1
		end
	end
end

function portal:mousepressed(x, y, button)
	if button == "r" then
		if portal.mode == 1 then
			portal.mode = 0
		else
			portal.mode = 1
		end
	end
end

function portal:basicPortal()
	return {
			x = love.window.getWidth() / 2,
			y = love.window.getHeight() - 10,
			width = 100,
			height = 10,
			color = {r = 0, g = 156, b = 227, a = 255},
			orientation = 0,
			keyboard = {left = "left", right = "right"},
			callback = nil
		}
end

return portal