-- Disable the "lowercase-global" diagnostic
---@diagnostic disable: lowercase-global

ignore = {
	-- Ignore errors related to unused variables
	"111",
	-- Ignore errors related to unused variables starting with an underscore (_)
	"212/_.*",
	-- Ignore errors related to unused function arguments
	"214",
	-- Ignore errors related to redefined variables
	"121",
	-- Ignore errors related to redefined function arguments
	"122",
}

-- Specify the global variables that should be recognized as valid
read_globals = {
	"vim",
}
