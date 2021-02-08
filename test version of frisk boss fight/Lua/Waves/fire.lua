frametimer = 0
spawndelay = 0
bullets = {}

SetPPCollision = true

function CreateBullet(x, y)
	local bullet = CreateProjectile("fire", x, y)
	xDifference = Player.x - bullet.x
	yDifference = Player.y - bullet.y
	lengthSquared = math.pow(xDifference, 2) + math.pow(yDifference, 2)
	length = math.sqrt(lengthSquared)
	bullet["velx"] = xDifference / length * 2
	bullet["vely"] = yDifference / length * 2
	bullet["frame_spawned"] = frametimer
	table.insert(bullets, bullet)
end

function Update()

	if frametimer % 120 == 0 then
		for i = 0, 4, 1
		do
		
		
	if spawntimer == 0 then
		local randX = math.random(0, Arena.width / 2 + 40)
		local randY = 0
		if randX < Arena.width / 2 + 20 then
			randY = math.random(Arena.height / 2 + 20, Arena/height / 2 + 40)
		else
			randY = math.random(0, Arena.height / 2 + 40)
		end
		
		randomizer = math.random(0, 3)
		if randomizer == 1 then
			randX = -randX
		elseif randomizer == 2 then
			randY = -randY
		elseif randomizer == 3 then
			randX = -randX
			randY = -randY
		end
		CreateBullet(randX, randY)
		
		spawndelay = math.random(15, 45)
	end
		
			local xPos = -Arena.width / 2 + i * Arena.width / 4
			local yPos = Arena.height / 2 + 50
			CreateBullet(xPos, yPos)
		end
	end

	for i = #bullets, 1, -1
	do
		currentBullet = bullets[i]
		bulletAge = frametimer - currentBullet["frame_spawned"]
		
		if bulletAge > 45 then
			currentBullet.Move(currentBullet["velx"], currentBullet["vely"])
		end
		
		if currentBullet.y < -170 then
			currentBullet.Remove()
			table.remove(bullets, i)
		end
	end
	frametimer = frametimer + 1
	spawndelay =spawndelay - 1
end