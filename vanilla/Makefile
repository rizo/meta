
all: compile link

compile:
	ocamlc -I +compiler-libs -I +unix -c main.ml

link:
	ocamlc -o vanilla -I +compiler-libs ocamlcommon.cma ocamlbytecomp.cma main.cmo

clean:
	rm -f vanilla
	rm -f *.cmi *.cmo