entity two_to_one_mux_tb is
end;

architecture tb of two_to_one_mux_tb is
    signal a, b, s : bit;
    signal y : bit;

begin

    ent_boolean : entity work.two_to_one_mux(boolean)
    port map (a, b, s, y);

    estimulo_checagem : process is

        type linha_tv is record
            a, b, s, y : bit;
        end record;

        type vetor_linha_tv is array (natural range <>) of linha_tv;

        constant tabela_verdade : vetor_linha_tv :=
        ( --  a    b    s    y
            ('0', '0', '0', '0'),  -- s is 0, then input a is selected, therefore y is 0.
            ('0', '0', '1', '0'),  -- s is 1, then input b is selected, therefore y is 0.
            ('0', '1', '0', '0'),  -- s is 0, then input a is selected, therefore y is 0.
            ('0', '1', '1', '1'),  -- s is 1, then input b is selected, therefore y is 1.
            ('1', '0', '0', '1'),  -- s is 0, then input a is selected, therefore y is 1.
            ('1', '0', '1', '0'),  -- s is 1, then input b is selected, therefore y is 0.
            ('1', '1', '0', '1'),  -- s is 0, then input a is selected, therefore y is 1.
            ('1', '1', '1', '1')   -- s is 1, then input b is selected, therefore y is 1.
        );

        begin 

            for i in tabela_verdade'range loop

                a <= tabela_verdade(i).a;
                b <= tabela_verdade(i).b;
                s <= tabela_verdade(i).s;

                wait for 1 ns;

                assert y = tabela_verdade(i).y report "Erro";
            
            end loop;

            report "Fim dos testes";

            wait;

    end process;

end tb;