CAMLRUN   = ocamlrun
OCAMLC    = ocamlc -annot -bin-annot
OCAMLOPT  = ocamlopt -annot -bin-annot
OCAMLDEP  = ocamldep
OCAMLLEX  = ocamllex
OCAMLYACC = ocamlyacc
COMPFLAGS = -I +compiler-libs -I +unix

MODULES = lexer_mod parser_mod parse_mod pparse_mod compile_mod main
OBJECTS = $(addsuffix .cmo, $(MODULES))

# Main Target

meta: $(OBJECTS)
	$(OCAMLC) -o $@ $(COMPFLAGS) ocamlcommon.cma ocamlbytecomp.cma $(OBJECTS)

clean::
	rm -f meta

# Generic Rules

.SUFFIXES: .mll .mly .ml .mli .cmo .cmi .cmx

.ml.cmo:
	$(OCAMLC) $(COMPFLAGS) -c $<

.mli.cmi:
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
	rm -f *.cm* *.annot

# depend:
# 	ocamldep $(INCLUDES) *.mli *.ml > .depend

# include .depend
