local fs = require("@std/fs")
local process = require("@std/process")
local config = require("../wth.config")

if fs.exists(config.game.directory) then
	print("Removing game directory...")
	fs.removedirectory(config.game.directory, { recursive = true })
end

local gitVersionString = process.run({ "git", "--version" }).stdout
local gitVersion = string.split(gitVersionString, " ")[3]
local components = string.split(gitVersion, ".")

local major = tonumber(components[1]) or 0
local minor = tonumber(components[2]) or 0

return process.run(
	if major >= 3 or (major == 2 and minor >= 49)
		then {
			"git",
			"clone",
			"--depth=1",
			"--revision",
			"main",
			config.game.remote,
			config.game.directory,
		}
		else {
			"git",
			"clone",
			"--depth=1",
			"--branch",
			"main",
			config.game.remote,
			config.game.directory,
		},
	{ stdio = "inherit" }
)
