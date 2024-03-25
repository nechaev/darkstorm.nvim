((comment)+ @comment.documentation
  (#match? @comment.documentation "^/\\*\\*"))

[
  (php_tag)
  "?>"
] @tag
