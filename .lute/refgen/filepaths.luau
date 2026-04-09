local docs = require("@config/docs")
local path = require("@std/path")

return {
	api = path.join(docs.directory, docs.documentationPaths.api),
	mechanics = path.join(docs.directory, docs.documentationPaths.mechanics),
}
