entity regn is
    generic (n : natural := 4 );
    port (
        D : in bit_vector(n-1 downto 0);
        clk : in bit;
        Q: out bit_vector(n-1 downto 0)
    );
end entity regn;

architecture behavioral of regn is
begin
    process(clk)
    begin
        if clk = '1' then
                Q <= D;
        end if;
    end process;
end architecture behavioral;

architecture behavioralconcurrent of regn is
    begin
        Q <= D when clk'event and clk = '1';
end architecture behavioralconcurrent;
    