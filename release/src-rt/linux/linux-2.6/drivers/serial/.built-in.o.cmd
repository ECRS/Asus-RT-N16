cmd_drivers/serial/built-in.o :=  mipsel-linux-ld  -m elf32ltsmip  -r -o drivers/serial/built-in.o drivers/serial/serial_core.o drivers/serial/8250.o drivers/serial/8250_pci.o drivers/serial/8250_early.o