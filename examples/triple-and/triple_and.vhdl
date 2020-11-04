-- Ivan de Abreu Lima Junior, 
-- 12/09/2020
-- A*B*C
-- Circuit Diagram
-- A: -----.                      
-- B: ---. |                      
-- C: -. | |                      
--     | | `----|&&               
--     | `------|&&----------A*B*C
--     `--------|&&

entity triple_and is
    port (
        a, b, c : in bit;
        x : out bit
    );
end triple_and;

architecture logic of triple_and is
begin 
    x <= a and b and c;
end logic;