local process = require("@std/process")

local function exec(program: string, ...: string): process.processresult
	local args = { program, ... }
	print(`$ {table.concat(args, " ")}`)

	local result = process.run(args, { stdio = "inherit" })
	if result.ok then
		return result
	end

	print(`{program} failed with code {result.exitcode}`)
	return process.exit(result.exitcode)
end

return exec
