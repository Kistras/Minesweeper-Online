function lerp3(t, v1, v2, v3) 
	local a = vmath.lerp(t,v1,v2)
	local b = vmath.lerp(t,v2,v3)
	local c = vmath.lerp(t, a, b)
	return c
end