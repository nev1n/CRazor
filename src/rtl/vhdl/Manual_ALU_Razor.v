
module razor_clk_only(clk, reset, LogIn, LogOut, error);
  input clk, reset, LogIn;
  output LogOut, error;
  wire clk, reset, LogIn;
  wire LogOut, error;
  wire DLat1_n_7, muxOut_sig, n_0, n_3, n_4, n_5, n_6, n_7;
  wire n_8, shLatOut_sig;
  Dff Dff1(clk, reset, muxOut_sig, LogOut);
  INV_X1 g14(.A (reset), .ZN (DLat1_n_7));
  INV_X1 g13(.A (reset), .ZN (n_8));
  NAND2_X1 g82(.A1 (n_7), .A2 (n_6), .ZN (muxOut_sig));
  NAND2_X1 g83(.A1 (shLatOut_sig), .A2 (n_5), .ZN (n_7));
  XOR2_X1 g84(.A (shLatOut_sig), .B (LogOut), .Z (error));
  NAND2_X1 g85(.A1 (n_4), .A2 (LogIn), .ZN (n_6));
  OR2_X1 g86(.A1 (n_4), .A2 (LogIn), .ZN (n_5));
  INV_X1 g87(.A (LogOut), .ZN (n_4));
  DLL_X1 DLat1_q_reg(.GN (n_3), .D (n_0), .Q (shLatOut_sig));
  AOI21_X1 g34(.A (reset), .B1 (clk), .B2 (DLat1_n_7), .ZN (n_3));
  AND2_X1 g35(.A1 (muxOut_sig), .A2 (n_8), .ZN (n_0));
endmodule
//end of manual insertion of the razor module

