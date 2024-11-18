----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/17/2024 11:43:09 PM
-- Design Name: 
-- Module Name: LC_OP_ALU - Behavioral
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

entity LC_OP_ALU is
    Port ( op : in STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_ALU : out STD_LOGIC_VECTOR (2 downto 0));
end LC_OP_ALU;

architecture Behavioral of LC_OP_ALU is
--il faut redéfinir ici OP de 8 bits à 3 bits 
begin

process(op)

begin

Ctrl_ALU <= op(2 downto 0);
 
end process;

end Behavioral;
