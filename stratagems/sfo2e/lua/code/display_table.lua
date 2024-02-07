-- not used in live code but good for research
function dwDisplayTable(tbl)
	print('attempting to display table')
	for k,v in pairs(tbl) do
		ty=type(v)
		if ty=="number" or ty=="string" then
			print(k..': '..v)
		else
			print(k..': '..ty)
		end

	end
end
