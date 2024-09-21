# Makefile for quarto-example

PRINT = @echo '==>  '

QMD_FILES := $(wildcard *.qmd)
#HTML_FILES := $(QMD_FILES:%.qmd=%.html)

.PHONY: all html clean realclean

all: html

html:
	quarto render --to html
	$(PRINT) "_output done."

JUNK = *.log
OUTS = _output

clean:
	@rm -f $(JUNK)
	$(PRINT) "make $@ done."

## clean up everything including the output
realclean: clean
	@rm -rf $(OUTS)
	$(PRINT) "make $@ done."

