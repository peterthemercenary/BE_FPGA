----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/05/2024 02:00:07 PM
-- Design Name: 
-- Module Name: LCbest - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LCbest is
    Port ( op : in STD_LOGIC_VECTOR (7 downto 0);
           W : out STD_LOGIC;
           RW : out STD_LOGIC;
           ctrl_ALU : out STD_LOGIC_VECTOR (2 downto 0)
           
           );
end LCbest;

architecture Behavioral of LCbest is
signal Wout : std_logic;
signal RWout : std_logic;
signal ctrl_ALUout :STD_LOGIC_VECTOR (2 downto 0);
begin


with op select  -- LC
ctrl_ALUout<= "000" when x"01", -- addition
              "010" when x"02", --multiplication
              "001" when x"03", --soustraction
              "100" when others;
ctrl_ALU<=ctrl_ALUout;

with op select 
RWout<= '0' when x"07", -- chargement ("écriture")
       '1' when others; -- lecture
RW<=RWout;

with op select 
Wout<= '0' when x"08", --écriture
       '1' when others; -- lecture
W<=Wout;

end Behavioral;
