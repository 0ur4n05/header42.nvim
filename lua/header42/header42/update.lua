-- checking if the badge has been appliyed before if so we update the update date

-- checks if the badge exists
function exists(filename)
    file = io.open(filename, "r")
    up_line = ''               -- the line of updated
    count = 1
    for line in file:lines() do
        if count == 9 then 
            up_line = line
        end
        count = count + 1
    end
    -- checking the line to check if the header is there
    io.close(file)
    updated_index = string.find(up_line, "Updated: ")
    if updated_index == nil then    -- if the header isnt found dont do anything
		return false 
    end
	return true
end

local M = {}

function M.update()
	filename = vim.api.nvim_buf_get_name(0)		-- current filename
    local file = io.open(filename, "r")
    local content = {}       -- reading the content of the file 
	index = 0
	if exists(filename) == true then 
		-- TODO: this method isnt efficient, please change it 
		for line in file:lines() do 
			content[#content + 1] = line
		end
		index =  string.find(content[9], "Updated: ") + string.len("Updated: ")
	else 
		do return end
	end
    local date = os.date("%d/%m/%Y %X")
    -- modifying the date
    content[9] = string.format("%s%s%s", string.sub(content[9], 1, index-1), date , string.sub(content[9], index+string.len(date), string.len(content[9])))
    local file = io.open(filename, "w")
	-- overwriting everyline
	for i=1,#content do
		file:write(content[i])
		file:write('\n')			-- writing the newline after each line
	end	
    io.close(file)
	vim.cmd("edit")
end

return M
