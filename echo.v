module echo(
  input E1,
  input E2,
  input E3,
  input E4,
  input RE,
  input RS,
  output S1,
  output S2,
  output S3,
  output S4,
  output S5,
  output a,
  output b,
  output c,
  output d,
  output e,
  output f,
  output g
);
  wire S1_temp;
  wire s0;
  wire s6;
  wire s7;
  wire s8;
  wire s9;
  wire S2_temp;
  wire S3_temp;
  wire S4_temp;
  wire S5_temp;
  wire s10;
  wire s11;
  wire s12;
  wire s13;
  wire s14;
  assign s0 = ~ E1;
  assign s7 = ~ E2;
  assign s8 = ~ E3;
  assign s9 = ~ E4;
  assign s6 = ~ RS;
  assign S1_temp = ((s0 & E2 & E3 & RE & s6) | (E1 & s7 & s8 & RE & s6) | (E1 & s7 & s9 & RE & s6) | (s7 & s8 & s9 & RE & s6));
  assign S2_temp = ((s0 & E2 & E3 & E4 & RE & s6) | (E1 & s7 & RE & s6) | (s7 & s8 & RE & s6));
  assign S3_temp = ((E1 & s7 & RE & s6) | (E1 & s8 & s9 & RE & s6) | (s7 & s8 & RE & s6) | (s7 & s9 & RE & s6));
  assign S4_temp = ((s0 & s7 & RE & s6) | (E1 & E2 & s8 & RE & s6) | (s7 & E4 & RE & s6) | (s7 & E3 & RE & s6));
  assign S5_temp = ((s0 & s7 & RE & s6) | (s0 & s8 & s9 & RE & s6) | (E1 & E2 & s8 & RE & s6) | (E1 & E2 & s9 & RE & s6) | (s7 & E3 & RE & s6));
  assign s10 = ~ S1_temp;
  assign s12 = ~ S2_temp;
  assign s14 = ~ S3_temp;
  assign s11 = ~ S4_temp;
  assign s13 = ~ S5_temp;
  assign a = (s10 | (S2_temp & s11) | S5_temp);
  assign b = (s12 | s13);
  assign c = (s12 | S3_temp);
  assign d = ((s10 & s14) | (S2_temp & s11) | (S2_temp & S5_temp));
  assign e = ((s10 & s13) | (s10 & S2_temp) | (S2_temp & s14) | (s14 & S4_temp));
  assign f = ((s10 & s14) | (S2_temp & S4_temp));
  assign g = (S2_temp | (s14 & S5_temp));
  assign S1 = S1_temp;
  assign S2 = S2_temp;
  assign S3 = S3_temp;
  assign S4 = S4_temp;
  assign S5 = S5_temp;
endmodule

`timescale 1us/1ns

module echo_tb;
    reg E1;
    reg E2;
    reg E3;
    reg E4;
    reg RE;
    reg RS;
    wire S1;
    wire S2;
    wire S3;
    wire S4;
    wire S5;
    wire a;
    wire b;
    wire c;
    wire d;
    wire e;
    wire f;
    wire g;

  echo echo0 (
    .E1(E1),
    .E2(E2),
    .E3(E3),
    .E4(E4),
    .RE(RE),
    .RS(RS),
    .S1(S1),
    .S2(S2),
    .S3(S3),
    .S4(S4),
    .S5(S5),
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e),
    .f(f),
    .g(g)
  );

    reg [5:0] teste[0:18];
    integer i;

    initial begin
      teste[0] = 6'b0_0_0_0_0_0;
      teste[1] = 6'b0_0_0_0_1_0;
      teste[2] = 6'b0_0_0_1_1_0;
      teste[3] = 6'b0_0_1_0_1_0;
      teste[4] = 6'b0_0_1_1_1_0;
      teste[5] = 6'b0_1_0_0_1_0;
      teste[6] = 6'b0_1_0_1_1_0;
      teste[7] = 6'b0_1_1_0_1_0;
      teste[8] = 6'b0_1_1_1_1_0;
      teste[9] = 6'b1_0_0_0_1_0;
      teste[10] = 6'b1_0_0_1_1_0;
      teste[11] = 6'b1_0_1_0_1_0;
      teste[12] = 6'b1_0_1_1_1_0;
      teste[13] = 6'b1_1_0_0_1_0;
      teste[14] = 6'b1_1_0_1_1_0;
      teste[15] = 6'b1_1_1_0_1_0;
      teste[16] = 6'b1_1_1_1_1_0;
      teste[17] = 6'b1_1_1_1_1_1;
      teste[18] = 6'b0_0_0_0_0_1;

      for (i = 0; i < 19; i = i + 1)
      begin
        E1 = teste[i][5];
        E2 = teste[i][4];
        E3 = teste[i][3];
        E4 = teste[i][2];
        RE = teste[i][1];
        RS = teste[i][0];
        #10;
        $display("S1: %d S2: %d S3: %d S4: %d S5: %d", S1, S2, S3, S4, S5);
        $display("a: %d b: %d c: %d d: %d e: %d f: %d g: %d", a, b, c, d, e, f, g);
      end
    end
    
    initial
      begin
    $dumpfile("echoGTKWAVE.vcd");
    $dumpvars(0,echo_tb);
      end
    endmodule
