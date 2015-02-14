local menu = {}

function menu:load()
	self.buttons = {}
	self.buttons = env.butt.new(
		self.buttons,
		{
			txt = "Play",
			aligne = "center",
			y = 200,
			paddingLeft = 50,
			callback = function()
				env.page = 1
				love.audio.stop(env.sounds.sound1)
				if env.game.start == 0 then
					env.game = dofile("game.lua"):new()
				end
			end
		}
	)
	self.buttons = env.butt.new(
		self.buttons,
		{
			txt = "Setting",
			aligne = "center",
			y = 300,
			paddingLeft = 25,
			callback = function() env.page = -1 end
		}
	)
	self.buttons = env.butt.new(
		self.buttons,
		{
			txt = "Exit",
			aligne = "center",
			y = 500,
			paddingLeft = 50,
			callback = function() os.exit(0) end
		}
	)
	return self
end

function menu.update(dt)
	if env.sound then
		love.audio.play(env.sounds.sound1)
	end
end

function menu:mousepressed(x, y, bt)
	env.butt.mousepressed(menu.buttons, x, y, bt)
end

function menu:draw()
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.setBackgroundColor(42,42,42)
	love.graphics.setFont(env.bigFont)
	love.graphics.print('Breack Portal', love.window.getWidth() / 2 - 150, 60)
	env.butt.draw(menu.buttons)
end

return menu
