cmd_drivers/media/video/pwc/pwc-timon.o := mipsel-uclibc-gcc -Wp,-MD,drivers/media/video/pwc/.pwc-timon.o.d  -nostdinc -isystem /home/astclair/AsusRT-N16/trunk/tomato/tools/brcm/K26/hndtools-mipsel-uclibc-4.2.4/bin/../lib/gcc/mipsel-linux-uclibc/4.2.4/include -D__KERNEL__ -Iinclude  -include include/linux/autoconf.h -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -I/home/astclair/AsusRT-N16/trunk/tomato/release/src-rt/include -DBCMDRIVER -Dlinux -O2 -ffunction-sections  -mno-check-zero-division -mabi=32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -ggdb -ffreestanding  -march=mips32r2 -Wa,-mips32r2 -Wa,--trap  -Iinclude/asm-mips/mach-generic -fomit-frame-pointer  -fno-stack-protector -funit-at-a-time -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow  -DHNDCTF -DCTFPOOL   -DMODULE -mlong-calls -fno-common -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(pwc_timon)"  -D"KBUILD_MODNAME=KBUILD_STR(pwc)" -c -o drivers/media/video/pwc/pwc-timon.o drivers/media/video/pwc/pwc-timon.c

deps_drivers/media/video/pwc/pwc-timon.o := \
  drivers/media/video/pwc/pwc-timon.c \
  drivers/media/video/pwc/pwc-timon.h \
  include/media/pwc-ioctl.h \
  include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbd.h) \
    $(wildcard include/config/lsf.h) \
    $(wildcard include/config/resources/64bit.h) \
  include/linux/posix_types.h \
  include/linux/stddef.h \
  include/linux/compiler.h \
    $(wildcard include/config/enable/must/check.h) \
  include/linux/compiler-gcc4.h \
    $(wildcard include/config/forced/inlining.h) \
  include/linux/compiler-gcc.h \
  include/asm/posix_types.h \
  include/asm/sgidefs.h \
  include/asm/types.h \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/64bit/phys/addr.h) \
    $(wildcard include/config/64bit.h) \
  include/linux/version.h \

drivers/media/video/pwc/pwc-timon.o: $(deps_drivers/media/video/pwc/pwc-timon.o)

$(deps_drivers/media/video/pwc/pwc-timon.o):