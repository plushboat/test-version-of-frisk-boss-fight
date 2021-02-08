encountertext = "Frisk Stands in your way." 

nextwaves = {"floweybullet"}
wavetimer = 4.0
arenasize = {155, 130}


enemies = {
"frisk2"
}

autolinebreak = true

enemypositions = {
{0, 0}
}

SetGlobal("intro", true)

-- A custom list with attacks to choose from. Actual selection happens in EnemyDialogueEnding(). Put here in case you want to use it.
possible_attacks = {"floweybullet", "determinationstar", "soul", "bone", "fire"}

function EncounterStarting()
	State("ENEMYDIALOGUE")
	Player.lv = 20
	Player.hp = 99
	Player.def = 120
	invulnerabilitySeconds = 0
	Player.name = "You"
	Audio.LoadFile("frisk")
	Audio.Pause("frisk")
	Inventory.AddCustomItems({"Pie?", "Monster Souls"}, {0, 0})
	Inventory.AddCustomItems({"The Cookie", "borger"}, {0, 0})
	Inventory.SetInventory({"Pie?", "Monster Souls", "The Cookie", "borger"})
end

function EnemyDialogueStarting()
	 local intro = GetGlobal("intro")
	 if intro == true then
	   enemies[1].SetVar('currentdialogue', {"...", "You Killed them.", "All of them.[w:30] But why?", "To Satsisfy yourself?", "ha..[w:30] to even know you CONTROLLED ME.", "Pretty Ironic isn't it?", "You made me kill them. So Now..", "[effect:shake][color:ff0000]I[w:4]'[w:4]l[w:4]l[w:4] k[w:4]i[w:4]l[w:4]l[w:4] y[w:4]o[w:4]u[w:4]."})
	   SetGlobal("intro", false)
	 end
end

function EnemyDialogueEnding()
    nextwaves = { possible_attacks[math.random(#possible_attacks)] }
	if nextwaves[1] == "bone" then
		wavetimer = 10.0
		arenasize = {190, 130}
	else
		wavetimer = 4.0
		arenasize = {155, 130}
		Audio.Unpause("frisk")
		if nextwaves[1] == "soul" then
		wavetimer = 7.0
		arenasize = {120, 190}
	else
		wavetimer = 4.0
		arenasize = {155, 130}
		Audio.Unpause("frisk")
		if nextwaves[1] == "fire" then
		wavetimer = 12.0
		arenasize = {250, 160}
	else
		wavetimer = 4.0
		arenasize = {155, 130}
		Audio.Unpause("frisk")
		if nextwaves[1] == "floweybullet" then
		wavetimer = 3.0
		arenasize = {120, 169}
	else
		wavetimer = 4.0
		arenasize = {155, 130}
		Audio.Unpause("frisk")
	end
end

function DefenseEnding() --This built-in function fires after the defense round ends.
    encountertext = RandomEncounterText() --This built-in function gets a random encounter text from a random enemy.
	Audio.Unpause("frisk")
end

function HandleSpare()
    State("ENEMYDIALOGUE")
end

function HandleItem(ItemID)
if ItemID == "PIE?" then
		Player.Hurt(25)
		BattleDialog({"You Ate the pie? It was rubber and it hurt your soul! -25 HP."})
   elseif ItemID == "MONSTER SOULS" then
		BattleDialog({"You Fused with the Monster Souls. You recovered 88 HP."})
		Player.Heal(88)
end

if ItemID == "THE COOKIE" then
		Player.Heal(99)
		BattleDialog({"You ate The Cookie, You feel your stomach grow more powerful. Your HP was Maxed out."})
	elseif ItemID == "BORGER" then
		Player.Heal(55)
		BattleDialog({"what a Tasty borger! you recovered 55 HP."})
    end
   end
  end
 end 
end