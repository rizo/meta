CAMLRUN   = ocamlrun
OCAMLC    = ocamlc -annot -bin-annot
OCAMLOPT  = ocamlopt -annot -bin-annot
OCAMLDEP  = ocamldep
OCAMLLEX  = ocamllex
OCAMLYACC = ocamlyacc
COMPFLAGS = -I +compiler-libs -I +unix

MODULES = parser_mod lexer_mod parse_mod pparse_mod compile_mod main
OBJECTS = $(addsuffix .cmo, $(MODULES))

# Main Target

meta: $(OBJECTS)
	$(OCAMLC) -o $@ $(COMPFLAGS) ocamlcommon.cma ocamlbytecomp.cma $(OBJECTS)

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

# depend:
# 	ocamldep $(INCLUDES) *.mli *.ml > .depend

# include .depend
