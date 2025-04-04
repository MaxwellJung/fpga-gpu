# fpga-gpu

FPGA 2D/3D graphics accelerator  
Implement hardware and software to accelerate drawing 2D/3D images to VGA monitor  

Current hardware consists of Microblaze CPU sending draw commands to GPU I/O registers.  
GPU firmware polls the I/O registers for draw commands, then executes RISCV instructions to write to color palette and framebuffer.  

Current GPU architecture is a simple 5 stage pipelined in-order RISCV CPU (so not any different from Microblaze yet)  
Plan is to either extend the RISCV core to support vector instructions, or implement full SIMT architecture referencing other open source GPU projects.

Current goal is to instantiate multiple copies of -- say 16 -- RISCV cores inside the GPU and have each core control some parition of the framebuffer. This should effectively simulate having 16 threads writing to the framebuffer and increase draw rate by 16x.  
