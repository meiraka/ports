ALL = $(notdir $(wildcard packages/*))
.PHONY: all clean $(ALL) help

all: $(ALL)
clean:
	@LIST="$(ALL)";\
		for x in $$LIST; do\
		cd "$$x"; make clean;cd ..;\
		done

$(ALL):
	@LIST="$@";\
		for x in $$LIST; do\
		cd "packages/$$x"; make; make install;cd ..;\
		done

help:
	@LIST="$(ALL)";\
		for x in $$LIST; do\
		echo $$x;\
		done

