`ifndef GUARD_TOP
`define GUARD_TOP

//---------------------------------------------------
// Importing UVM Packages                         
//---------------------------------------------------

 import uvm_pkg::*;

 //`include "uvm_macros.svh"

module top();

//---------------------------------------------------
// Clock Declaration and Generation                
//---------------------------------------------------
    bit Clock;
    
    initial
      begin
          #20;
          forever #10 Clock = ~Clock;
      end
//---------------------------------------------------
//  Memory interface instance                      
//---------------------------------------------------

    mem_interface mem_intf(Clock);

//---------------------------------------------------
//  Input interface instance                       
//---------------------------------------------------

    input_interface input_intf(Clock);

//---------------------------------------------------
//  output interface instance                      
//---------------------------------------------------

    output_interface output_intf[4](Clock);

//---------------------------------------------------
//  DUT instance and signal connection             
//---------------------------------------------------

switch DUT    (.clk          (Clock),
               .reset        (input_intf.reset),
               .data_status  (input_intf.data_status),
               .data         (input_intf.data_in),
               .port0        (output_intf[0].data_out),
               .port1        (output_intf[1].data_out),
               .port2        (output_intf[2].data_out),
               .port3        (output_intf[3].data_out),
               .ready_0      (output_intf[0].ready),
               .ready_1      (output_intf[1].ready),
               .ready_2      (output_intf[2].ready),
               .ready_3      (output_intf[3].ready),
               .read_0       (output_intf[0].read),
               .read_1       (output_intf[1].read),
               .read_2       (output_intf[2].read),
               .read_3       (output_intf[3].read),
               .mem_en       (mem_intf.mem_en),
               .mem_rd_wr    (mem_intf.mem_rd_wr),
               .mem_add      (mem_intf.mem_add),
               .mem_data     (mem_intf.mem_data));

endmodule : top

`endif

