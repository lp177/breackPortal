local ball = {}

function ball:load()
	ball.vector = 0
	ball.dx = 0
	ball.dy = 1
	ball.color = {r = 255, g = 255, b = 255, a = 200}
	ball.shape = env.collider:addCircle(love.window.getHeight() / 2, love.window.getWidth() / 2 - 100, 5)
	return ball
end

function ball:verif_launcher(dt)
	if love.keyboard.isDown("up") then
		ball.vector = -1
	elseif love.keyboard.isDown("down") then
		ball.vector = 1
	end
end

function ball:update(dt)
	if love.mouse.isDown('l') then
		env.balls.color = {r = 255, g = 0, b = 0, a = 200}
	else
		ball.color = {r = 255, g = 255, b = 255, a = 200}
	end
	if ball.vector == 0 then
		ball:verif_launcher(dt)
		if ball.vector ~= 0 then
			ball.starter = 1
		end
	end
	if ball.vector == 0 then
		return
	end
	local next
	for i, door in pairs(env.portals.table) do
		if ball.shape:collidesWith(door.shape) then
			if env.portals.mode == 1 then -- Teleportation from other portal
				next = env.portals.table[i + 1] and env.portals.table[i + 1] or env.portals.table[i - 1]
				ball.shape:moveTo(next.shape._polygon.centroid.x, next.y + (16 * ball.vector))
			else -- rebound on portal
				ball.vector = ball.vector * -1
				ball.shape:move(0, 10 * ball.vector)
			end
		end
	end
	if ball.vector ~=0 then
		if ball.vector == -1 then
			ball.shape:move(- dt * env.frameRate * ball.dx, - dt * env.frameRate * ball.dy)
		else
			ball.shape:move(dt * env.frameRate * ball.dx, dt * env.frameRate * ball.dy)
		end
	end
end

function ball:draw()
	love.graphics.setColor(ball.color.r, ball.color.g, ball.color.b, ball.color.a)
	ball.shape:draw('fill')
end

return ball