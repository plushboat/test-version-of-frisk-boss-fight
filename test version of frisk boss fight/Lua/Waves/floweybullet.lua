frametimer = 0
bullets = {}

bulletamount = 90
spawntime = 200

SetPPCollision = true

function CreateBullet(x, y)
	local bullet = CreateProjectile("fire", x, y)
	bullet["velx"] = -bullet.x / 100
	bullet["vely"] = -bullet.y / 100
	table.insert(bullets, bullet)
end

function Update()
	
	bulletAmountMultiplier = spawntime / bulletamount / 2
	
	if frametimer % 5 == 0 and frametimer < spawntime then
		local xPos = math.sin(frametimer / (bulletamount * bulletAmountMultiplier) *  math.pi) * (Arena.width / 2 + 40)
		local yPos = math.cos(frametimer / (bulletamount * bulletAmountMultiplier) *  math.pi) * (Arena.height / 2 + 40)
		CreateBullet(xPos, yPos)
	end

	for i = #bullets, 1, -1
	do
		currentBullet = bullets[i]
		
		if frametimer > spawntime then
			currentBullet.Move(currentBullet["velx"], currentBullet["vely"])
	 end
	
	frametimer = frametimer + 1
end

function OnHit(bullet)
	local damage = 15
	if bullet.isactive then
		for i = #bullets, 1, -1
		do
			currentBullet = bullets[i]
			currentBullet.Remove()
			table.remove(bullets, i)
			Player.Hurt(damage)
		 end
	  end
  end
end