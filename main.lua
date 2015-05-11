require("Takkar")
--Save loacation: C:\Users\Ísak\AppData\Roaming\LOVE\Mesh manipulation
function love.load()
    takkarhlada()
    land = love.graphics.newImage("wolf.jpg")
	
	xy = {}
	table.insert(xy, {x = 200, y = 200})
	table.insert(xy, {x = 600, y = 200})
	table.insert(xy, {x = 600, y = 500})
	table.insert(xy, {x = 200, y = 500})
	
	linur = {}
    
end

function love.update(dt)
    
    punktar = {
	
	{
	    xy[1].x, xy[1].y,  --staðsetning hnitsins
	    0, 0,
		255, 255, 255
	},
	{
	    xy[2].x, xy[2].y,  --staðsetning hnitsins
	    1, 0,
		255, 255, 255
	},
	{
	    xy[3].x, xy[3].y,  --staðsetning hnitsins
	    1, 1,
		255, 255, 255
	},
	{
	    xy[4].x, xy[4].y,  --staðsetning hnitsins
	    0, 1,
		255, 255, 255
	}
	
	}

    mesh = love.graphics.newMesh(punktar, land, "fan")
    mx, my = love.mouse.getPosition()
	
	
	for i = 1, #punktar do
	    linur[i] = {} --Hér bý ég til 4 sub-tables og set svo hvert nalaegd breyta inn i þær.
		linur[i].nalaegd = pyth(mx, xy[i].x, my, xy[i].y)
	end
	
end

function love.draw()

    takkarteikna()

    love.graphics.draw(mesh)
	
	for lykill, gildi in pairs(xy) do
        love.graphics.line(mx, my, gildi.x, gildi.y)
	end
	
	love.graphics.print(#punktar)
	
	for i = 1, #punktar do
	    if linur[i].nalaegd < 20 then
		    love.graphics.circle("fill", xy[i].x, xy[i].y, 10, 100)
			if love.mouse.isDown("l") then
			    xy[i].x = mx
				xy[i].y = my
			end
		end
	end
	
	if love.mouse.isDown("r") then
	    fade(takkar[2].x, takkar[2].y, takkar[2].breidd, takkar[2].haed, 75)
	end
	
end

function love.mousepressed(x, y, button)
   
	--table.insert(xy, {mx = x, my = y})
		--table.insert(punktar, {xy[#punktar + 1].x, xy[#punktar + 1].y})  --Reyna að setja inn nýann punkt
		
		
	---------------------------------------------------------------------------------------------------------------------------------------------------------------- Hér fyrir neðan fara allir takkar kóði	
	if button == "l" and x > takkar[1].x and x < takkar[1].x + takkar[1].breidd and y > takkar[1].y and y < takkar[1].y + takkar[1].haed then --Velja mynd takkinn
		--VELJA MYND HER
	    
    end
	if button == "l" and x > takkar[2].x and x < takkar[2].x + takkar[2].breidd and y > takkar[2].y and y < takkar[2].y + takkar[2].haed then  -- VISTA takkinn
		screen = love.graphics.newScreenshot()
		mynd = love.filesystem.newFile("Screenshot-Mesh-fun.png")
		screen:encode(mynd)
		
		
	end
		
end



function pyth(x1, x2, y1, y2)  --Pýþagóras functionið, get þá gert hvar sem er pyth(x-hnit hlutars 1, x-hnit hlutars 2, y-hnit hlutars 1, y-hnit hlutars 2) og fengið út lengdina á mili þeirra!
    return math.sqrt((x1 - x2)*(x1 - x2) + (y1 - y2)*(y1 - y2))
end

-- insert new punkt, menu for all, choose texture

--monkeypatch starts here
local love_draw = love.draw --store original draw callback
love.draw = function() --overwrite draw callback
	local width,height = love.window.getDimensions()
	local original_width = 800
	local original_height = 600
	local sx,sy = width/original_width,height/original_height
	
	--coordinate system transformation functions only affect love.graphics drawing calls
	love.graphics.push() --store current coordinate transformation
	love.graphics.scale(sx,sy) --scale coordinate system
	love_draw() --call original draw callback
	love.graphics.pop() --restore current coordinate transformation
end

local love_mousepressed = love.mousepressed --store original mousepressed callback
love.mousepressed = function(x,y,button) --overwrite mousepressed callback
	local width,height = love.window.getDimensions()
	local original_width = 800
	local original_height = 600
	local sx,sy = width/original_width,height/original_height
	love_mousepressed(x/sx,y/sy,button) --call original mousepressed callback with scaled coordinates
end

local mouse_getPosition = love.mouse.getPosition
    love.mouse.getPosition = function()
    local width, height = love.window.getDimensions()
	local original_width = 800
	local original_height = 600
	local sx, sy = width/original_width, height/original_height
	x, y = mouse_getPosition()
	x = x/sx
	y = y/sy
	return x, y
end