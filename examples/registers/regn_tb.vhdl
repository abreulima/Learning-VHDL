entity regn_tb is
end;

architecture mixed  of regn_tb is
    signal D_c, Q_c : bit_vector(3 downto 0);
    signal D_p, Q_p : bit_vector(3 downto 0);

    signal clk: bit;

begin
    register_c : entity work.regn(behavioralconcurrent)
    generic map(n => 4)
    port map(D => D_c, clk => clk, Q => Q_c);

    register_p : entity work.regn(behavioral)
    generic map(n => 4)
    port map(D => D_p, clk => clk, Q => Q_p);

    p1: process
        variable entrada : bit_vector(3 downto 0) := "1010";
        begin
            D_c <= entrada;
            D_p <= entrada;

            wait for 2 ns;
            clk <= '1';
            wait for 2 ns;

            wait;
        end process p1;

end mixed  ; -- mixed 