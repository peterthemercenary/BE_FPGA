----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/08/2024 01:46:04 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Op : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (7 downto 0);
           Carry : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           Negatif : out STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

begin

process(A, B, Op) --liste des sensibilités
 variable result: STD_LOGIC_VECTOR(8 downto 0); -- Pour le résultat de l'addition et du transport
 begin
    case Op is
    when "000" => -- Addition
        result := ("0" & A) + ("0" & B);
        S <= result(7 downto 0);
        Carry <= result(8);
        Overflow <= '0'; -- A implémenter selon les besoins
        Negatif <= result(7);
    when "001" => -- Soustraction
        result := ("0" & A) - ("0" & B);
        S <= result(7 downto 0);
        Carry <= not result(8); -- Si le bit de transport est 0, alors il y a un "Borrow" (contraire de carry)
        Overflow <= '0';
        Negatif <= result(7);
    when "010" => -- Multiplication
        result := (others => '0');
    for i in 0 to 7 loop
        if B(i) = '1' then
        result := result + ("0" & A) sll i; -- Décalage à gauche
        end if;
    end loop;
    S <= result(7 downto 0);
    Carry <= '0'; -- Non applicable ici
    Overflow <= '0';
    Negatif <= result(7);
    when "011" => -- AND
        S <= A and B;
        Carry <= '0';
        Overflow <= '0';
        Negatif <= result(7);
    when "100" => -- OR
        S <= A or B;
        Carry <= '0';
        Overflow <= '0';
        Negatif <= result(7);
    when "101" => -- XOR
        S <= A xor B;
        Carry <= '0';
        Overflow <= '0';
        Negatif <= result(7);
    when "110" => -- NOT A
        S <= not A;
        Carry <= '0';
        Overflow <= '0';
        Negatif <= result(7);
    when others => -- Default case
        S <= (others => '0');
        Carry <= '0';
        Overflow <= '0';
        Negatif <= '0';
    end case;
end process;


end Behavioral;
