-----------------------------------------
-- Spell: Horde Lullaby
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	duration = 30;
	staff = StaffBonus(caster, spell);
	pINT = caster:getStat(MOD_INT);
	mINT = target:getStat(MOD_INT);
	dINT = (pINT - mINT);
	resm = applyResistance(caster,spell,target,dINT,37,staff);
	if(resm < 0.5) then
		spell:setMsg(85);--resist message
		return EFFECT_SLEEP_I;
	end
	
	if(target:hasStatusEffect(EFFECT_SLEEP_II) or target:hasStatusEffect(EFFECT_SLEEP_I)) then
		--No effect
		spell:setMsg(75);
	else
		spell:setMsg(237);
		target:addStatusEffect(EFFECT_SLEEP_I,1,0,duration);
	end
	
	return EFFECT_SLEEP_I;
end;