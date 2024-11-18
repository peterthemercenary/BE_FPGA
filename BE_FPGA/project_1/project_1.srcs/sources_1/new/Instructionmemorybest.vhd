----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/24/2024 09:38:00 AM
-- Design Name: 
-- Module Name: Instructionmemorybest - Behavioral
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

entity Instructionmemorybest is  -- Déclaration du composant pour la mémoire des instructions (ROM)
    Port (
        CLK       : in  std_logic;
        DATA_OUTI : out STD_LOGIC_VECTOR (31 downto 0);
        addr_I    : in  STD_LOGIC_VECTOR (7 downto 0)
    );
end Instructionmemorybest;

architecture Behavioral of Instructionmemorybest is

type reg_array is array(255 downto 0) of STD_LOGIC_VECTOR(31 downto 0);  -- Tableau d'instructions (ROM)
signal registers : reg_array := (others => (others => '0'));  -- Initialisation des instructions à 0





begin
    --définition des opcodes
    registers(1)(31 downto 24) <= x"01";  -- instruction ADD
    registers(2)(31 downto 24) <= x"02";
    registers(3)(31 downto 16) <= x"0322";
    registers(5)(31 downto 24) <= x"05";
    registers(6)(31 downto 24) <= x"06";
    registers(7)(31 downto 24) <= x"07";
    registers(8)(31 downto 24) <= x"08";
    process(CLK)
    begin
        if rising_edge(CLK) then
            DATA_OUTI <= registers(conv_integer(unsigned(addr_I)));
        end if;
    end process;
     


end Behavioral;
