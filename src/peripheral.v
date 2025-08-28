/*
 * Copyright (c) 2025 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

// Change the name of this module to something that reflects its functionality and includes your name for uniqueness
// For example tqvp_yourname_spi for an SPI peripheral.
// Then edit tt_wrapper.v line 38 and change tqvp_example to your chosen module name.
module tqvp_example (
    input         clk,          // Clock - the TinyQV project clock is normally set to 64MHz.
    input         rst_n,        // Reset_n - low to reset.

    input  [7:0]  ui_in,        // The input PMOD, always available.  Note that ui_in[7] is normally used for UART RX.
                                // The inputs are synchronized to the clock, note this will introduce 2 cycles of delay on the inputs.

    output [7:0]  uo_out,       // The output PMOD.  Each wire is only connected if this peripheral is selected.
                                // Note that uo_out[0] is normally used for UART TX.

    input [3:0]   address,      // Address within this peripheral's address space

    input         data_write,   // Data write request from the TinyQV core.
    input [7:0]   data_in,      // Data in to the peripheral, valid when data_write is high.
    
    output [7:0]  data_out      // Data out from the peripheral, set this in accordance with the supplied address
);

  wire [13:0] result_0;
  wire [13:0] c$case_alt;
  wire [13:0] c$case_alt_0;
  wire [1:0] c$app_arg;
  wire [1:0] result_1;
  wire [0:0] c$parseReadAddress_$j_arg1_case_alt;
  wire [3:0] c$parseReadAddress_$j_arg1_app_arg;
  wire [13:0] result_2;
  wire [13:0] c$case_alt_1;
  wire [13:0] c$case_alt_2;
  wire [1:0] c$app_arg_0;
  wire [13:0] c$case_alt_3;
  wire [13:0] c$case_alt_4;
  wire [13:0] c$case_alt_5;
  wire [13:0] c$case_alt_6;
  wire [1:0] result_3;
  wire [0:0] c$parseReadAddress_$j_arg1_case_alt_0;
  wire [3:0] c$parseReadAddress_$j_arg1_app_arg_0;
  reg [73:0] result_4;
  wire [73:0] c$case_alt_7;
  wire [73:0] c$case_alt_8;
  reg [7:0] c$case_alt_9;
  reg [7:0] c$case_alt_10;
  wire [73:0] c$case_alt_11;
  reg  c$app_arg_1;
  wire signed [63:0] c$case_scrut;
  wire [65:0] result_5;
  // src/LFSR/Fibonacci.hs:56:1-9
  reg [31:0] \vec' ;
  // src/LFSR/Fibonacci.hs:56:1-9
  wire [1:0] mode1;
  // src/LFSR/Fibonacci.hs:56:1-9
  wire signed [63:0] \c$vec'_case_scrut ;
  // src/LFSR/Fibonacci.hs:56:1-9
  wire [0:0] addrType;
  // src/LFSR/Fibonacci.hs:56:1-9
  wire [31:0] \c$vec'_case_alt ;
  // src/LFSR/Fibonacci.hs:56:1-9
  wire [31:0] \c$vec'_case_alt_0 ;
  // src/LFSR/Fibonacci.hs:56:1-9
  wire signed [63:0] \c$vec'_app_arg ;
  // src/LFSR/Fibonacci.hs:56:1-9
  wire [1:0] addr;
  // src/LFSR/Fibonacci.hs:97:1-21
  wire [7:0] word;
  // src/LFSR/Fibonacci.hs:97:1-21
  wire [2:0] addr_0;
  wire [73:0] result_6;
  wire [65:0] c$executeFibonacciLFSRS_$swriteWord_arg2;
  reg  c$executeFibonacciLFSRS_$swriteWord_arg2_case_alt;
  wire signed [63:0] c$executeFibonacciLFSRS_$swriteWord_arg2_case_scrut;
  // src/LFSR/Fibonacci.hs:(63,1)-(71,20)
  wire [31:0] c$eta1_app_arg;
  wire [31:0] c$app_arg_2;
  wire [31:0] c$app_arg_3;
  wire  c$app_arg_4;
  wire [65:0] c$case_alt_12;
  // src/LFSR/Fibonacci.hs:(63,1)-(71,20)
  wire [31:0] eta1;
  // src/LFSR/Fibonacci.hs:(63,1)-(71,20)
  wire [31:0] x;
  reg [7:0] c$case_alt_13;
  wire signed [63:0] c$case_scrut_0;
  // src/LFSR/Fibonacci.hs:48:1-8
  wire [0:0] addrType_0;
  wire [7:0] c$case_alt_14;
  wire [7:0] c$case_alt_15;
  wire signed [63:0] c$app_arg_5;
  // src/LFSR/Fibonacci.hs:48:1-8
  wire [1:0] addr_1;
  // src/LFSR/Fibonacci.hs:97:1-21
  wire [2:0] addr_2;
  reg [65:0] c$advanceLFSR_arg7;
  // src/LFSR/Fibonacci.hs:97:1-21
  wire [1:0] mode1_0;
  // src/LFSR/Fibonacci.hs:97:1-21
  wire [31:0] taps1;
  // src/LFSR/Fibonacci.hs:97:1-21
  wire [31:0] eta1_0;
  // src/LFSR/Fibonacci.hs:166:1-9
  wire [13:0] x_0;
  // src/LFSR/Fibonacci.hs:166:1-9
  reg [65:0] x1 = {(((({1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,
 1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,
 1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,
 1'b1,   1'b1})))),
 (((({1'b1,   1'b1,   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,
 1'b0,   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,
 1'b0,   1'b1,   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,
 1'b0,   1'b1})))),   2'd0};
  wire [1:0] c$case_alt_selection_11;
  wire [1:0] c$case_alt_selection_14;
  wire [31:0] c$vec;
  wire [31:0] c$vec_0;
  wire [1:0] c$dtt_rhs_1;
  wire [31:0] c$vec_1;
  wire [31:0] c$vec_2;
  wire [31:0] c$vec2;
  wire [32:0] x_projection;
  wire [31:0] c$vecFlat;
  wire [31:0] c$vecFlat_0;
  wire [15:0] result;

  assign result_0 = (c$parseReadAddress_$j_arg1_app_arg == 4'b0100) ? {3'b000,{1'd1,
                                                                               c$app_arg},8'bxxxxxxxx} : c$case_alt;

  assign c$case_alt = (c$parseReadAddress_$j_arg1_app_arg == 4'b0000) ? {3'b000,{1'd0,
                                                                                 c$app_arg},8'bxxxxxxxx} : c$case_alt_0;

  assign c$case_alt_0 = (address == 4'b1111) ? {3'b100,11'bxxxxxxxxxxx} : {3'b101,11'bxxxxxxxxxxx};

  assign c$app_arg = (result_1);

  assign result_1 = ((address[(64'sd1)]) == (1'b1)) ? ({1'b1,c$parseReadAddress_$j_arg1_case_alt}) : ({1'b0,c$parseReadAddress_$j_arg1_case_alt});

  assign c$parseReadAddress_$j_arg1_case_alt = ((address[(64'sd0)]) == (1'b1)) ? 1'b1 : 1'b0;

  assign c$parseReadAddress_$j_arg1_app_arg = 4'b1100 & address;

  assign result_2 = (c$parseReadAddress_$j_arg1_app_arg_0 == 4'b0100) ? {3'b001,{1'd1,
                                                                                 c$app_arg_0},data_in} : c$case_alt_1;

  assign c$case_alt_1 = (c$parseReadAddress_$j_arg1_app_arg_0 == 4'b0000) ? {3'b001,{1'd0,
                                                                                     c$app_arg_0},data_in} : c$case_alt_2;

  assign c$case_alt_2 = ((4'b1000 & address) == 4'b1000) ? c$case_alt_3 : ({14 {1'bx}});

  assign c$app_arg_0 = (result_3);

  assign c$case_alt_3 = (data_in == 8'b00000000) ? {3'b010,2'd0,9'bxxxxxxxxx} : c$case_alt_4;

  assign c$case_alt_4 = (data_in == 8'b00000001) ? {3'b010,2'd1,9'bxxxxxxxxx} : c$case_alt_5;

  assign c$case_alt_5 = (data_in == 8'b00000010) ? {3'b010,2'd2,9'bxxxxxxxxx} : c$case_alt_6;

  assign c$case_alt_6 = (data_in == 8'b00000011) ? {3'b011,11'bxxxxxxxxxxx} : {3'b101,11'bxxxxxxxxxxx};

  assign result_3 = ((address[(64'sd1)]) == (1'b1)) ? ({1'b1,c$parseReadAddress_$j_arg1_case_alt_0}) : ({1'b0,c$parseReadAddress_$j_arg1_case_alt_0});

  assign c$parseReadAddress_$j_arg1_case_alt_0 = ((address[(64'sd0)]) == (1'b1)) ? 1'b1 : 1'b0;

  assign c$parseReadAddress_$j_arg1_app_arg_0 = 4'b1100 & address;

  always @(*) begin
    case(x_0[13:11])
      3'b000 : result_4 = result_6;
      3'b001 : result_4 = {8'b00000000,   result_5};
      3'b010 : result_4 = c$case_alt_11;
      3'b011 : result_4 = {8'b00000000,
                           c$case_alt_12};
      3'b100 : result_4 = c$case_alt_8;
      default : result_4 = c$case_alt_7;
    endcase
  end

  assign c$case_alt_7 = c$executeFibonacciLFSRS_$swriteWord_arg2_case_alt ? {8'b00000000,
                                                                             c$case_alt_12} : {8'b00000000,   x1};

  assign c$case_alt_8 = c$executeFibonacciLFSRS_$swriteWord_arg2_case_alt ? {c$case_alt_9,
                                                                             c$case_alt_12} : {c$case_alt_10,   x1};

  assign c$case_alt_selection_11 = c$case_alt_12[1:0];

  always @(*) begin
    case(c$case_alt_selection_11)
      2'b00 : c$case_alt_9 = 8'b00000000;
      2'b01 : c$case_alt_9 = 8'b00000001;
      default : c$case_alt_9 = 8'b00000010;
    endcase
  end

  assign c$case_alt_selection_14 = x1[1:0];

  always @(*) begin
    case(c$case_alt_selection_14)
      2'b00 : c$case_alt_10 = 8'b00000000;
      2'b01 : c$case_alt_10 = 8'b00000001;
      default : c$case_alt_10 = 8'b00000010;
    endcase
  end

  assign c$case_alt_11 = c$app_arg_1 ? {8'b00000000,
                                        c$case_alt_12} : {8'b00000000,   {eta1_0,
                                                                          taps1,   mode1_0}};

  always @(*) begin
    case(c$case_scrut)
      64'sd1 : c$app_arg_1 = 1'b1;
      default : c$app_arg_1 = 1'b0;
    endcase
  end

  assign c$case_scrut = $unsigned(mode1_0);

  assign result_5 = addrType ? {c$executeFibonacciLFSRS_$swriteWord_arg2[65:34],
                                \vec' ,   mode1} : {\vec' ,
                                                    c$executeFibonacciLFSRS_$swriteWord_arg2[33:2],
                                                    mode1};

  always @(*) begin
    case(\c$vec'_case_scrut )
      64'sd0 : \vec'  = \c$vec'_case_alt ;
      default : \vec'  = \c$vec'_case_alt_0 ;
    endcase
  end

  assign mode1 = c$executeFibonacciLFSRS_$swriteWord_arg2[1:0];

  assign \c$vec'_case_scrut  = $unsigned(addrType);

  assign addrType = addr_0[2:2];

  assign c$vec = c$executeFibonacciLFSRS_$swriteWord_arg2[65:34];

  // vector replace begin
  genvar i;
  generate
  for (i=0;i<4;i=i+1) begin : vector_replace
    assign \c$vec'_case_alt [(3-i)*8+:8] = \c$vec'_app_arg  == i ? word : c$vec[(3-i)*8+:8];
  end
  endgenerate
  // vector replace end

  assign c$vec_0 = c$executeFibonacciLFSRS_$swriteWord_arg2[33:2];

  // vector replace begin
  genvar i_0;
  generate
  for (i_0=0;i_0<4;i_0=i_0+1) begin : vector_replace_0
    assign \c$vec'_case_alt_0 [(3-i_0)*8+:8] = \c$vec'_app_arg  == i_0 ? word : c$vec_0[(3-i_0)*8+:8];
  end
  endgenerate
  // vector replace end

  assign \c$vec'_app_arg  = $unsigned({{(64-2) {1'b0}},addr});

  assign addr = addr_0[1:0];

  assign word = x_0[7:0];

  assign addr_0 = x_0[10:8];

  assign result_6 = c$executeFibonacciLFSRS_$swriteWord_arg2_case_alt ? {c$case_alt_13,
                                                                         c$case_alt_12} : {c$case_alt_13,   x1};

  assign c$executeFibonacciLFSRS_$swriteWord_arg2 = c$executeFibonacciLFSRS_$swriteWord_arg2_case_alt ? c$case_alt_12 : x1;

  always @(*) begin
    case(c$executeFibonacciLFSRS_$swriteWord_arg2_case_scrut)
      64'sd1 : c$executeFibonacciLFSRS_$swriteWord_arg2_case_alt = 1'b1;
      default : c$executeFibonacciLFSRS_$swriteWord_arg2_case_alt = 1'b0;
    endcase
  end

  assign c$dtt_rhs_1 = x1[1:0];

  assign c$executeFibonacciLFSRS_$swriteWord_arg2_case_scrut = $unsigned(c$dtt_rhs_1);

  assign c$vec_1 = c$advanceLFSR_arg7[65:34];

  // map begin
  genvar i_1;
  generate
  for (i_1=0; i_1 < 4; i_1 = i_1 + 1) begin : map
    wire [7:0] map_in;
    assign map_in = c$vec_1[i_1*8+:8];
    wire [7:0] map_out;
    assign map_out = map_in;


    assign c$eta1_app_arg[i_1*8+:8] = map_out;
  end
  endgenerate
  // map end

  assign c$vec_2 = c$advanceLFSR_arg7[33:2];

  // map begin
  genvar i_2;
  generate
  for (i_2=0; i_2 < 4; i_2 = i_2 + 1) begin : map_0
    wire [7:0] map_in_0;
    assign map_in_0 = c$vec_2[i_2*8+:8];
    wire [7:0] map_out_0;
    assign map_out_0 = map_in_0;


    assign c$app_arg_2[i_2*8+:8] = map_out_0;
  end
  endgenerate
  // map end

  assign c$vec2 = ((((c$app_arg_2))));

  // zipWith start
  genvar i_3;
  generate
  for (i_3 = 0; i_3 < 32; i_3 = i_3 + 1) begin : zipWith
    wire  zipWith_in1;
    assign zipWith_in1 = eta1[i_3*1+:1];
    wire  zipWith_in2;
    assign zipWith_in2 = c$vec2[i_3*1+:1];
    wire  c$n;
    assign c$n = zipWith_in1 & zipWith_in2;


    assign c$app_arg_3[i_3*1+:1] = c$n;
  end
  endgenerate
  // zipWith end

  wire [31:0] vec;
  wire  acc_5_0;
  wire  acc_1;
  wire  acc_2;
  wire  acc_3;
  wire  acc_4;
  wire  acc_5;
  wire  acc_6;
  wire  acc_7;
  wire  acc_8;
  wire  acc_9;
  wire  acc_10;
  wire  acc_11;
  wire  acc_12;
  wire  acc_13;
  wire  acc_14;
  wire  acc_15;
  wire  acc_16;
  wire  acc_17;
  wire  acc_18;
  wire  acc_19;
  wire  acc_20;
  wire  acc_21;
  wire  acc_22;
  wire  acc_23;
  wire  acc_24;
  wire  acc_25;
  wire  acc_26;
  wire  acc_27;
  wire  acc_28;
  wire  acc_29;
  wire  acc_30;
  wire  acc_31;
  wire  acc_32;
  wire  acc_1_0;
  wire  acc_1_1;
  wire  acc_1_2;
  wire  acc_1_3;
  wire  acc_1_4;
  wire  acc_1_5;
  wire  acc_1_6;
  wire  acc_1_7;
  wire  acc_1_8;
  wire  acc_1_9;
  wire  acc_1_10;
  wire  acc_1_11;
  wire  acc_1_12;
  wire  acc_1_13;
  wire  acc_1_14;
  wire  acc_1_15;
  wire  acc_2_0;
  wire  acc_2_1;
  wire  acc_2_2;
  wire  acc_2_3;
  wire  acc_2_4;
  wire  acc_2_5;
  wire  acc_2_6;
  wire  acc_2_7;
  wire  acc_3_0;
  wire  acc_3_1;
  wire  acc_3_2;
  wire  acc_3_3;
  wire  acc_4_0;
  wire  acc_4_1;
  assign c$app_arg_4 = acc_5_0;

  assign vec = c$app_arg_3;

  assign acc_1 = vec[31:31];

  assign acc_2 = vec[30:30];

  assign acc_3 = vec[29:29];

  assign acc_4 = vec[28:28];

  assign acc_5 = vec[27:27];

  assign acc_6 = vec[26:26];

  assign acc_7 = vec[25:25];

  assign acc_8 = vec[24:24];

  assign acc_9 = vec[23:23];

  assign acc_10 = vec[22:22];

  assign acc_11 = vec[21:21];

  assign acc_12 = vec[20:20];

  assign acc_13 = vec[19:19];

  assign acc_14 = vec[18:18];

  assign acc_15 = vec[17:17];

  assign acc_16 = vec[16:16];

  assign acc_17 = vec[15:15];

  assign acc_18 = vec[14:14];

  assign acc_19 = vec[13:13];

  assign acc_20 = vec[12:12];

  assign acc_21 = vec[11:11];

  assign acc_22 = vec[10:10];

  assign acc_23 = vec[9:9];

  assign acc_24 = vec[8:8];

  assign acc_25 = vec[7:7];

  assign acc_26 = vec[6:6];

  assign acc_27 = vec[5:5];

  assign acc_28 = vec[4:4];

  assign acc_29 = vec[3:3];

  assign acc_30 = vec[2:2];

  assign acc_31 = vec[1:1];

  assign acc_32 = vec[0:0];

  assign acc_1_0 = acc_1 ^ acc_2;



  assign acc_1_1 = acc_3 ^ acc_4;



  assign acc_1_2 = acc_5 ^ acc_6;



  assign acc_1_3 = acc_7 ^ acc_8;



  assign acc_1_4 = acc_9 ^ acc_10;



  assign acc_1_5 = acc_11 ^ acc_12;



  assign acc_1_6 = acc_13 ^ acc_14;



  assign acc_1_7 = acc_15 ^ acc_16;



  assign acc_1_8 = acc_17 ^ acc_18;



  assign acc_1_9 = acc_19 ^ acc_20;



  assign acc_1_10 = acc_21 ^ acc_22;



  assign acc_1_11 = acc_23 ^ acc_24;



  assign acc_1_12 = acc_25 ^ acc_26;



  assign acc_1_13 = acc_27 ^ acc_28;



  assign acc_1_14 = acc_29 ^ acc_30;



  assign acc_1_15 = acc_31 ^ acc_32;



  assign acc_2_0 = acc_1_0 ^ acc_1_1;



  assign acc_2_1 = acc_1_2 ^ acc_1_3;



  assign acc_2_2 = acc_1_4 ^ acc_1_5;



  assign acc_2_3 = acc_1_6 ^ acc_1_7;



  assign acc_2_4 = acc_1_8 ^ acc_1_9;



  assign acc_2_5 = acc_1_10 ^ acc_1_11;



  assign acc_2_6 = acc_1_12 ^ acc_1_13;



  assign acc_2_7 = acc_1_14 ^ acc_1_15;



  assign acc_3_0 = acc_2_0 ^ acc_2_1;



  assign acc_3_1 = acc_2_2 ^ acc_2_3;



  assign acc_3_2 = acc_2_4 ^ acc_2_5;



  assign acc_3_3 = acc_2_6 ^ acc_2_7;



  assign acc_4_0 = acc_3_0 ^ acc_3_1;



  assign acc_4_1 = acc_3_2 ^ acc_3_3;



  assign acc_5_0 = acc_4_0 ^ acc_4_1;





  assign c$case_alt_12 = {((((x)))),
                          c$advanceLFSR_arg7[33:2],
                          c$advanceLFSR_arg7[1:0]};

  assign eta1 = (((c$eta1_app_arg)));

  assign x_projection = ({c$app_arg_4,eta1});

  assign x = x_projection[32:1];

  always @(*) begin
    case(c$case_scrut_0)
      64'sd0 : c$case_alt_13 = c$case_alt_14;
      default : c$case_alt_13 = c$case_alt_15;
    endcase
  end

  assign c$case_scrut_0 = $unsigned(addrType_0);

  assign addrType_0 = addr_2[2:2];

  assign c$vecFlat = x1[65:34];

  // index begin
  wire [7:0] vecArray [0:4-1];
  genvar i_4;
  generate
  for (i_4=0; i_4 < 4; i_4=i_4+1) begin : mk_array
    assign vecArray[(4-1)-i_4] = c$vecFlat[i_4*8+:8];
  end
  endgenerate
  assign c$case_alt_14 = vecArray[c$app_arg_5];
  // index end

  assign c$vecFlat_0 = x1[33:2];

  // index begin
  wire [7:0] vecArray_0 [0:4-1];
  genvar i_5;
  generate
  for (i_5=0; i_5 < 4; i_5=i_5+1) begin : mk_array_0
    assign vecArray_0[(4-1)-i_5] = c$vecFlat_0[i_5*8+:8];
  end
  endgenerate
  assign c$case_alt_15 = vecArray_0[c$app_arg_5];
  // index end

  assign c$app_arg_5 = $unsigned({{(64-2) {1'b0}},addr_1});

  assign addr_1 = addr_2[1:0];

  assign addr_2 = x_0[10:8];

  always @(*) begin
    case(x_0[13:11])
      3'b000 : c$advanceLFSR_arg7 = x1;
      3'b001 : c$advanceLFSR_arg7 = x1;
      3'b010 : c$advanceLFSR_arg7 = {eta1_0,   taps1,
                                     mode1_0};
      3'b011 : c$advanceLFSR_arg7 = x1;
      3'b100 : c$advanceLFSR_arg7 = x1;
      default : c$advanceLFSR_arg7 = x1;
    endcase
  end

  assign mode1_0 = x_0[10:9];

  assign taps1 = x1[33:2];

  assign eta1_0 = x1[65:34];

  assign x_0 = (data_write == 1'b1) ? result_2 : result_0;

  // register begin
  always @(posedge clk or  negedge  rst_n) begin : x1_register
    if ( ! rst_n) begin
      x1 <= {(((({1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,
   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,
   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,   1'b1,
   1'b1,   1'b1})))),
   (((({1'b1,   1'b1,   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,
   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,
   1'b0,   1'b1,   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,   1'b0,
   1'b0,   1'b1})))),   2'd0};
    end else begin
      x1 <= result_4[65:0];
    end
  end
  // register end

  assign result = {8'b00000000,
                   result_4[73:66]};

  assign uo_out = result[15:8];

  assign data_out = result[7:0];


endmodule

