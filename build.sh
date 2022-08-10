#!/bin/bash
pandoc SOURCE_DOCUMENT.md -o SOURCE_DOCUMENT.html --standalone -F pandoc-crossref --citeproc