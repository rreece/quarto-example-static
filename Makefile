## Makefile for quarto-example

PRINT = @echo '==>  '

QMD_FILES := $(wildcard *.qmd)
HTML_FILES := $(QMD_FILES:%.qmd=docs/%.html)
BIB_TXT_FILES := $(sort $(wildcard bibs/*.txt))

.PHONY: all html project_html pdf publish clean realclean

all: html

## create html
#html: $(HTML_FILES)
#
#docs/%.html: %.qmd _quarto.yml bibs/mybib.bib
#	quarto render $< --to html
#	$(PRINT) "make $@ done."
#
#
#project_html: $(QMD_FILES) _quarto.yml bibs/mybib.bib
#	quarto render --to html
#	$(PRINT) "html done."

html: $(QMD_FILES) _quarto.yml bibs/mybib.bib
	quarto render --to html
	$(PRINT) "html done."

pdf: $(QMD_FILES) _quarto.yml bibs/mybib.bib
	quarto render --to pdf
	$(PRINT) "pdf done."


## create bibs/mybib.bib from bibs/*.txt
bibs/mybib.bib: $(BIB_TXT_FILES)
	@if [ -z "$(BIB_TXT_FILES)" ] ; \
	then \
		echo "==>   ERROR: No bibliography files found in bibs/." ; \
		exit 1 ; \
	else \
		python scripts/markdown2bib.py --out=bibs/mybib.bib $(BIB_TXT_FILES) ; \
	fi
	$(PRINT) "make $@ done."


## publish
publish: html
	quarto publish gh-pages --no-prompt --no-browser


JUNK = *.log
OUTS = docs

## clean up
clean:
	@rm -f $(JUNK)
	$(PRINT) "make $@ done."

## clean up everything including the output
realclean: clean
	@rm -rf $(OUTS)
	$(PRINT) "make $@ done."

