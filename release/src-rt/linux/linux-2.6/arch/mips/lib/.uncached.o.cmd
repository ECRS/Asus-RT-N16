cmd_arch/mips/lib/uncached.o := mipsel-uclibc-gcc -Wp,-MD,arch/mips/lib/.uncached.o.d  -nostdinc -isystem /home/astclair/AsusRT-N16/trunk/tomato/tools/brcm/K26/hndtools-mipsel-uclibc-4.2.4/bin/../lib/gcc/mipsel-linux-uclibc/4.2.4/include -D__KERNEL__ -Iinclude  -include include/linux/autoconf.h -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -I/home/astclair/AsusRT-N16/trunk/tomato/release/src-rt/include -DBCMDRIVER -Dlinux -O2 -ffunction-sections  -mno-check-zero-division -mabi=32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -ggdb -ffreestanding  -march=mips32r2 -Wa,-mips32r2 -Wa,--trap  -Iinclude/asm-mips/mach-generic -fomit-frame-pointer  -fno-stack-protector -funit-at-a-time -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow  -DHNDCTF -DCTFPOOL    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(uncached)"  -D"KBUILD_MODNAME=KBUILD_STR(uncached)" -c -o arch/mips/lib/uncached.o arch/mips/lib/uncached.c

deps_arch/mips/lib/uncached.o := \
  arch/mips/lib/uncached.c \
    $(wildcard include/config/64bit.h) \
  include/linux/init.h \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/hotplug.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/acpi/hotplug/memory.h) \
  include/linux/compiler.h \
    $(wildcard include/config/enable/must/check.h) \
  include/linux/compiler-gcc4.h \
    $(wildcard include/config/forced/inlining.h) \
  include/linux/compiler-gcc.h \
  include/asm/addrspace.h \
    $(wildcard include/config/cpu/r4300.h) \
    $(wildcard include/config/cpu/r4x00.h) \
    $(wildcard include/config/cpu/r5000.h) \
    $(wildcard include/config/cpu/rm7000.h) \
    $(wildcard include/config/cpu/rm9000.h) \
    $(wildcard include/config/cpu/nevada.h) \
    $(wildcard include/config/cpu/tx49xx.h) \
    $(wildcard include/config/cpu/mips64.h) \
    $(wildcard include/config/cpu/r8000.h) \
    $(wildcard include/config/cpu/r10000.h) \
    $(wildcard include/config/cpu/sb1.h) \
    $(wildcard include/config/cpu/sb1a.h) \
  include/asm-mips/mach-generic/spaces.h \
    $(wildcard include/config/32bit.h) \
    $(wildcard include/config/dma/noncoherent.h) \
  include/asm/bug.h \
    $(wildcard include/config/bug.h) \
  include/asm/sgidefs.h \
  include/asm/break.h \
  include/asm-generic/bug.h \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/debug/bugverbose.h) \
    $(wildcard include/config/smp.h) \

arch/mips/lib/uncached.o: $(deps_arch/mips/lib/uncached.o)

$(deps_arch/mips/lib/uncached.o):