local ReplicatedStorage = game:GetService("ReplicatedStorage")

local framework = require("@core/shared/framework")

framework.useModulesFromPath(ReplicatedStorage, "Core", "Client", "providers")
framework.useModulesFromPath(ReplicatedStorage, "Core", "Shared", "providers")
framework.useModulesFromPath(ReplicatedStorage, "Kit", "Client", "providers")

-- initialize net modules
require("@core/client/generated/net")
require("@kit/client/generated/net")

local root = framework.root:start()
game.Close:Once(function()
	root:finish()
end)
