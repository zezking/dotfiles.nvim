local leap = require("leap")
if not leap then
	print("leap not loaded")
	return
end

leap.opts.case_sensitive = true
