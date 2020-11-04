entity two_to_one_mux is
    port (
        a, b, s : in bit;
        y : out bit
    );
end entity two_to_one_mux;

-- (a & ¬S) + (b & S)
architecture boolean of two_to_one_mux is
begin
    y <= (a and not s) or (b and s);
end boolean;

-- if s is 0, then y is a
-- if s is 1, then y is b
architecture algorithm of two_to_one_mux is
begin
    process (a, b, s) 
    begin
        if (s = '0') then
            y <= a;
        else 
            y <= b;
        end if;
    end process;
end algorithm;

-- behavioral
architecture behavioral of two_to_one_mux is
begin
    y <= a when (s = '1') else b;
end behavioral;
