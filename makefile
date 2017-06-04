# Edit these variables if more directories are needed.
SRCDIRS		:=	$(CURDIR) src

PROJ=$(shell basename $(CURDIR))

# Verilog Compiler
VC=iverilog


BUILD=$(VC) -o $(PROJ).vvp
#BUILD=$(VC) -g2005-sv -o $(PROJ).vvp
#BUILD=$(VC) -g2009 -o $(PROJ).vvp


export VPATH	:=	$(foreach DIR,$(SRCDIRS),$(CURDIR)/$(DIR))

SRCFILES		:=	$(foreach DIR,$(SRCDIRS),$(shell find $(DIR) \
	-maxdepth 1  -type f -iname "*.v"))

all: reminder clean
	$(BUILD) $(SRCFILES)


.PHONY : reminder
reminder:
	@echo "Reminder:  With Icarus Verilog, DON'T CAST BITS TO ENUMS!"

.PHONY : clean
clean:  
	rm -fv $(PROJ).vvp
