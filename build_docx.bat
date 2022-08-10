pandoc SOURCE_DOCUMENT.md ^
-o SOURCE_DOCUMENT.docx ^
--standalone ^
--mathjax ^
-F pandoc-eqnos ^
-F pandoc-crossref ^
--citeproc ^
--reference-doc=CUSTOM_DOC_STYLE.docx