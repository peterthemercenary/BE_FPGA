----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/17/2024 11:43:09 PM
-- Design Name: 
-- Module Name: LC_OP_RE - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LC_OP_RE is
    Port ( op : in STD_LOGIC_VECTOR (7 downto 0);
           W : out STD_LOGIC);
end LC_OP_RE;

architecture Behavioral of LC_OP_RE is

begin -- W=1 signifie qu'on fait une écriture
-- sauvegarder à une adresse signifie qu'on écrit
process(op)

begin

 if op= x"08" then --sauvegarde à une @
   W<='1';
 else
   W<='0'; --écriture (copie,chargement,affectation)
 end if;
 
end process;
end Behavioral;
