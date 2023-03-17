-- Compiled with roblox-ts v2.1.0
local TS = require(script.Parent.Parent.Parent.include.RuntimeLib)
local Reflect = TS.import(script, script.Parent.Parent.Parent, "include", "node_modules", "@flamework", "core", "out").Reflect
local makeHello = TS.import(script, script.Parent.Parent.Parent, "shared", "src", "module").makeHello
local _core = TS.import(script, script.Parent.Parent.Parent, "include", "node_modules", "@flamework", "core", "out")
local Flamework = _core.Flamework
local Service = _core.Service
local Controller = _core.Controller
local MainService
do
	MainService = setmetatable({}, {
		__tostring = function()
			return "MainService"
		end,
	})
	MainService.__index = MainService
	function MainService.new(...)
		local self = setmetatable({}, MainService)
		return self:constructor(...) or self
	end
	function MainService:constructor()
	end
	function MainService:onInit()
		print("init mainservice")
	end
	function MainService:myMethod()
		return "mainservice myMethod"
	end
end
-- (Flamework) MainService metadata
Reflect.defineMetadata(MainService, "identifier", "game/src/main.client@MainService")
Reflect.defineMetadata(MainService, "flamework:implements", { "$:flamework@OnInit" })
Reflect.decorate(MainService, "$:flamework@Service", Service, {})
local MainController
do
	MainController = setmetatable({}, {
		__tostring = function()
			return "MainController"
		end,
	})
	MainController.__index = MainController
	function MainController.new(...)
		local self = setmetatable({}, MainController)
		return self:constructor(...) or self
	end
	function MainController:constructor(mainService)
		self.mainService = mainService
	end
	function MainController:onInit()
		print("init maincontroller")
		print(self.mainService:myMethod())
	end
end
-- (Flamework) MainController metadata
Reflect.defineMetadata(MainController, "identifier", "game/src/main.client@MainController")
Reflect.defineMetadata(MainController, "flamework:parameters", { "game/src/main.client@MainService" })
Reflect.defineMetadata(MainController, "flamework:implements", { "$:flamework@OnInit" })
Reflect.decorate(MainController, "$:flamework@Controller", Controller, {})
Flamework.ignite()
print(makeHello("client"))
return {
	MainService = MainService,
	MainController = MainController,
}
