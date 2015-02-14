local setting = {}

function toggleFullscreen(dt)
	if setting.screen then
		setting.screen = false
		love.window.setFullscreen(setting.screen)
	else
		setting.screen = true
		love.window.setFullscreen(setting.screen, "desktop")
	end
end

function setting:load()
	self.settings = {}
	self.screen = false
	self.buttons = {}
	self.buttons = env.butt.new(
		self.buttons,
		{
			txt = "Sound on",
			aligne = "center",
			y = 200,
			paddingLeft = 15,
			callback = toggleSound
		}
	)
	self.buttons = env.butt.new(
		self.buttons,
		{
			txt = "Fullscreen",
			aligne = "center",
			y = 300,
			paddingLeft = 5,
			callback = toggleFullscreen
		}
	)
	self.buttons = env.butt.new(
		self.buttons,
		{
			txt = "Back",
			aligne = "center",
			y = 400,
			paddingLeft = 45,
			callback = function() env.page = 0 end
		}
	)
	return setting
end

function setting:update(dt)
end

function toggleSound(bt)
	if bt.txt == 'Sound on' then
		bt.txt = 'Sound off'
		love.audio.stop()
		env.sound = 0
	else
		bt.txt = 'Sound on'
		love.audio.stop()
		env.sound = 1
	end
end

function setting:mousepressed(x, y, bt)
	env.butt.mousepressed(setting.buttons, x, y, bt)
end

function setting:draw()
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.setBackgroundColor(70,100,100)

	love.graphics.setFont(env.bigFont)
	love.graphics.print('Setting', love.window.getWidth() / 2 - 75, 60)
	env.butt.draw(setting.buttons)
end

return setting
