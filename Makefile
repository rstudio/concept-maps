.PHONY : all

CMD=dot -Tsvg
SRC=$(wildcard dot/*.gv)
DST=$(patsubst dot/%.gv,dot/%.svg,${SRC})

all: commands

## commands : show all commands.
commands :
	@grep -h -E '^##' ${MAKEFILE_LIST} | sed -e 's/## //g' | column -t -s ':'

## preview : generate an HTML page for local preview.
preview :
	@pandoc -o preview.html README.md

## --------

## show : display settings.
show :
	@echo CMD \"${CMD}\"
	@echo SRC \"${SRC}\"
	@echo DST \"${DST}\"

## dot : rebuild dot-generated SVG files (used for prototyping).
dot : ${DST}

# ----------------------------------------------------------------------

# Pattern rule to remake .svg from .gv.
dot/%.svg : dot/%.gv
	${CMD} $< > $@
