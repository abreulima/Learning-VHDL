entity triple_and_tb is
end;

architecture behave of triple_and_tb is
    signal a, b, c, x : bit;
begin

    uut : entity work.triple_and(dataflow) port map(a, b, c, x);

end architecture;