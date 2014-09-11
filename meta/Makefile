CAMLRUN   = ocamlrun
OCAMLC    = ocamlc -annot -bin-annot
OCAMLOPT  = ocamlopt -annot -bin-annot
OCAMLDEP  = ocamldep
OCAMLLEX  = ocamllex
OCAMLYACC = ocamlyacc

BUILD_DIR = build
COMPFLAGS = -I +compiler-libs -I $(BUILD_DIR)

BYTE_MODULES = parser_mod lexer_mod parse_mod pparse_mod compile_mod main_mod
BYTE_OBJECTS = $(addsuffix .cmo, $(BYTE_MODULES))
BYTE_DEPS    = ocamlcommon.cma ocamlbytecomp.cma

OPT_MODULES = parser_mod lexer_mod parse_mod pparse_mod optcompile_mod optmain_mod
OPT_OBJECTS = $(addsuffix .cmx, $(OPT_MODULES))
OPT_DEPS    = ocamlcommon.cmxa ocamloptcomp.cmxa

default: build meta.native

build:
	mkdir -p build

meta.byte: $(BYTE_OBJECTS)
	$(OCAMLC) -o $(BUILD_DIR)/$@ $(COMPFLAGS) $(BYTE_DEPS) $(BYTE_OBJECTS)
	ln -s $(BUILD_DIR)/$@ ./$@

meta.native: $(OPT_OBJECTS)
	$(OCAMLOPT) -o $(BUILD_DIR)/$@ $(COMPFLAGS) $(OPT_DEPS) $(OPT_OBJECTS)
	ln -s $(BUILD_DIR)/$@ ./$@

clean::
	rm -f meta.*

.SUFFIXES: .mll .mly .ml .mli .cmo .cmi .cmx

.mli.cmi:
	$(OCAMLC) $(COMPFLAGS) -o $(BUILD_DIR)/$@ -c $<

.ml.cmo:
	$(OCAMLC) $(COMPFLAGS) -o $(BUILD_DIR)/$@ -c $<

.ml.cmx:
	$(OCAMLOPT) $(COMPFLAGS) -o $(BUILD_DIR)/$@ -c $<

.mll.ml:
	$(OCAMLLEX) $<

%.mli %.ml %.cmx: %.mly
	$(OCAMLYACC) -v -b $(BUILD_DIR)/$* $<
	$(OCAMLOPT) $(COMPFLAGS) -o $(BUILD_DIR)/$*.cmi -c $(BUILD_DIR)/$*.mli
	$(OCAMLOPT) $(COMPFLAGS) -o $(BUILD_DIR)/$*.cmx -c $(BUILD_DIR)/$*.ml

%.mli %.ml %.cmo: %.mly
	$(OCAMLYACC) -v -b $(BUILD_DIR)/$* $<
	$(OCAMLC) $(COMPFLAGS) -o $(BUILD_DIR)/$*.cmi -c $(BUILD_DIR)/$*.mli
	$(OCAMLC) $(COMPFLAGS) -o $(BUILD_DIR)/$*.cmo -c $(BUILD_DIR)/$*.ml

clean::
	rm -f *.o *.cm* *.annot *.output
	rm -rf $(BUILD_DIR)

hello.native: foundation.cmx hello.cmx
	./meta.native foundation.cmx hello.cmx -o hello.native

foundation.cmx: foundation.ml meta.native
	./meta.native -c foundation.ml

hello.cmx: hello.ml meta.native
	./meta.native -c hello.ml

demo: hello.native
	./hello.native

clean::
	rm -f ./hello.{byte,native}

# depend:
# 	ocamldep $(INCLUDES) *.mli *.ml > .depend

# include .depend
