// Code your testbench here
// or browse Examples
module AMBA_APB_tb;
  reg        PSEL;
  reg        PENABLE;
  reg [7:0]  PADDR;
  reg        PWRITE;
  reg [7:0] PWDATA;
  reg        PCLK;
  reg        PRESET;
  
  wire [7:0] PRDATA;
  wire        PREADY;
  
  
  
  
  AMBA_APB inst(.PSEL(PSEL),
                .PENABLE(PENABLE),
                .PADDR(PADDR),
                .PWRITE(PWRITE),
                .PWDATA(PWDATA),
                .PCLK(PCLK),
                .PRESET(PRESET),
                .PRDATA(PRDATA),
                .PREADY(PREADY));
  

  
  
  
  initial begin
    PCLK=1;
    PSEL=0;
    PENABLE=0;
    PRESET=1;
  end
  
  always #5 PCLK=~PCLK;    // PCLK is toggled
  
  initial begin
    @(negedge PCLK)
    PRESET=0;
    @(posedge PCLK)
    PWRITE=1;
    PSEL=1;
    PADDR=8'b1;
    PWDATA=8'b101;
    @(posedge PCLK)
    PENABLE=1;
    @(posedge PCLK)
    PSEL=0;
    PENABLE=0;
    @(negedge PCLK)
    PWRITE=0;
    @(posedge PCLK)
    PSEL=1;
    @(posedge PCLK)
    PENABLE=1;
    @(posedge PCLK)
    PSEL=0;
    PENABLE=0;
    
     @(negedge PCLK)
    PRESET=0;
    @(posedge PCLK)
    PWRITE=1;
    PSEL=1;
    PADDR=8'b10;
    PWDATA=8'b111;
    @(posedge PCLK)
    PENABLE=1;
    @(posedge PCLK)
    PSEL=0;
    PENABLE=0;
    @(negedge PCLK)
    PWRITE=0;
    @(posedge PCLK)
    PSEL=1;
    @(posedge PCLK)
    PENABLE=1;
    @(posedge PCLK)
    PSEL=0;
    PENABLE=0;
  end
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      #150 $finish;
    end
endmodule
      