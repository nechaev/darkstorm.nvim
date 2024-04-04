local M = {}
M.get = function(c)
	return {
		["@type.css"] = { fg = c.yellow },
		["@class.name.css"] = { fg = c.yellow },
		["@class.selector.css"] = { fg = c.fg },
		["@id.name.css"] = { fg = c.yellow },
		["@property.id.css"] = { fg = c.yellow },
		["@property.value.unit"] = { fg = c.lime },
		["@id.selector.css"] = { fg = c.yellow },
		["@property.name.css"] = { fg = c.fg },
		["@property.value.css"] = { fg = c.lime },
		["@punctuation.delimiter.css"] = { fg = c.fg },
		["@function.css"] = { fg = c.yellow },
		["@punctuation.bracket.css"] = { fg = c.fg },
		["@attribute.css"] = { fg = c.yellow },
	}
end

M.get_ts_query = function()
	return [[
(comment) @comment

(tag_name) @tag
"@media" @keyword
"@import" @keyword
"@charset" @keyword
"@namespace" @keyword
"@supports" @keyword
"@keyframes" @keyword
(at_keyword) @keyword
(to) @keyword
(from) @keyword
(important) @keyword

(property_name) @property.name
(id_name) @property.id
(class_name) @class.name
(class_selector) @class.selector
(id_selector) @id.selector

(string_value) @string
(integer_value) @number
(float_value) @number
(plain_value) @property.value
(unit) @property.value.unit

(function_name) @function

"," @punctuation.delimiter
":" @punctuation.delimiter

"~" @operator
">" @operator
"+" @operator
"-" @operator
"*" @operator
"/" @operator
"=" @operator
"^=" @operator
"|=" @operator
"~=" @operator
"$=" @operator
"*=" @operator

"and" @operator
"or" @operator
"not" @operator
"only" @operator
  ]]
end

return M
