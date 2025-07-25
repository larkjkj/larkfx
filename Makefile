# Warning, this code is not meant to be used as a
# binary file, it's a lib, that you could run with
# C code and link with your project

binary		:= larkfx.elf

c_source	:= $(wildcard src/*.c)
s_source	:= $(wildcard src/*.S)

objects		+= $(patsubst %.c,build/%.o,$(c_source)) \
		   $(patsubst %.S,build/%.o,$(s_source))

incs		:= -I$(PS2SDK)/ee/include \
		   -I$(PS2SDK)/common/include \
		   -Iinclude

libs		:= -L$(PS2SDK)/ee/lib

prefix		:= mips64r5900el-ps2-elf-
compiler	:= $(prefix)gcc
pprocessor	:= $(prefix)cpp
assembler	:= $(prefix)as
linkerfile	:= -T$(PS2SDK)/ee/startup/linkfile

flags		:= -msingle-float
asflags		:= -G0

all: clean $(objects)
	$(compiler) $(linkerfile) $(flags) $(objects) $(incs) $(libs) -o $(binary)

clean:
	rm -rf $(objects) $(binary)

build/%.o: %.S
	$(pprocessor) $(asflags) $(incs) $(libs) -P $< | $(assembler) -o $@

build/%.o: %.c
	mkdir -p $(@D)
	$(compiler) $(incs) $(libs) -c $< -o $@

