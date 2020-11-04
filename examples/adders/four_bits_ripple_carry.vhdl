-- Ivan de Abreu Lima Junior
-- 7th October, 2020
-- 4 Bits Ripple Carry

entity four_bits_ripple_carry is
    port
    (
        a, b: in bit_vector(3 downto 0);
        sum: out bit_vector(3 downto 0);
        cout: out bit
    );
end four_bits_ripple_carry;

architecture structural of four_bits_ripple_carry is
    signal carry : bit_vector(2 downto 0);
begin
    somador_0 : entity work.single_bit_full_adder(behavior)
    port map (a=> a(0), b=> b(0), cin => '0', sum => sum(0), cout => carry(0));

    somador_1 : entity work.single_bit_full_adder(behavior)
    port map (a=> a(1), b=> b(1), cin => carry(0), sum => sum(1), cout => carry(1));

    somador_2 : entity work.single_bit_full_adder(behavior)
    port map (a=> a(2), b=> b(2), cin => carry(1), sum => sum(2), cout => carry(2));

    somador_3 : entity work.single_bit_full_adder(behavior)
    port map (a=> a(3), b=> b(3), cin => carry(2), sum => sum(3), cout => cout);
end structural;