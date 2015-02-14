local collision = {}

function collision:load()
	return self
end

function collision:update()
	for index, brk in ipairs(env.bricks.table) do
		if env.balls.shape:collidesWith(brk.shape) then
			env.balls.vector = env.balls.vector * -1
			env.balls.shape:move(0, 10 * env.balls.vector)
			if love.mouse.isDown('l') then
				env.balls.dx = brk.shape._polygon.centroid.x - env.balls.shape._center.x
			end
		end
	end
end

function collision:draw()
	return self
end

return collision