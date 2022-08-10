---
  title: "**TITLE_OF_ARTICLE**"
  author: 
  - Chang Shu^[Institution One, john@example.org]
  - Jane Doe^[Institution Two, jane@example.org]
  institute:
  - Institution One
  - Institution Two
  date: "Dec. 5, 2022"
  bibliography: ["Local_Collection.bib"]
  csl: "./CSL/sustainability.csl"
  link-citations: true
  linkReferences: true
  nameInLink: true
  lang: en-GB
  # numberSections: true
  # sectionsDepth: 2
  # Formatting
  toc_depth: 5
  # toc: true # Table of contents
  # lof: true # List of figures
  # lot: true # List of tables
  toc-title: "List of Contents"
  loftitle: "List of Figures"
  lotTitle: "List of Tables"
  fontsize: 12pt
  linestretch: 1.5
  # autoEqnLabels: true
  tableEqns: true
  subfigGrid: true
  ccsLabelSep: ")&nbsp;"
  figureTitle: "**Figure**"
  figPrefix:
    - "**Figure.**"
    - "**Figures.**"
  tableTitle: "**Table**"
  tblPrefix:
    - "**Table.**"
    - "**Tables.**"
  eqnPrefix:
    - "**Eq.**"
    - "**Eqs.**"
  papersize: a4
  color-links: true # See https://ctan.org/pkg/xcolor for colors
  linkcolor: black
  urlcolor: black
  citecolor: black
  links-as-notes: true
  margin-left: 2cm
  margin-right: 2cm
  margin-top: 2cm
  margin-bottom: 2cm
  documentclass: article # See https://en.wikibooks.org/wiki/LaTeX/Document_Structure#Document_classes for more classes and options
  classoption: [notitlepage, onecolumn, openany]
  # geometry: [a4paper, bindingoffset=0mm, inner=20mm, outer=20mm, top=20mm, bottom=20mm] # See https://ctan.org/pkg/geometry for more options
  # header-includes:
  #   - \linepenalty=10 # the penalty added to the badness of each line within a paragraph (no associated penalty node) Increasing the value makes tex try to have fewer lines in the paragraph.
  #   - \interlinepenalty=0 # value of the penalty (node) added after each line of a paragraph.
  #   - \hyphenpenalty=50 # the penalty for line breaking at an automatically inserted hyphen
  #   - \exhyphenpenalty=50 # the penalty for line breaking at an explicit hyphen
  #   - \binoppenalty=700 # the penalty for breaking a line at a binary operator
  #   - \relpenalty=500 # the penalty for breaking a line at a relation
  #   - \clubpenalty=150 # extra penalty for breaking after first line of a paragraph
  #   - \widowpenalty=150 # extra penalty for breaking before last line of a paragraph
  #   - \displaywidowpenalty=50 # extra penalty for breaking before last line before a display math
  #   - \brokenpenalty=100 # extra penalty for page breaking after a hyphenated line
  #   - \predisplaypenalty=10000 # penalty for breaking before a display
  #   - \postdisplaypenalty=0 # penalty for breaking after a display
  #   - \floatingpenalty = 20000 # penalty for splitting an insertion (can only be split footnote in standard LaTeX)
  #   - \raggedbottom # or \flushbottom
  #   - \usepackage{float} # keep figures where there are in the text
  #   - \floatplacement{figure}{H} # keep figures where there are in the text
  # output: articles::elsevier_article
---

## Abstract

ABSTRACT_PARAGRAPH

### Keywords

KEYWORD

### Highlights

### 2. LEVEL_1_TITLE
#### 2.1 LEVEL_2_TITLE
##### 2.1.1 LEVEL_3_TITLE

CITE_1ST_PAPER [@shu2022added]
CITE_2ND_PAPER [@shu2020dimensional]
CITE_3RD_PAPER [@shu2020air]

* BULLETS_1
* BULLETS_2
* BULLETS_3

a) LIST_ITEM_1
b) LIST_ITEM_2
c) LIST_ITEM_3

![FULL_SIZE_FIGURE_TITLE](.\FIGURES\FULL_SIZE_FIGURE.png){#fig:FULL_SIZE_FIGURE width=100%}

CITE_FULL_SIZE_FIGURE [@fig:FULL_SIZE_FIGURE]

![HALF_SIZE_FIGURE_TITLE](.\FIGURES\HALF_SIZE_FIGURE.png){#fig:HALF_SIZE_FIGURE width=50%}

CITE_HALF_SIZE_FIGURE [@fig:HALF_SIZE_FIGURE]

| HEAD_1 | HEAD_2 |
| ------ | ------ |
| ROW_1  | ROW_2  |
Table: TABLE_TITLE. {#tbl:TABLE}

CITE_TABLE [@tbl:TABLE]

INLINE_EQUATIONS $5 W/m^2$ INLINE_EQUATIONS $T_{opt, mean}^{MJJAS}(°C)$

SINGLE_LINE_EQUATIONS
$$RMSE=\sqrt{\frac{\sum_{i=1}^{N}{(x_{m,i}-x_{o,i})^2}}{N}}$$
$$MAE=\frac{\sum_{i=1}^{N}{\lvert{x_{m,i}-x_{o,i}}\rvert}}{N}$$
$$MBE=\frac{\sum_{i=1}^{N}{(x_{m,i}-x_{o,i})}}{N}$$
$$ CDH = \sum_{T_{air}>28}(T_{air}-28) $$
SINGLE_LINE_EQUATIONS

## Acknowledgements

FUNDING_SOURCES

## References

<div id="refs"></div>

## APPENDIX
