CAMLRUN   = ocamlrun
OCAMLC    = ocamlc -annot -bin-annot
OCAMLOPT  = ocamlopt -annot -bin-annot
OCAMLDEP  = ocamldep
OCAMLLEX  = ocamllex
OCAMLYACC = ocamlyacc
COMPFLAGS = -I +compiler-libs

BYTE_MODULES = parser_mod lexer_mod parse_mod pparse_mod compile_mod main_mod
BYTE_OBJECTS = $(addsuffix .cmo, $(BYTE_MODULES))
BYTE_DEPS    = ocamlcommon.cma ocamlbytecomp.cma

OPT_MODULES = parser_mod lexer_mod parse_mod pparse_mod optcompile_mod optmain_mod
OPT_OBJECTS = $(addsuffix .cmx, $(OPT_MODULES))
OPT_DEPS    = ocamlcommon.cmxa ocamloptcomp.cmxa

# Main Target

meta.byte: $(BYTE_OBJECTS)
	$(OCAMLC) -o $@ $(COMPFLAGS) $(BYTE_DEPS) $(BYTE_OBJECTS)


meta.native: $(OPT_OBJECTS)
	$(OCAMLOPT) -o $@ $(COMPFLAGS) $(OPT_DEPS) $(OPT_OBJECTS)

clean::
	rm -f meta.*

parser_mod.cmo:
	$(OCAMLYACC) -v parser_mod.mly
	$(OCAMLC) $(COMPFLAGS) -c parser_mod.mli
	$(OCAMLC) $(COMPFLAGS) -c parser_mod.ml

clean::
	rm -f parser_mod.ml{,i}

parser_mod.cmx:
	$(OCAMLYACC) -v parser_mod.mly
	$(OCAMLOPT) $(COMPFLAGS) -c parser_mod.mli
	$(OCAMLOPT) $(COMPFLAGS) -c parser_mod.ml


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
	rm -f *.o *.cm* *.annot *.output

hello.native: meta.native
	./meta.native hello.ml -o hello.native
	./hello.native

hello.byte: meta.byte
	./meta.byte hello.ml -o hello.byte
	./hello.byte

clean::
	rm -f ./hello.{byte,native}

# depend:
# 	ocamldep $(INCLUDES) *.mli *.ml > .depend

# include .depend
