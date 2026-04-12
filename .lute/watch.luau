local config = require("@config/project")
local copy = require("@scripts/lib/copy")
local exec = require("@scripts/lib/exec")
local fs = require("@std/fs")
local process = require("@std/process")
local task = require("@lute/task")

if fs.exists(config.output) then
	fs.removedirectory(config.output, { recursive = true })
end
copy(config.source, config.output)

local sourcemapArgs = { "sourcemap", "-o", "sourcemap.json", config.rojoProjects.sourcemap }
exec("rojo", table.unpack(sourcemapArgs))
task.wait(1)

table.insert(sourcemapArgs, 1, "rojo")
table.insert(sourcemapArgs, "--watch")

task.spawn(process.run, sourcemapArgs, { stdio = "inherit" } :: any)
task.spawn(process.run, { "darklua", "process", config.source, config.output, "--watch" }, { stdio = "inherit" } :: any)
for _, file in config.blinkFiles do
	task.spawn(process.run, { "blink", file, "--yes", "--watch" }, { stdio = "inherit" } :: any)
end

task.delay(1, process.run, { "rojo", "serve", config.rojoProjects.default }, { stdio = "inherit" } :: any)
