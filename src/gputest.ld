SECTIONS {
  .text : {
    *(.text.startup)
    *(.text*)
  }
  .bss : { *(.bss) }
  .data : { *(.data) }
  .rodata : { *(.rodata) }
}
