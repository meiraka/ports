all: devel desktop

ALL = $(filter-out Makefile $(wildcard *.rules) $(wildcard *.defs), $(wildcard *))
DESKTOP = compton libvte ttf-migu ttf-ricty ttf-ricty-diminished
DEVEL = $(filter-out $(DESKTOP), $(ALL))
.PHONY: all clean devel desktop $(ALL)

all: $(ALL)
devel: $(DEVEL)
desktop: $(DESKTOP)
clean:
	@LIST="$(ALL)";\
		for x in $$LIST; do\
		cd "$$x"; make clean;cd ..;\
		done

$(ALL):
	@LIST="$@";\
		for x in $$LIST; do\
		cd "$$x"; make; make install;cd ..;\
		done
