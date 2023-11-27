function dwGetAbilityValue(i) --based on an idea borrowed with thanks from Holic's 3e mod

	if string.find(chargen.ability[i].roll,"/") then
		return 18
	else
		return tonumber(chargen.ability[i].roll)
	end

end

function dwAdjustShownAbilityValue(abil,adjust)
	base_value=dwGetAbilityValue(abil)
	if adjust==0 then 
		if dwHideExStr then 
			return base_value,base_value
		else 
			return base_value,chargen.ability[abil].roll
		end
	else
		value=base_value + adjust
		if value==18 and adjust > 0 and abil==1 and not dwHideExStr then
			return value,"18/00"
		else
			return value,value
		end
	end

end

function dwShowAdjustedAbilityValue(abil,adjust)
	_,v=dwAdjustShownAbilityValue(abil,adjust)
	return v


end
