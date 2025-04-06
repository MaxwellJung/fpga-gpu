#include <stdint.h>
#include "io_reg.h"
#include "palette.h"
#include "framebuffer.h"
#include "graphics.h"

StatusReg* status_reg = &(((IORegisters*)(IO_REG_BASE_ADDR))->status);
ControlReg* control_reg =  &(((IORegisters*)(IO_REG_BASE_ADDR))->control);
CommandReg* command_list = ((IORegisters*)(IO_REG_BASE_ADDR))->command_list;

uint32_t getThreadId() {
    return ((IORegisters*)(IO_REG_BASE_ADDR))->thread_id;
}

bool isStartBitHigh() {
    return control_reg->start == 1;
}

void setBusyBit() {
    status_reg->busy = 1;
}

void clearBusyBit() {
    status_reg->busy = 0;
}

void clearStartBit() {
    control_reg->start = 0;
}

void executeCommandList() {
    status_reg->finished_commands = 0;
    for (int i = 0; i < control_reg->commands_to_execute; ++i) {
        executeCommand(&(command_list[i]));
        status_reg->finished_commands += 1;
    }
}

void executeCommand(CommandReg* command) {
    // Decode command
    OpCode op_code = command->op_code;
    uint16_t x = *(uint16_t*)(&(command->arg0));
    uint16_t y = *(uint16_t*)(&(command->arg2));
    uint16_t dx = *(uint16_t*)(&(command->arg0));
    uint16_t dy = *(uint16_t*)(&(command->arg2));
    uint8_t i = *(uint8_t*)(&(command->arg0));

    // Execute correct display command based on op code
    switch (op_code) {
        case NOOP:
            // Do nothing
            break;
        case MOVE:
            move(x, y);
            break;
        case MOVER:
            moveR(dx, dy);
            break;
        case LINE:
            line(x, y);
            break;
        case LINER:
            lineR(dx, dy);
            break;
        case POINT:
            point(x, y);
            break;
        case POINTR:
            pointR(dx, dy);
            break;
        case RECT:
            rect(x, y);
            break;
        case RECTR:
            rectR(dx, dy);
            break;
        case PIXELVALUE:
            pixelValue(i);
            break;
    }
}
