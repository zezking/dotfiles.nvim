local leap = require("leap")
if not leap then
	print("leap not loaded")
	return
end
leap.add_default_mappings()
leap.opts.case_sensitive = true
