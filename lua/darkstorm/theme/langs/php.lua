local M = {}
M.get = function(c)
	return {
		["@tag.php"] = { fg = c.orange },
		["@type.php"] = { fg = c.fg },
		["@punctuation.bracket.php"] = { fg = c.fg },
		["@punctuation.delimiter.php"] = { fg = c.fg },
		["@module.php"] = { fg = c.fg },
		["@function.method.php"] = { fg = c.yellow },
		["@function.method.call.php"] = { fg = c.yellow },
		["@function.call.php"] = { fg = c.yellow },
		["@constructor.php"] = { fg = c.yellow },
		["@variable.php"] = { fg = c.magenta },
		["@variable.builtin.php"] = { fg = c.magenta },
		["@property.php"] = { fg = c.magenta },
		["@attribute.phpdoc"] = { fg = c.green1, bold = true, underline = true },
		["@none.phpdoc"] = { fg = c.green1 },
		["@comment.phpdoc"] = { fg = c.green1 },
		["@comment.documentation.php"] = { fg = c.green1 },
		["@type.phpdoc"] = { fg = c.fg, italic = true },
		["@nospell.phpdoc"] = { fg = c.magenta },
	}
end

M.get_ts_query = function()
	return [[
[
  (php_tag)
  "?>"
] @tag

; Keywords

[
  "and"
  "as"
  "break"
  "case"
  "catch"
  "class"
  "clone"
  "const"
  "continue"
  "declare"
  "default"
  "do"
  "echo"
  "else"
  "elseif"
  "enddeclare"
  "endfor"
  "endforeach"
  "endif"
  "endswitch"
  "endwhile"
  "enum"
  "exit"
  "extends"
  "finally"
  "fn"
  "for"
  "foreach"
  "function"
  "global"
  "goto"
  "if"
  "implements"
  "include"
  "include_once"
  "instanceof"
  "insteadof"
  "interface"
  "match"
  "namespace"
  "new"
  "or"
  "print"
  "require"
  "require_once"
  "return"
  "switch"
  "throw"
  "trait"
  "try"
  "use"
  "while"
  "xor"
  "yield"
  (abstract_modifier)
  (final_modifier)
  (readonly_modifier)
  (static_modifier)
  (visibility_modifier)
] @keyword

(yield_expression "from" @keyword)
(function_static_declaration "static" @keyword)

; Variables

(relative_scope) @variable.builtin

(variable_name) @variable

(method_declaration name: (name) @constructor
  (#eq? @constructor "__construct"))

(object_creation_expression [
  (name) @constructor
  (qualified_name (name) @constructor)
])

((name) @constant
 (#match? @constant "^_?[A-Z][A-Z\\d_]+$"))
((name) @constant.builtin
 (#match? @constant.builtin "^__[A-Z][A-Z\d_]+__$"))
(const_declaration (const_element (name) @constant))

; Types

(primitive_type) @type.builtin
(cast_type) @type.builtin
(named_type [
  (name) @type
  (qualified_name (name) @type)
]) @type
(named_type (name) @type.builtin
  (#any-of? @type.builtin "static" "self"))

; Functions

(array_creation_expression "array" @function.builtin)
(list_literal "list" @function.builtin)
(exit_statement "exit" @function.builtin "(")

(method_declaration
  name: (name) @function.method)

(function_call_expression
  function: [(qualified_name (name)) (name)] @function)

(scoped_call_expression
  name: (name) @function)

(member_call_expression
  name: (name) @function.method)

(function_definition
  name: (name) @function)

; Member

(property_element
  (variable_name) @property)

(member_access_expression
  name: (variable_name (name)) @property)
(member_access_expression
  name: (name) @property)

; Basic tokens
[
  (string)
  (encapsed_string)
  (heredoc)
  (heredoc_body)
  (nowdoc_body)
] @string
(boolean) @constant.builtin
(null) @constant.builtin
(integer) @number
(float) @number
(comment) @comment

((name) @variable.builtin
 (#eq? @variable.builtin "this"))


((comment)+ @comment.documentation
  (#match? @comment.documentation "^/\\*\\*"))

  ]]
end
return M
