----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/05/2024 02:06:34 PM
-- Design Name: 
-- Module Name: LCtest - Behavioral
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

entity LCtest is
--  Port ( );
end LCtest;

architecture Behavioral of LCtest is
           signal opin : STD_LOGIC_VECTOR (7 downto 0);
           signal Wout: STD_LOGIC;
           signal RWout: STD_LOGIC;
           signal ctrl_ALUout: std_logic_vector(2 downto 0);
component LCbest is
    Port (
    op : in STD_LOGIC_VECTOR(7 downto 0);
    W : out STD_LOGIC;
    RW : out STD_LOGIC;
    ctrl_ALU : out std_logic_vector(2 downto 0)
    );
end component;
           
begin


pierre1: LCbest
    Port map(
    op=>opin,
    W=>Wout,
    RW=>RWout,
    ctrl_ALU=>ctrl_ALUout


);

process
begin

opin<=x"01";
wait for 100ns;

opin<=x"02";
wait for 100ns;

opin<=x"03";
wait for 100ns;

opin<=x"04";
wait for 100ns;

opin<=x"05";
wait for 100ns;

opin<=x"06";
wait for 100ns;

opin<=x"07";
wait for 100ns;

opin<=x"08";
wait for 100ns;
wait;
end process; 

end Behavioral;












