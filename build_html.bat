pandoc SOURCE_DOCUMENT.md ^
-o SOURCE_DOCUMENT.html ^
--standalone ^
--mathjax ^
-F pandoc-eqnos ^
-F pandoc-crossref ^
--citeproc ^
-F pandoc-include