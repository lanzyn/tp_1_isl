`include "echo_display.v"
`timescale 1us/1ns

module echo_testbanch ();
    reg RE;
    reg RS;
    reg A;
    reg B;
    reg C;
    reg D;
    reg E;
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
    

 
    echo_codificador link_codificador (
        .RE(RE),
        .RS(RS),
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .S1(S1),
        .S2(S2),
        .S3(S3), 
        .S4(S4),
        .S5(S5)
    );

    echo_display link_display (
        .SD1(S1),
        .SD2(S2),
        .SD3(S3),
        .SD4(S4),
        .SD5(S5),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g)
    );

    reg [5:0] teste[0:16];
    integer cont;
    
    initial begin
        $dumpfile("echo_GTKWAVES.vcd");
        $dumpvars();
        teste[0] = 6'b100000;
        teste[1] = 6'b100001;
        teste[2] = 6'b100010;
        teste[3] = 6'b100011;
        teste[4] = 6'b100100;
        teste[5] = 6'b100101;
        teste[6] = 6'b100110;
        teste[7] = 6'b100111;
        teste[8] = 6'b101000;
        teste[9] = 6'b101001;
        teste[10] = 6'b101010;
        teste[11] = 6'b101011;
        teste[12] = 6'b101100;
        teste[13] = 6'b101101;
        teste[14] = 6'b101110;
        teste[15] = 6'b101111;
        for (cont = 0; cont < 16; cont = cont + 1)
        begin
            RE = teste[cont][5];
            RS = teste[cont][4];
            A = teste[cont][3];
            B = teste[cont][2];
            C = teste[cont][1];
            D = teste[cont][0];
            #10;
            $display("Entrada: %d %d %d %d %d %d", RE, RS, A, B, C, D);
            $display("Codificado: %d %d %d %d %d", S1, S2, S3, S4, S5);
            $display("Display: %d %d %d %d %d %d %d", a, b, c, d, e, f, g);
            $display("\n");
        end
    end
endmodule