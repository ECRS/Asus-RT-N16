cmd_lib/built-in.o :=  mipsel-linux-ld  -m elf32ltsmip  -r -o lib/built-in.o lib/div64.o lib/sort.o lib/parser.o lib/halfmd4.o lib/debug_locks.o lib/random32.o lib/bust_spinlocks.o lib/hexdump.o lib/iomap_copy.o lib/devres.o lib/hweight.o lib/plist.o lib/bitrev.o lib/crc-ccitt.o lib/crc32.o lib/textsearch.o