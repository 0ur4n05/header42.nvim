local write = require("header42.header42.write")			-- writes the header in the file
local update = require("header42.header42.update")

local M = {}

M.header42 = write.write
M.update42 = update.update

return M

