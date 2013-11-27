for $ead in collection()[position() < 10]
let $eadout :=
  for $element in $ead//*[not(./*)]
  let $att := exists($element/attribute::*)
  let $atts := string-join($element/attribute::*/name(), " ")
  let $ele := string-join($element/ancestor-or-self::*/name(), "/")
  let $isempty := not($element/text())
  where not($isempty)
  group by $ele, $atts, $isempty
  return concat($ele, "	", $atts, "	", count($element), "
")

return concat(string-join($eadout), "
---
")