spawntimer = 0
bullets = {}
sprite2 = "cyan2"
sprite3 = "orange2"

SetPPCollision = true

function Update()
 spawntimer = spawntimer + 1
 if spawntimer%40 == 0 then
	local number = math.random(1,2)
	local posx = 80
	local posy = 0
	if number == 1 then
	   local bullet = CreateProjectile(sprite2, posx, posy)
	   bullet.SetVar('type', "cyan2")
	   bullet.SetVar('xspeed', 1.3)
	   bullet.SetVar('yspeed', 0)
	   bullet.ppcollision = true
	   table.insert(bullets, bullet)
   elseif number == 2 then
       local bullet = CreateProjectile(sprite3, posx, posy)
	   bullet.SetVar('type', "orange2")
	   bullet.SetVar('xspeed', 1.4)
	   bullet.SetVar('yspeed', 0)
	   bullet.ppcollision = true
	   table.insert(bullets, bullet)
    end  
end
	   for i=1, #bullets do
		local bullet = bullets[i]
	       local xdifference = Player.x - bullet.x
		   local ydifference = Player.y - bullet.y
		   local xpos = bullet.x + bullet.GetVar('xspeed')
		   local ypos = bullet.y + bullet.GetVar('yspeed')
		   local xspeed = bullet.GetVar('xspeed')
		   local yspeed = bullet.GetVar('yspeed')
		   bullet.Move(-xspeed, -yspeed)
		   bullet.SetVar('xspeed', xspeed)
		   bullet.SetVar('yspeed', yspeed)
		   
		   
		end
end		

function OnHit(bullet)
	local damage = 8
	local color = bullet.GetVar("type")
	if color == "cyan2" and Player.isMoving then
		Player.Hurt(damage)
    elseif color == "orange2" and not Player.isMoving then
	    Player.Hurt(damage)
	 end
end