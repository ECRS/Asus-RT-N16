
DESTDIR=
KERNEL_HEADERS=-I/home/astclair/AsusRT-N16/trunk/tomato/release/src-rt/linux/linux-2.6/include

INSTALL=/usr/bin/install -c

prefix=
exec_prefix=${prefix}
bindir=${exec_prefix}/bin
sbindir=${exec_prefix}/sbin
mandir=${prefix}/share/man

SUBDIRS=libbridge brctl

all:

clean:

install:
	mkdir -p $(DESTDIR)$(mandir)/man8
	$(INSTALL) -m 644 brctl.8 $(DESTDIR)$(mandir)/man8
