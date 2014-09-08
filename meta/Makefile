CAMLRUN   = ocamlrun
OCAMLC    = ocamlc -annot -bin-annot
OCAMLOPT  = ocamlopt -annot -bin-annot
OCAMLDEP  = ocamldep
OCAMLLEX  = ocamllex
OCAMLYACC = ocamlyacc
COMPFLAGS = -I +compiler-libs -I +unix

BYTE_MODULES = parser_mod lexer_mod parse_mod pparse_mod compile_mod main
BYTE_OBJECTS = $(addsuffix .cmo, $(BYTE_MODULES))
BYTE_DEPS    = ocamlcommon.cma ocamlbytecomp.cma

OPT_MODULES = parser_mod lexer_mod parse_mod pparse_mod optcompile_mod optmain
OPT_OBJECTS = $(addsuffix .cmo, $(OPT_MODULES))
OPT_DEPS    = ocamlcommon.cma ocamloptcomp.cma

# Main Target

meta.byte: $(BYTE_OBJECTS)
	$(OCAMLOPT) -o $@ $(COMPFLAGS) $(BYTE_DEPS) $(BYTE_OBJECTS)


meta.opt: $(OBJECTS)
	$(OCAMLOPT) -o $@ $(COMPFLAGS) $(OPT_DEPS) $(OPT_OBJECTS)

clean::
	rm -f meta

parser_mod.cmo:
	$(OCAMLYACC) -v parser_mod.mly
	$(OCAMLC) $(COMPFLAGS) -c parser_mod.mli
	$(OCAMLC) $(COMPFLAGS) -c parser_mod.ml


# Generic Rules

.SUFFIXES: .mll .mly .ml .mli .cmo .cmi .cmx

.mli.cmi:
	$(OCAMLC) $(COMPFLAGS) -c $<

.ml.cmo:
	$(OCAMLC) $(COMPFLAGS) -c $<

.ml.cmx:
	$(OCAMLOPT) $(COMPFLAGS) -c $<

.mll.ml:
	$(OCAMLLEX) $<

.mly.ml:
	$(OCAMLYACC) -v $<

.mly.mli:
	$(OCAMLYACC) -v $<

clean::
	rm -f *.cm* *.annot *.output

hello: meta.opt
	./meta.opt hello.ml -o hello
	./hello

clean::
	rm -f ./hello

# depend:
# 	ocamldep $(INCLUDES) *.mli *.ml > .depend

# include .depend
