ALL = $(notdir $(wildcard packages/*))
SUBMODULE = rules/apt.rules rules/goget.rules
.PHONY: all clean $(ALL) help

all: $(ALL)
clean:
	@LIST="$(ALL)";\
		for x in $$LIST; do\
		cd "$$x"; make clean;cd ..;\
		done

$(ALL):| $(SUBMODULE)
	@LIST="$@";\
		for x in $$LIST; do\
		cd "packages/$$x"; make; make install;cd ..;\
		done

help:
	@LIST="$(ALL)";\
		for x in $$LIST; do\
		echo $$x;\
		done

$(SUBMODULE):
	git submodule init
	git submodule update
