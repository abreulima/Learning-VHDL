entity single_bit_full_adder_tb is
end;

architecture logic of single_bit_full_adder_tb is
    signal a, b, cin, sum, cout : bit;
begin
    entidade : entity work.single_bit_full_adder(behavior)
    port map (a, b, cin, sum, cout);

    estimulo_checagem : process is
        type linha_tv is record
            a, b, cin, sum, cout : bit;
        end record;

        type vet_linha_tv is array (0 to 7) of linha_tv;
        constant tabela_verdade : vet_linha_tv :=
        --    a    b   cin  sum  out 
        (   ('0', '0', '0', '0', '0'),
            ('0', '0', '1', '1', '0'),
            ('0', '1', '0', '1', '0'),
            ('0', '1', '1', '0', '1'),
            ('1', '0', '0', '1', '0'),
            ('1', '0', '1', '0', '1'),
            ('1', '1', '0', '0', '1'),
            ('1', '1', '1', '1', '1')   );

    begin 

        for i in tabela_verdade'range loop
            a <= tabela_verdade(i).a;
            b <= tabela_verdade(i).b;
            cin <= tabela_verdade(i).cin;

            wait for 1 ns;

            assert sum = tabela_verdade(i).sum report "Erro";
            assert cout = tabela_verdade(i).cout report "Erro";

        end loop;

        report "Fim dos testes";

        wait;

    end process;

end logic; 