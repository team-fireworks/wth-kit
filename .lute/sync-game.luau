local process = require("@lute/process")
local copy = require("./lib/copy")
local fs = require("@std/fs")
local path = require("@std/path")
local config = require("../wth.config")

if not process.run({ "lute", "check-game" }, { stdio = "inherit" }).ok then
	print("Failed to fetch game repository")
	return process.exit(1)
end

for _, syncItem in config.game.syncItems do
	if fs.exists(syncItem) and fs.type(syncItem) == "dir" then
		fs.removedirectory(syncItem, { recursive = true })
	end

	print("Synchronizing", syncItem)
	copy(path.join(config.game.directory, syncItem), syncItem)
end
