-- Ivan de Abreu Lima Junior
-- 7th October, 2020
-- 1 Bit Full Adder

entity single_bit_full_adder is
    port (
        a, b, cin : in bit;
        sum, cout : out bit
    );
end single_bit_full_adder;

architecture behavior of single_bit_full_adder is
begin 
    sum <= a xor b xor cin;
    cout <= (a and b) or (a and cin) or (b and cin);
end behavior;