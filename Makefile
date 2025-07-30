	# Warning, this code is not meant to be used as a
# binary file, it's a lib, that you could run with
# C code and link with your project

binary		:= larkfx.elf

s_source	:= $(wildcard src/*.S)

objects		:= $(patsubst %.S,build/%.o,$(s_source))

incs		:= -I$(PS2SDK)/ee/include \
		   -I$(PS2SDK)/common/include \
		   -Iinclude

libs		:= -L$(PS2SDK)/ee/lib

prefix		:= mips64r5900el-ps2-elf-
compiler	:= $(prefix)gcc
linker		:= $(prefix)ld
pprocessor	:= $(prefix)gcc -E
assembler	:= $(prefix)as
linkerfile	:= -T$(PS2SDK)/ee/startup/linkfile

asflags		:= -G0


all: clean $(binary)

$(binary): $(objects)
#$(linker) $(linkerfile) $(objects) -o $(binary)
	$(linker) $(linkerfile) $(objects) -o $(binary) 

build/%.o: %.S
	@mkdir -p $(@D)
	$(pprocessor) $(incs) $^ | $(assembler) -o $@

clean:
	rm -rf $(binary) $(objects)


