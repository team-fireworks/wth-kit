local fs = require("@std/fs")
local path = require("@std/path")

local function copy(src: path.pathlike, dest: path.pathlike)
	if fs.type(src) == "dir" then
		fs.createdirectory(dest, {
			makeparents = true,
		})

		for _, file in fs.listdirectory(src) do
			local filePath = path.join(src, file.name)
			local fileDest = path.join(dest, file.name)

			if file.type == "dir" then
				copy(filePath, fileDest)
			else
				fs.copy(filePath, fileDest)
			end
		end
	else
		fs.copy(src, dest)
	end
end

return copy
