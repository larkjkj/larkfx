	# Warning, this code is not meant to be used as a
# binary file, it's a lib, that you could run with
# C code and link with your project

binary		:= larkfx.elf
library		:= liblarkfx.a
s_source	:= $(wildcard src/*.S)
c_source	:= src/main.c

objects		:=  $(patsubst %.S,build/%.o,$(s_source))
objects		+= build/src/main.o

incs		:= -I$(PS2SDK)/ee/include \
		   -I$(PS2SDK)/common/include \
		   -Iinclude

libs		:= -L$(PS2SDK)/ee/lib

prefix		:= mips64r5900el-ps2-elf-
ar		:= $(prefix)ar
compiler	:= $(prefix)gcc
linker		:= $(prefix)ld
pprocessor	:= $(prefix)gcc -E
assembler	:= $(prefix)as
linkerfile	:= -T$(PS2SDK)/ee/startup/linkfile

asflags		:= -G0

all: clean $(library) $(binary)

$(binary): $(objects)
	$(compiler) $(linkerfile) -L. -llarkfx build/src/main.o -o $(binary) 

$(library): $(objects)
	$(ar) rcs $@ $< --target elf32-littlemips

build/%.o: %.S
	@mkdir -p $(@D)
	$(pprocessor) $(incs) $^ | $(assembler) -o $@

build/src/main.o: src/main.c
	@mkdir -p $(@D)
	$(compiler) $(incs) $(libs) $^ -c -o $@

clean:
	rm -rf $(binary) $(objects) $(library)


