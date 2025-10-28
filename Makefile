KNOWNTARGETS := RocqMakefile tests
KNOWNFILES   := Makefile _RocqProject

.DEFAULT_GOAL := invoke-rocqmakefile

RocqMakefile: Makefile _RocqProject
	$(ROCQBIN)rocq makefile -f _RocqProject -docroot . -o RocqMakefile

invoke-rocqmakefile: RocqMakefile
	$(MAKE) --no-print-directory -f RocqMakefile $(filter-out $(KNOWNTARGETS),$(MAKECMDGOALS))

.PHONY: invoke-rocqmakefile $(KNOWNFILES)

cleanall:: clean
	rm -f RocqMakefile* *.d *.log */*.glob */.*.aux */*.vo*

tests::
	$(MAKE) -C tests

# This should be the last rule, to handle any targets not declared above
%: invoke-rocqmakefile
	@true
