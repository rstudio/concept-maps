.PHONY : all

CMD=dot -Tsvg
SRC=$(wildcard */*.gv)
DST=$(patsubst %.gv,%_dot.svg,${SRC})

all: commands

## commands : show all commands.
commands :
	@grep -h -E '^##' ${MAKEFILE_LIST} | sed -e 's/## //g' | column -t -s ':'

## dot : rebuild dot-generated SVG files.
dot : ${DST}

## --------

## show : display settings.
show :
	@echo CMD \"${CMD}\"
	@echo SRC \"${SRC}\"
	@echo DST \"${DST}\"

# ----------------------------------------------------------------------

# Pattern rule to remake .svg from .gv.
%_dot.svg : %.gv
	${CMD} $< > $@
