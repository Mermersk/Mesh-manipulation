

function takkarhlada()

    takkar = {
	{text = "image", x = 730, y = 0, breidd = 70, haed = 30, r = 220, g = 60, b = 120, alpha = 255}, --image takkinn
	{text = "save", x = 730, y = 30, breidd = 70, haed = 30, r = 40, g = 60, b = 120, alpha = 255}  --Save takkinn
	}
	
	a = 255

end

function takkarteikna()

    for lykill, gildi in pairs(takkar) do
	   love.graphics.setColor(gildi.r, gildi.g, gildi.b, gildi.alpha)
	   love.graphics.rectangle("fill", gildi.x, gildi.y, gildi.breidd, gildi.haed)
	   love.graphics.setColor(255, 255, 255, 255)
	   love.graphics.print(gildi.text, gildi.x + 15, gildi.y + 10)
	
	    if mx > gildi.x  and mx < gildi.x + gildi.breidd and my > gildi.y and my < gildi.y + gildi.haed then  --Finn út hvaða takka á að dökka þegar músin er yfir
	        gildi.alpha = 255			
		else
		    gildi.alpha = 100
	    end
	end
	
	if mx > takkar[2].x and mx < takkar[2].x + takkar[2].breidd and my > takkar[2].y and my < takkar[2].y + takkar[2].haed then
	    love.graphics.print("Save loacation: C:/Users/Ísak/AppData/Roaming/LOVE/Mesh manipulation", mx, my, 0, 1, 1, 500, 1)
	end

end

function fade(hlutur_x, hlutur_y, hlutur_breidd, hlutur_haed, timi)
    local r = 255
	local g = 255
	local b = 255
	
	local hradi = 255/timi
	
    love.graphics.setColor(r, g, b, a)
    love.graphics.rectangle("fill", hlutur_x, hlutur_y, hlutur_breidd, hlutur_haed) 
   
	
	a = a - hradi
end