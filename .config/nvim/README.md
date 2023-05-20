# Joseph's NeoVIM configurations


## Some things to remember

### Clangd when running embedded c code

When I'm working with embedded C projects, I should make some configurations
in my clangd. For example, in my previos coc-settings.json configuration, I
used to have these confiruations:

```json
{
	"clangd.checkUpdates": true,
	"clangd.arguments": [
		"--enable-config",
		"--background-index",
		"--query-driver=/home/joseph/Programs/gcc-arm-none-eabi-9-2020-q2-update/bin/arm-none-eabi-gcc,/home/joseph/.espressif/tools/xtensa-esp32-elf/esp-2021r2-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc"
	],
	"clangd.path": "~/.config/coc/extensions/coc-clangd-data/install/15.0.6/clangd_15.0.6/bin/clangd",
}
```
