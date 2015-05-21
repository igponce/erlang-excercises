# 11 Erlang Problems
(Originally  http://weblog.hypotheticalabs.com/?page_id=128 , based on L-99 problem list for Lisp)

Recovered in may'15 from archive.org

##11: 11 Erlang Problems : Working With Lists
###P01: Find the list item in a list:
Example:

1>mylists:last([a, b, c, d]).

d

###P02: Find the last two items in a list:
Example:

1>mylists:last_two([a, b, c, d]).

[c, d]

###P03: Find the Nth item in a list:
Example:

1>mylists:item_at([a, b, c, d], 2).

b

###P04: Find the number of items in a list:
Example:

1>mylists:size([a, b, c, d]).

4

###P05: Reverse a list:
Example:

1>mylists:reverse([a, b, c, d]).

[d, c, b, a]

###P06: Determine if a list is a palindrome:
Example:

1>mylists:is_palindrome([a, b, b, a]).

true

###P07: Flatten a nested list structure:
Example:

1>mylists:flatten([a, b, [c, d], e, [f, [g, h]]]).

[a, b, c, d, e, f, g, h]

###P08: Eliminate consecutive duplicates of list items:
Example:

1>mylists:compress([a, a, a, b, b, c, d, e, f, f]).

[a, b, c, d, e, f]

###P09: Pack consecutive duplicates of list items into sublists:
Example:

1>mylists:pack([a, a, a, b, b, c, d, e, f, f]).

[[a, a, a], [b, b], c, d, e, [f, f]]

###P10: Run-length encoding of a list:
Example:

1>mylists:rle([a, a, a, b, b, c, d, e, f, f]).

[{a, 3}, {b, 2}, {c, 1}, {d, 1}, {e, 1}, {f, 2}]

###P11: Decode a run-length encoded list:
Example:

1>mylists:rld([{a, 3}, {b, 2}, {c, 1}, {d, 1}, {e, 1}, {f, 2}]).

[a, a, a, b, b, c, d, e, f, f]
