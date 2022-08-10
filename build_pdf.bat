pandoc SOURCE_DOCUMENT.md ^
-o SOURCE_DOCUMENT.pdf ^
--standalone ^
--mathjax ^
-F pandoc-eqnos ^
-F pandoc-crossref ^
--citeproc