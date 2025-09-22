#ifndef _IO_REG_H
#define _IO_REG_H

#include <stdbool.h>

#define IO_REG_BASE_ADDR       0xC0000000
#define NUM_COMMANDS                    4

typedef struct {
    // Indicates processor is busy executing commands
    uint8_t busy;
    // Number of commands that finished (8 bit for now)
    uint8_t finished_commands;
    // Padding to complete 32 bit register;
    uint16_t reserved;
} StatusReg;

typedef struct {
    // This bit triggers command execution
    uint8_t start;
    // Number of commands to execute (8 bit for now)
    uint8_t commands_to_execute;
    // Padding to complete 32 bit register;
    uint16_t reserved;
} ControlReg;

typedef enum {
    NOOP,
    MOVE,
    MOVER,
    LINE,
    LINER,
    POINT,
    POINTR,
    RECT,
    RECTR,
    PIXELVALUE,
} OpCode ;

typedef struct {
    // 32-bit opcode
    OpCode op_code;

    uint8_t arg0;
    uint8_t arg1;
    uint8_t arg2;
    uint8_t arg3;

    uint8_t arg4;
    uint8_t arg5;
    uint8_t arg6;
    uint8_t arg7;

    uint32_t reserved;
} CommandReg;

typedef struct {
    StatusReg status;
    ControlReg control;
    uint32_t heap_wr_start_addr;
    uint32_t reserved[13];

    CommandReg command_list[NUM_COMMANDS];
} IORegisters;

bool isStartBitHigh();
void setBusyBit();
void clearBusyBit();
void clearStartBit();
// Execute commands in command list sequentially
void executeCommandList();
void executeCommand(CommandReg* command);

#endif // _IO_REG_H
