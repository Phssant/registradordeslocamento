library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Desl is
    Port ( D_LOAD : in STD_LOGIC_VECTOR (7 downto 0);
           SEL : in STD_LOGIC_VECTOR (7 downto 0);
           DR_IN : in STD_LOGIC;
           DL_IN : in STD_LOGIC;
           clk : in STD_LOGIC;
           D_OUT : out STD_LOGIC_VECTOR (7 downto 0));
end Desl;

architecture Behavioral of Desl is
    signal reg: STD_LOGIC_VECTOR (7 downto 0) := "00000000";
begin
    
    process (clk)
    begin
       
    if rising_edge (clk) then
            if SEL="00" then
                reg (0) <= reg (0);
                reg (1) <= reg (1);
                reg (2) <= reg (2);
                reg (3) <= reg (3);
                reg (4) <= reg (4);
                reg (5) <= reg (5);
                reg (6) <= reg (6);
                reg (7) <= reg (7);
            elsif SEL="01" then
                reg (0) <= D_LOAD (0);
                reg (1) <= D_LOAD (1);
                reg (2) <= D_LOAD (2);
                reg (3) <= D_LOAD (3);
                reg (4) <= D_LOAD (4);
                reg (5) <= D_LOAD (5);
                reg (6) <= D_LOAD (6);
                reg (7) <= D_LOAD (7);
            elsif SEL="10" then
                if DL_IN = '1' then
                     reg (0) <= D_LOAD (1);
                     reg (1) <= D_LOAD (2);
                     reg (2) <= D_LOAD (3);
                     reg (3) <= D_LOAD (4);
                     reg (4) <= D_LOAD (5);
                     reg (5) <= D_LOAD (6);
                     reg (6) <= D_LOAD (7);
                     reg (7) <= '1';
                elsif DL_IN = '0' then
                     reg (0) <= D_LOAD (1);
                     reg (1) <= D_LOAD (2);
                     reg (2) <= D_LOAD (3);
                     reg (3) <= D_LOAD (4);
                     reg (4) <= D_LOAD (5);
                     reg (5) <= D_LOAD (6);
                     reg (6) <= D_LOAD (7);
                     reg (7) <= '0';
                end if;
            elsif SEL <="11" then
                if DR_IN = '1' then
                    reg (7) <= D_LOAD (6);
                    reg (6) <= D_LOAD (5);
                    reg (5) <= D_LOAD (4);
                    reg (4) <= D_LOAD (3);
                    reg (3) <= D_LOAD (2);
                    reg (2) <= D_LOAD (1);
                    reg (1) <= D_LOAD (0);
                    reg (0) <= '1';
                elsif DR_IN = '0' then
                    reg (7) <= D_LOAD (6);
                    reg (6) <= D_LOAD (5);
                    reg (5) <= D_LOAD (4);
                    reg (4) <= D_LOAD (3);
                    reg (3) <= D_LOAD (2);
                    reg (2) <= D_LOAD (1);
                    reg (1) <= D_LOAD (0);
                    reg (0) <= '0';
                end if;
            else 
                reg <= "00000000";
            end if;
            
            D_OUT (0) <= reg (0);
            D_OUT (1) <= reg (1);
            D_OUT (2) <= reg (2);
            D_OUT (3) <= reg (3);
            D_OUT (4) <= reg (4);
            D_OUT (5) <= reg (5);
            D_OUT (6) <= reg (6);
            D_OUT (7) <= reg (7);
            
    end if;
    end process;
    
    
end Behavioral;