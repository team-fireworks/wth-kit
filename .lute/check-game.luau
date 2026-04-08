-- we don't even need to use the time lib but not requiring it breaks
-- durations???? what the hell
require("@lute/time")

local process = require("@std/process")
local fs = require("@std/fs")
local config = require("../wth.config")

if
	not fs.exists(config.game.directory)
	or os.time() - fs.metadata(config.game.directory).created:toseconds() > config.game.fetchFrequency:toseconds()
then
	process.run({ "lute", "fetch-game-repository" })
end
