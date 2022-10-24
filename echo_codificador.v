module echo_codificador (
  input RE,
  input RS,
  input A,
  input B,
  input C,
  input D,
  output S1,
  output S2,
  output S3,
  output S4,
  output S5
);

  assign S1 = ((RE & ~RS & ~B & ~C & ~D) | (RE & ~RS & ~A & B & C) | (RE & ~RS & A & ~B & ~C) | (RE & ~RS & A & ~B & ~D));
  assign S2 = ((RE & ~RS & ~B & ~C) | (RE & ~RS & ~A & B & C & D) | (RE & ~RS & A & ~B));
  assign S3 = ((RE & ~RS & ~B & ~C) | (RE & ~RS & ~B & ~D) | (RE & ~RS & A & ~B) | (RE & ~RS & A & ~C & ~D));
  assign S4 = ((RE & ~RS & ~A & ~B) | (RE & ~RS & ~B & D) | (RE & ~RS & ~B & C) | (RE & ~RS & A & B & ~C));
  assign S5 = ((RE & ~RS & ~A & ~B) | (RE & ~RS & ~A & ~C & ~D) | (RE & ~RS & ~B & C) | (RE & ~RS & A & B & ~C) | (RE & ~RS & A & B & ~D));

  
endmodule