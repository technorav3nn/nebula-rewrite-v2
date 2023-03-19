-- stolen xd
local getidentity = getidentity
	or getthreadidentity
	or get_thread_identity
	or getthreadcontext
	or get_thread_context
	or (syn and syn.get_thread_identity)
local setidentity = setidentity
	or setthreadidentity
	or set_thread_identity
	or setthreadcontext
	or set_thread_context
	or (syn and syn.set_thread_identity)

-- also stolen xd
securecall = function(func, scr, ...)
	assert(
		typeof(scr) == "Instance",
		"invalid argument #1 to '?' (LocalScript or ModuleScript expected, got " .. typeof(scr) .. ") "
	)
	assert(
		scr.ClassName == "LocalScript" or scr.ClassName == "ModuleScript",
		"invalid argument #1 to '?' (LocalScript or ModuleScript expected, got " .. typeof(scr) .. ") "
	)
	local scriptFenv = getfenv().script
	local identity = getidentity()

	getfenv().script = scr
	setidentity(2)

	local success, err = pcall(func, ...)
	setidentity(identity)
	getfenv().script = scriptFenv

	if not success and err then
		error(err)
	end
end
