-- checking if the badge has been appliyed before if so we update the update date

local M = {}

-- checks if the badge exists
function M.exists(filename)
    file = io.open(filename, "a+")
    up_line = ''               -- the line of updated
    count = 1
    for line in file:lines() do
        if count == 9 then 
            up_line = line
        end
        count = count + 1
    end
    -- checking the line to check if the header is there
    updated_index = string.find(up_line, "Updated: ")
    if updated_index == nil then    -- if the header isnt found dont do anything
        do return end
    end
    updated_index = updated_index + string.len("Updated: ")         -- setting the index of the starting of the line
	update(filename, updated_index,up_line)
    io.close(file)
end

function update(filename, index, line)
    local file = io.open(filename, "r")
    local date = os.date("%d/%m/%Y %X")
    -- TODO: this method isnt efficient, please change it 
    local content = {}       -- reading the content of the file 
	for line in file:lines() do 
	    content[#content + 1] = line
  	end
    -- modifying the date
    content[9] = string.format("%s%s%s", string.sub(content[9], 1, index-1), date , string.sub(content[9], index+string.len(date), string.len(content[9])))
    local file = io.open(filename, "w")
	-- overwriting everyline
	for i=1,#content do
		file:write(content[i])
		file:write('\n')			-- writing the newline after each line
	end	
	vim.cmd("edit")
    io.close(file)
end

return M
