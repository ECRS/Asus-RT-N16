#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);

struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
 .name = KBUILD_MODNAME,
 .init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
 .exit = cleanup_module,
#endif
 .arch = MODULE_ARCH_INIT,
};

static const char __module_depends[]
__attribute_used__
__attribute__((section(".modinfo"))) =
"depends=usbcore,mii";

MODULE_ALIAS("usb:v12D1p*d*dc*dsc*dp*ic02isc06ipFFin*");
MODULE_ALIAS("usb:v12D1p*d*dc*dsc*dp*icFFisc01ip09in*");
MODULE_ALIAS("usb:v12D1p*d*dc*dsc*dp*icFFisc01ip39in*");
MODULE_ALIAS("usb:v12D1p*d*dc*dsc*dp*icFFisc02ip09in*");
MODULE_ALIAS("usb:v12D1p*d*dc*dsc*dp*icFFisc02ip39in*");
MODULE_ALIAS("usb:v12D1p*d*dc*dsc*dp*icFFisc01ip16in*");
MODULE_ALIAS("usb:v12D1p*d*dc*dsc*dp*icFFisc02ip16in*");
MODULE_ALIAS("usb:v12D1p*d*dc*dsc*dp*icFFisc01ip46in*");
MODULE_ALIAS("usb:v12D1p*d*dc*dsc*dp*icFFisc02ip46in*");
MODULE_ALIAS("usb:v12D1p*d*dc*dsc*dp*ic02isc0DipFFin*");
MODULE_ALIAS("usb:v12D1p*d*dc*dsc*dp*ic02isc0Dip00in*");
MODULE_ALIAS("usb:v12D1p*d*dc*dsc*dp*icFFisc02ip11in*");
MODULE_ALIAS("usb:v12D1p*d*dc*dsc*dp*icFFisc01ip11in*");
MODULE_ALIAS("usb:v12D1p*d*dc*dsc*dp*icFFisc01ip67in*");
MODULE_ALIAS("usb:v12D1p*d*dc*dsc*dp*icFFisc02ip67in*");
MODULE_ALIAS("usb:v12D1p*d*dc*dsc*dp*icFFisc01ip69in*");
MODULE_ALIAS("usb:v12D1p*d*dc*dsc*dp*icFFisc02ip69in*");
MODULE_ALIAS("usb:v12D1p*d*dc*dsc*dp*icFFisc01ip76in*");
MODULE_ALIAS("usb:v12D1p*d*dc*dsc*dp*icFFisc02ip76in*");
MODULE_ALIAS("usb:v12D1p*d*dc*dsc*dp*icFFisc01ip07in*");
MODULE_ALIAS("usb:v12D1p*d*dc*dsc*dp*icFFisc02ip07in*");
MODULE_ALIAS("usb:v12D1p*d*dc*dsc*dp*icFFisc01ip37in*");
MODULE_ALIAS("usb:v12D1p*d*dc*dsc*dp*icFFisc02ip37in*");

MODULE_INFO(srcversion, "B1CFDF6F607D5C4D2E7B1E3");
