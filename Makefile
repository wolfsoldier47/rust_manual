# Makefile for compiling a Typst document to PDF

# Set the name of the main Typst file (without extension)
MAIN = main

# Output PDF file
OUT = $(MAIN).pdf

# Typst source file
SRC = $(MAIN).typ

# Typst command
TYPST = typst

SRC_CHEATSHEET = cheatsheet.typ

OUT_CHEATSHEET = cheatsheet.pdf

.PHONY: all clean watch

all: $(OUT)

$(OUT): $(SRC)
	$(TYPST) compile $(SRC) $(OUT)

watch:
	$(TYPST) watch $(SRC) $(OUT)

clean:
	rm -f $(OUT)

cheatsheet:
	$(TYPST) compile $(SRC_CHEATSHEET) $(OUT_CHEATSHEET)
