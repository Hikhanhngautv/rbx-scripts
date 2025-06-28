--[[

	Rayfield Interface Suite
	by Sirius

	shlex | Designing + Programming
	iRay  | Programming
	Max   | Programming

]]

if debugX then
	warn('Initialising Rayfield')
end

local function getService(name)
	local service = game:GetService(name)
	return if cloneref then cloneref(service) else service
end
