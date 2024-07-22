dwRecurse=function(var,start)

	for k,v in pairs(var) do
		type_var=type(v)
		if start then
			root=start..':'..k
		else
			root=k
		end
		if type_var=='nil' then
			print(root..': nil')
		elseif type_var=='boolean' then
			print(root..': boolean')
		elseif type_var=='function' then
			print(root..': function')
		elseif type_var=='table' then
			print(root..': table')
			dwRecurse(v,root)
		else
			print(root..': variable ('..v..')')
		end
	end
end