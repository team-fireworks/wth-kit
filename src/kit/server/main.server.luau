local ReplicatedStorage = game:GetService("ReplicatedStorage")

local framework = require("@core/shared/framework")

framework.useModulesFromPath(ReplicatedStorage, "Core", "Client", "providers")
framework.useModulesFromPath(ReplicatedStorage, "Core", "Shared", "providers")
framework.useModulesFromPath(ReplicatedStorage, "Kit", "Client", "providers")
framework.useModulesFromPath(ReplicatedStorage, "Kit", "Shared", "providers")

-- initialize net modules
require("@core/server/generated/net")
require("@kit/server/generated/net")

local root = framework.root:start()
game.Close:Once(function()
	root:finish()
end)
