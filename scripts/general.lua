local M = {}

function M.lerp3(t, v1, v2, v3) 
	local a = vmath.lerp(t,v1,v2)
	local b = vmath.lerp(t,v2,v3)
	local c = vmath.lerp(t, a, b)
	return c
end

local MIDDLE_THROW_ADDITIONAL_LERP_OFFSET = 200
function M.middle_point(origin, target)
	-- Generate middle point to implement parabalistic trajectory
	local middle = (origin+target)/2
	local dir = vmath.normalize(target-origin)
	local normal = vmath.cross(dir, vmath.vector3(0, 0, 1))
	local dirmem = math.abs(vmath.dot(normal, vmath.vector3(0, 1, 0)))

	return middle + vmath.vector3(0, MIDDLE_THROW_ADDITIONAL_LERP_OFFSET, 0) * dirmem
end

return M
