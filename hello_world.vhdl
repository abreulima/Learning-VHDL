entity hello_world is
end entity;

architecture main of hello_world is
begin
    process is
    begin
        report "Hello World!";
        wait;
    end process;
end architecture;
