### Things to install:

* pandoc  https://pandoc.org/installing.html do not use this one, use the python version instead. conda/pip install pandoc. Activate the conda for all the terminals so that VScode can recognize it automatically.

* LaTeX MiKTeX(Windows) - update packages to eliminate warnings.

* pip3 install pandoc-crossref

* pip3 install pandoc-include

* pip3 install pandoc-eqnos

* setup lua filters https://github.com/pandoc/lua-filters : use "pandoc -v" to check the pandoc user directory, then unpack the lua-filters there.

* citeproc  https://github.com/jgm/citeproc currently built in pandoc, so no need to install it anymore.
