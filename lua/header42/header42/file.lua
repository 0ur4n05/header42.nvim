-- a function that returns a table of splitted string using the separator
function split (inputstr, sep)
	-- if the separator is null, let it slide
	if sep == nil then
		return
	end
	local t={}		-- the table we return 
	-- splitting the string and putting it in the t table
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do 
		table.insert(t, str)
	end
	return t[#t]	-- returning the last value
end

-- this function decides which comments gonna be used on the outside of the header
-- takes the current session filename 
-- returns an array of starting comment to the ending comment and the padding 
function comments(filename)
	-- splitting the filename using the . to get his extention
	file_extension = split(filename, ".")
	if file_extension == nil then
		vim.notify("No file detected")			-- printing an error message that no file is provided
	end
	local comments = detect_extention(file_extension)
	if comments == nil then 		-- if nil returned then the file type isnt found
		vim.notify("File extention not found, please check it or make an issue in https://github.com/0ur4n05/header42.nvim to add your favourite language")
	end
	return comments
end

-- detects the extention from a dictionary and return the type of comments 
-- returns nil if the file extention isnt found
function detect_extention(extention)
	-- a table of extentions and their comments 
	local extentions = {
    	[{'js', "java", "c", "C", "cpp","CPP","HPP","h","hpp","H","go","cs","php","phtml","phps", "swift", "ts", "rs", "kt", "kts","scala", "d", "css"}] = {"/*","*", "*/"},
    	[{"py","sh", "r","nim","jl","rb","ex","exs","cr","ps1","psm1", "zig", "yaml", "conf"}] = {"#","#","#"},
		[{"lua", "hs"}] = {"--", "-", "--"},
		[{"coffee"}] = {"///", "*", "///"},
		[{"vb"}] = {"\'"}, 
		[{"clojure", "wat"}] = {";;", "*", ";;"}, 
		[{"asm"}] = {";","*", ";"}, 
		[{"html", "xml"}] = {"<!--", "-", "-->"}, 
		[{"vim"}] = {"\"","*", "\""}
	}
	for ext, comm  in pairs(extentions) do		-- iterating over elements
		for i = 1, #ext  do						-- iterating over file extentions 
			if ext[i] == extention then			-- if eql return comm
				return comm
			end
		end
	end	
	return nil		-- else just return nil
end

