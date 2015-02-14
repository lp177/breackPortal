env = {}
inspect = require "inspect"

function love.load()
	love.graphics.setBackgroundColor(42,42,42)
	env.page = 0
	env.sound = 1
	env.sounds = {}
	env.frameRate = 200
	env.game = {}
	env.game.start = 0
	env.sounds.sound1 = love.audio.newSource("sounds/sound1.wav", "static")
	env.sounds.sound2 = love.audio.newSource("sounds/sound2.wav", "static")
	env.bigFont = love.graphics.newFont("fonts/ObelixPro-Broken-cyr.ttf", 35)
	env.littleFont = love.graphics.newFont("fonts/ObelixPro-Broken-cyr.ttf", 20)
	env.butt = require "butt":load()
	env.menu = require "menu":load()
	env.setting = require "setting":load()
	-- self.image = love.graphics.newImage("wiki.png")
end

function love.update(dt)
	if env.page == -1 then
		env.setting:update(dt)
	elseif env.page == 0 then
		env.menu:update(dt)
	elseif env.page == 1 then
		env.game:update(dt)
	end
end

function love.resize(w, h)
	env.ww = w
	env.wh = h
end

function love.keyreleased(button)
	if env.page == 1 then
		env.game:keyreleased(button)
	end
end

function love.keypressed(key, isrepeat)
	if isrepeat == 1 then
		return
	end
	if env.page == 1 then
		env.game:keypressed(key)
	end
end

function love.mousepressed(x, y, button)
	if env.page == -1 then
		env.setting:mousepressed(x, y, button)
	elseif env.page == 0 then
		env.menu:mousepressed(x, y, button)
	elseif env.page == 1 then
		env.game:mousepressed(x, y, button)
	end
end

function love:draw()
	if env.page == -1 then
		env.setting:draw()
	elseif env.page == 0 then
		env.menu:draw()
	elseif env.page == 1 then
		env.game:draw()
	end
end