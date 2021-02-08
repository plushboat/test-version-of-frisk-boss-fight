-- A basic monster script skeleton you can copy and modify for your own creations.
comments = {"Just Frisk.", "The Battle between the savior and the destroyer.", "Your Sins Crack your SOUL.", "Determination flows through your veins.", "Don't stop Swinging Partner."}
commands = {"Insult", "Apologize", "Threaten"}
randomdialogue = {"...", "Determination.", "......"}

sprite = "frisk2" --Always PNG. Extension is added automatically.
name = "Frisk"
hp = 20
atk = 120
def = 140
xp = 20000
gold = 999
check = "Their Determination is stronger than yours. They won't give up easily. Keep slashing."
dialogbubble = "rightwide" -- See documentation for what bubbles you have available.
canspare = false
cancheck = true
AllowPlayerDef = true
unescape = true
threatcounter = 0

SetPPCollision = true

-- Happens after the slash animation but before 
function HandleAttack(attackstatus)
    if attackstatus == -1 then
        -- player pressed fight but didn't press Z afterwards
    else
        -- player did actually attack
    end
end
 
 Music = ("frisk")
 function GameEvent(BeforeDamageCaculation)
	SetDamage(9999999999999999999)
end

-- This handles the commands; all-caps versions of the commands list you have above.
function HandleCustomCommand(command)
    if command == "INSULT" then
        currentdialogue = {"shut up."}
		BattleDialog({"You Tell Frisk that they failed in saving Monsterkind."})
    elseif command == "APOLOGIZE" then
        currentdialogue = {"...."}
		BattleDialog({"You Apologize to Frisk.... [w:30]But Nothing Happened."})
    elseif command == "THREATEN" then
        if threatcounter == 0 then
			currentdialogue = {"stop it."}
			BattleDialog({"[color:ff0000] [effect:shake]You Tell Frisk that you're going to stab them right in the chest."})
		elseif threatcounter == 1 then
			currentdialogue = {"I SAID STOP IT."}
			BattleDialog({"[color:ff0000] [effect:shake]You Tell Frisk that You're gonna tear their body off piece by piece."})
		elseif threatcounter == 2 then
			currentdialogue = {"yuck."}
			BattleDialog({"You and Frisk stop fighting for a while and talk about the Big Marsh and JimJam Joe Fanfics, then get back to fighting."})
		else
			currentdialogue = {"I hope you die."}
			BattleDialog({"[color:ff0000] [effect:shake]You Tell Frisk that their death will be long and painful."})
		end	
		threatcounter = threatcounter + 1
	end		
end	