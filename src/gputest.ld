SECTIONS {
  . = 0x0;
  .text : {
    *(.text.startup)
    *(.text*)
  }
  .bss : { *(.bss) }
  .data : { *(.data) }
  .rodata : { *(.rodata) }
}
