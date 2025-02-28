SECTIONS {
  . = 0;
  .text : { *(.text) }
  .rodata : { *(.rodata) }
  .rodata : { *(.bss) }
  .rodata : { *(.data) }
}