module top(clk, reset, alu_op1, alu_op2, alu_result);
  input clk, reset;
  input [31:0] alu_op1, alu_op2;
  output [31:0] alu_result;
  wire clk, reset;
  wire [31:0] alu_op1, alu_op2;
  wire [31:0] alu_result;
  wire [31:0] aluResult_reg_in;
  wire UNCONNECTED, UNCONNECTED0, UNCONNECTED1, UNCONNECTED2,
       UNCONNECTED3, UNCONNECTED4, UNCONNECTED5, UNCONNECTED6;
  wire UNCONNECTED7, UNCONNECTED8, UNCONNECTED9, UNCONNECTED10,
       UNCONNECTED11, UNCONNECTED12, UNCONNECTED13, UNCONNECTED14;
  wire UNCONNECTED15, UNCONNECTED16, UNCONNECTED17, UNCONNECTED18,
       UNCONNECTED19, UNCONNECTED20, UNCONNECTED21, UNCONNECTED22;
  wire UNCONNECTED23, UNCONNECTED24, UNCONNECTED25, UNCONNECTED26,
       UNCONNECTED27, UNCONNECTED28, UNCONNECTED29, UNCONNECTED30;
  wire UNCONNECTED_ERROR;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16, n_17, n_18, n_19, n_20, n_21, n_22, n_23;
  wire n_24, n_25, n_26, n_27, n_28, n_29, n_30, n_31;
  
  /*
  * DFFR_X1 \aluResult_reg_out_reg[31] (.RN (n_14), .CK (clk), .D
  *     (aluResult_reg_in[31]), .Q (alu_result[31]), .QN (UNCONNECTED));
  */
  razor_clk_only \aluResult_reg_out_reg[31] (.clk(clk), .reset(n_14), .LogIn(aluResult_reg_in[31]), 
       .LogOut(alu_result[31]), .error(UNCONNECTED_ERROR));// removed the label razor1  
  DFFR_X1 \aluResult_reg_out_reg[30] (.RN (n_31), .CK (clk), .D
       (aluResult_reg_in[30]), .Q (alu_result[30]), .QN (UNCONNECTED0));
  DFFR_X1 \aluResult_reg_out_reg[28] (.RN (n_7), .CK (clk), .D
       (aluResult_reg_in[28]), .Q (alu_result[28]), .QN (UNCONNECTED1));
  DFFR_X1 \aluResult_reg_out_reg[24] (.RN (n_3), .CK (clk), .D
       (aluResult_reg_in[24]), .Q (alu_result[24]), .QN (UNCONNECTED2));
  DFFR_X1 \aluResult_reg_out_reg[16] (.RN (n_1), .CK (clk), .D
       (aluResult_reg_in[16]), .Q (alu_result[16]), .QN (UNCONNECTED3));
  DFFR_X1 \aluResult_reg_out_reg[0] (.RN (n_15), .CK (clk), .D
       (aluResult_reg_in[0]), .Q (alu_result[0]), .QN (UNCONNECTED4));
  DFFR_X1 \aluResult_reg_out_reg[15] (.RN (n_16), .CK (clk), .D
       (aluResult_reg_in[15]), .Q (alu_result[15]), .QN (UNCONNECTED5));
  DFFR_X1 \aluResult_reg_out_reg[23] (.RN (n_30), .CK (clk), .D
       (aluResult_reg_in[23]), .Q (alu_result[23]), .QN (UNCONNECTED6));
  DFFR_X1 \aluResult_reg_out_reg[14] (.RN (n_29), .CK (clk), .D
       (aluResult_reg_in[14]), .Q (alu_result[14]), .QN (UNCONNECTED7));
  DFFR_X1 \aluResult_reg_out_reg[13] (.RN (n_27), .CK (clk), .D
       (aluResult_reg_in[13]), .Q (alu_result[13]), .QN (UNCONNECTED8));
  DFFR_X1 \aluResult_reg_out_reg[27] (.RN (n_28), .CK (clk), .D
       (aluResult_reg_in[27]), .Q (alu_result[27]), .QN (UNCONNECTED9));
  DFFR_X1 \aluResult_reg_out_reg[22] (.RN (n_26), .CK (clk), .D
       (aluResult_reg_in[22]), .Q (alu_result[22]), .QN
       (UNCONNECTED10));
  DFFR_X1 \aluResult_reg_out_reg[12] (.RN (n_25), .CK (clk), .D
       (aluResult_reg_in[12]), .Q (alu_result[12]), .QN
       (UNCONNECTED11));
  DFFR_X1 \aluResult_reg_out_reg[11] (.RN (n_23), .CK (clk), .D
       (aluResult_reg_in[11]), .Q (alu_result[11]), .QN
       (UNCONNECTED12));
  DFFR_X1 \aluResult_reg_out_reg[21] (.RN (n_22), .CK (clk), .D
       (aluResult_reg_in[21]), .Q (alu_result[21]), .QN
       (UNCONNECTED13));
  DFFR_X1 \aluResult_reg_out_reg[10] (.RN (n_21), .CK (clk), .D
       (aluResult_reg_in[10]), .Q (alu_result[10]), .QN
       (UNCONNECTED14));
  DFFR_X1 \aluResult_reg_out_reg[9] (.RN (n_19), .CK (clk), .D
       (aluResult_reg_in[9]), .Q (alu_result[9]), .QN (UNCONNECTED15));
  DFFR_X1 \aluResult_reg_out_reg[29] (.RN (n_24), .CK (clk), .D
       (aluResult_reg_in[29]), .Q (alu_result[29]), .QN
       (UNCONNECTED16));
  DFFR_X1 \aluResult_reg_out_reg[26] (.RN (n_20), .CK (clk), .D
       (aluResult_reg_in[26]), .Q (alu_result[26]), .QN
       (UNCONNECTED17));
  DFFR_X1 \aluResult_reg_out_reg[20] (.RN (n_18), .CK (clk), .D
       (aluResult_reg_in[20]), .Q (alu_result[20]), .QN
       (UNCONNECTED18));
  DFFR_X1 \aluResult_reg_out_reg[8] (.RN (n_17), .CK (clk), .D
       (aluResult_reg_in[8]), .Q (alu_result[8]), .QN (UNCONNECTED19));
  DFFR_X1 \aluResult_reg_out_reg[7] (.RN (n_0), .CK (clk), .D
       (aluResult_reg_in[7]), .Q (alu_result[7]), .QN (UNCONNECTED20));
  DFFR_X1 \aluResult_reg_out_reg[19] (.RN (n_13), .CK (clk), .D
       (aluResult_reg_in[19]), .Q (alu_result[19]), .QN
       (UNCONNECTED21));
  DFFR_X1 \aluResult_reg_out_reg[6] (.RN (n_12), .CK (clk), .D
       (aluResult_reg_in[6]), .Q (alu_result[6]), .QN (UNCONNECTED22));
  DFFR_X1 \aluResult_reg_out_reg[5] (.RN (n_10), .CK (clk), .D
       (aluResult_reg_in[5]), .Q (alu_result[5]), .QN (UNCONNECTED23));
  DFFR_X1 \aluResult_reg_out_reg[25] (.RN (n_11), .CK (clk), .D
       (aluResult_reg_in[25]), .Q (alu_result[25]), .QN
       (UNCONNECTED24));
  DFFR_X1 \aluResult_reg_out_reg[18] (.RN (n_9), .CK (clk), .D
       (aluResult_reg_in[18]), .Q (alu_result[18]), .QN
       (UNCONNECTED25));
  DFFR_X1 \aluResult_reg_out_reg[4] (.RN (n_8), .CK (clk), .D
       (aluResult_reg_in[4]), .Q (alu_result[4]), .QN (UNCONNECTED26));
  DFFR_X1 \aluResult_reg_out_reg[3] (.RN (n_6), .CK (clk), .D
       (aluResult_reg_in[3]), .Q (alu_result[3]), .QN (UNCONNECTED27));
  DFFR_X1 \aluResult_reg_out_reg[17] (.RN (n_5), .CK (clk), .D
       (aluResult_reg_in[17]), .Q (alu_result[17]), .QN
       (UNCONNECTED28));
  DFFR_X1 \aluResult_reg_out_reg[2] (.RN (n_4), .CK (clk), .D
       (aluResult_reg_in[2]), .Q (alu_result[2]), .QN (UNCONNECTED29));
  DFFR_X1 \aluResult_reg_out_reg[1] (.RN (n_2), .CK (clk), .D
       (aluResult_reg_in[1]), .Q (alu_result[1]), .QN (UNCONNECTED30));
  INV_X1 g167(.A (reset), .ZN (n_31));
  INV_X1 g189(.A (reset), .ZN (n_30));
  INV_X1 g175(.A (reset), .ZN (n_29));
  INV_X1 g195(.A (reset), .ZN (n_28));
  INV_X1 g174(.A (reset), .ZN (n_27));
  INV_X1 g187(.A (reset), .ZN (n_26));
  INV_X1 g172(.A (reset), .ZN (n_25));
  INV_X1 g198(.A (reset), .ZN (n_24));
  INV_X1 g171(.A (reset), .ZN (n_23));
  INV_X1 g186(.A (reset), .ZN (n_22));
  INV_X1 g170(.A (reset), .ZN (n_21));
  INV_X1 g193(.A (reset), .ZN (n_20));
  INV_X1 g168(.A (reset), .ZN (n_19));
  INV_X1 g184(.A (reset), .ZN (n_18));
  INV_X1 g197(.A (reset), .ZN (n_17));
  INV_X1 g177(.A (reset), .ZN (n_16));
  INV_X1 g173(.A (reset), .ZN (n_15));
  INV_X1 g169(.A (reset), .ZN (n_14));
  INV_X1 g183(.A (reset), .ZN (n_13));
  INV_X1 g191(.A (reset), .ZN (n_12));
  INV_X1 g192(.A (reset), .ZN (n_11));
  INV_X1 g188(.A (reset), .ZN (n_10));
  INV_X1 g181(.A (reset), .ZN (n_9));
  INV_X1 g185(.A (reset), .ZN (n_8));
  INV_X1 g196(.A (reset), .ZN (n_7));
  INV_X1 g182(.A (reset), .ZN (n_6));
  INV_X1 g180(.A (reset), .ZN (n_5));
  INV_X1 g179(.A (reset), .ZN (n_4));
  INV_X1 g190(.A (reset), .ZN (n_3));
  INV_X1 g176(.A (reset), .ZN (n_2));
  INV_X1 g178(.A (reset), .ZN (n_1));
  INV_X1 g194(.A (reset), .ZN (n_0));
endmodule

