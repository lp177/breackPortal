local butt = {}

function butt:load()
	butt.table = {}
	return butt
end

function butt:basicButt()
	return {
			txt = "",
			aligne = "none",
			x = love.window.getWidth() / 2 - (75 / 2),
			y = 200,
			background = {color = {r = 255, g = 255, b = 255, a = 255}},
			txtColor = {r = 0, g = 0, b = 0, a = 255},
			width = 150,
			height = 50,
			callback = nil,
			paddingTop = 10,
			paddingRight = 0,
			paddingBottom = 0,
			paddingLeft = 0,
			hover = {
				background = {color = {r = 255, g = 255, b = 255, a = 170}},
				txtColor = {r = 255, g = 255, b = 255, a = 255}
			}
		}
end

function butt.new(buttons, param)
	local newBt = butt:basicButt()

	if param ~= nil then
		for index, value in pairs(param) do
			newBt[index] = value
		end
	end
	table.insert(buttons, newBt)
	return buttons
end

function butt.mousepressed(buttons, x, y, bt)
	if not bt == 'l' then
		return 0
	end
	for index, button in ipairs(buttons) do
		if love.mouse.getX() >= button.x
			and love.mouse.getX() <= button.x + button.width
			and love.mouse.getY() >= button.y
			and love.mouse.getY() <= button.y + button.height then
			button.callback(button)
		end
	end
end

function butt.draw(buttons)
	love.graphics.setBackgroundColor(42,42,42)
	love.graphics.setFont(env.littleFont)

	for index, bt in ipairs(buttons) do
-- Text aligne
		if bt.aligne == "center" then
			bt.x = love.window.getWidth() / 2 - (bt.width / 2)
		elseif bt.aligne == "right" then
			bt.x = love.window.getWidth() - bt.width
		elseif bt.aligne == "left" then
			bt.x = 0
		end
-- Background & font color
		if love.mouse.getX() <= bt.x
			or love.mouse.getX() >= bt.x + bt.width
			or love.mouse.getY() <= bt.y
			or love.mouse.getY() >= bt.y + bt.height
		then
			love.graphics.setColor(
				bt.background.color.r,
				bt.background.color.g,
				bt.background.color.b,
				bt.background.color.a
			)
			love.graphics.rectangle("fill", bt.x, bt.y, bt.width, bt.height);
			love.graphics.setColor(
				bt.txtColor.r,
				bt.txtColor.g,
				bt.txtColor.b,
				bt.txtColor.a
			)
		else -- Mouse is hover
			love.graphics.setColor(
				bt.hover.background.color.r,
				bt.hover.background.color.g,
				bt.hover.background.color.b,
				bt.hover.background.color.a
			)
			love.graphics.rectangle("fill", bt.x, bt.y, bt.width, bt.height);
			love.graphics.setColor(
				bt.hover.txtColor.r,
				bt.hover.txtColor.g,
				bt.hover.txtColor.b,
				bt.hover.txtColor.a
			)
		end
-- Txt
		love.graphics.print(
			bt.txt,
			bt.x + bt.paddingLeft,
			bt.y + bt.paddingTop
		)
	end
end

return butt
