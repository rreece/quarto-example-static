# Makefile for quarto-example

PRINT = @echo '==>  '

QMD_FILES := $(wildcard *.qmd)
HTML_FILES := $(QMD_FILES:%.qmd=%.html)
BIB_TXT_FILES := $(sort $(wildcard bibs/*.txt))

.PHONY: all html clean realclean

all: html

#html: $(HTML_FILES)
#
## create html
#%.html: %.qmd _quarto.yml bibs/mybib.bib
#	quarto render $< --to html
#	$(PRINT) "make $@ done."

html: bibs/mybib.bib _quarto.yml
	quarto render --to html
	$(PRINT) "html done."


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


JUNK = *.log
OUTS = docs

clean:
	@rm -f $(JUNK)
	$(PRINT) "make $@ done."

## clean up everything including the output
realclean: clean
	@rm -rf $(OUTS)
	$(PRINT) "make $@ done."

