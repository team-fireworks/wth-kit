local time = require("@std/time")

return {
	game = {
		remote = "https://github.com/team-fireworks/wth.git",
		directory = "game",
		fetchFrequency = time.duration.days(1),
		syncItems = {
			"src/core",
			"src/libs",
			"pesde.toml",
			"patches",
			"rokit.toml",
			".zed",
			".vscode",
		},
	},
}
