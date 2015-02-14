local game = {}
local HC = require "hardoncollider"

function collide(dt, shape_one, shape_two, dx, dy)
    shape_one:move(dx/2, dy/2)
    shape_two:move(-dx/2, -dy/2)
end

function game:addBtRetry()
	if env.game.start == 1 then
		return
	end
	env.menu.buttons = env.butt.new(
		env.menu.buttons,
		{
			txt = "Retry",
			aligne = "center",
			y = 400,
			paddingLeft = 40,
			callback = function()
				env.page = 1
				love.audio.stop(env.sounds.sound1)
				env.game = dofile("game.lua"):new()
			end
		}
	)
end

function game:new()
	game:addBtRetry()
	self.start = 1
	env.collider = HC.new(150)
	env.map = env.collider:addRectangle(0,0, love.window.getHeight(),love.window.getWidth())
	env.collision = dofile("collision.lua")
	env.portals = dofile('portal.lua'):load()
	env.balls = dofile('ball.lua'):load()
	env.bricks = dofile('brick.lua'):load()
	game:loadMap("maps/map1.lua")
	return self
end

function game:loadMap(map)
	local tiles = dofile(map)

	for index, tile in pairs(tiles) do
		env.bricks:new(tile)
	end
end

function game:update(dt)
	env.collider:update(dt)
	env.collision:update(dt)
	env.portals:update(dt)
	env.balls:update(dt)
	env.bricks:update(dt)
	if env.sound == 1 then
		love.audio.play(env.sounds.sound2)
	end
end

function game:keyreleased(button)
end

function game:keypressed(button)
	if button == 'escape' then
		if env.sound == 1 then
			love.audio.stop(env.sounds.sound2)
		end
		env.page = 0
		return
	end
	env.portals:keypressed(button)
end

function game:mousepressed(x, y, button)
	env.portals:mousepressed(x, y, button)
end

function game:draw()
	env.collision:draw()
	env.portals:draw()
	env.balls:draw()
	env.bricks:draw()
end

return game