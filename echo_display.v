`include "echo_codificador.v"

module echo_display (
    input SD1,
    input SD2,
    input SD3,
    input SD4,
    input SD5,
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g
);

    assign a = (~SD1 | SD5 | (SD2 & ~SD4));
    assign b = (~SD2 | ~SD5);
    assign c = (~SD2 | SD3);
    assign d = ((~SD1 & ~SD3) | (SD2 & ~SD4) | (SD2 & SD5));
    assign e = ((~SD1 & ~SD5) | (~SD3 & SD4) | (~SD1 & SD2) | (SD2 & ~SD3));
    assign f = ((~SD1 & ~SD3) | (SD2 & SD4));
    assign g = ((~SD3 & SD5) | SD2);

endmodule