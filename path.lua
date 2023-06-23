local _MODULE = {}
local separator = package.config:sub(1, 1)
_MODULE.separator = separator
local function dedup(s)
	return s:gsub(separator .. "+", separator)
end
_MODULE.dedup = dedup
local function join(...)
	return dedup(table.concat({
		...,
	}, separator))
end
_MODULE.join = join
local function trim(...)
	return join(...):gsub(("^" .. tostring(separator) .. "+"), ""):gsub((tostring(separator) .. "+$"), "")
end
_MODULE.trim = trim
local function pad(...)
	return separator .. trim(...) .. separator
end
_MODULE.pad = pad
local function lead(...)
	return separator .. trim(...)
end
_MODULE.lead = lead
local function trail(...)
	return trim(...) .. separator
end
_MODULE.trail = trail
local function basename(s)
	return s:match(("[^" .. tostring(separator) .. "]*$"))
end
_MODULE.basename = basename
local function dirname(s)
	return s:gsub(("[^" .. tostring(separator) .. "]*$"), "")
end
_MODULE.dirname = dirname
return _MODULE
-- Compiled with Erde 0.6.0-1
-- __ERDE_COMPILED__
