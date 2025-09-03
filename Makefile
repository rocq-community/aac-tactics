all: Makefile.coq
	@+$(MAKE) -f Makefile.coq all

clean: Makefile.coq
	@+$(MAKE) -f Makefile.coq cleanall
	@rm -f Makefile.coq Makefile.coq.conf

Makefile.coq: _CoqProject
	$(COQBIN)rocq makefile -f _CoqProject -o Makefile.coq

force _CoqProject Makefile: ;

tests:
	$(MAKE) -C tests

%: Makefile.coq force
	@+$(MAKE) -f Makefile.coq $@

.PHONY: all clean force tests
