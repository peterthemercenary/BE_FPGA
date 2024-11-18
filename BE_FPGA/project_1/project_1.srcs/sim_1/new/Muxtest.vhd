----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/24/2024 12:05:19 PM
-- Design Name: 
-- Module Name: Muxtest - Behavioral
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

entity Muxtest is
--  Port ( );
end Muxtest;

architecture Behavioral of Muxtest is
           signal opin : STD_LOGIC_VECTOR (7 downto 0);
           signal addr_Ain: STD_LOGIC_VECTOR (7 downto 0);
           signal Qout: STD_LOGIC_VECTOR (7 downto 0);
           signal Q1out: STD_LOGIC_VECTOR (7 downto 0);
           signal Q2out: STD_LOGIC_VECTOR (7 downto 0);
           signal Q3out: STD_LOGIC_VECTOR (7 downto 0);
           signal QAin :  STD_LOGIC_VECTOR (7 downto 0);
           signal Ain :   STD_LOGIC_VECTOR (7 downto 0);
           signal B1in :  STD_LOGIC_VECTOR (7 downto 0);
           signal B2in :  STD_LOGIC_VECTOR (7 downto 0);
           signal Bin:    STD_LOGIC_VECTOR (7 downto 0);
           signal Sin :   STD_LOGIC_VECTOR (7 downto 0);
           signal OUTQin :STD_LOGIC_VECTOR (7 downto 0);
           
component Muxbest is
    Port ( addr_A : in STD_LOGIC_VECTOR (7 downto 0);
           QA : in STD_LOGIC_VECTOR (7 downto 0);
           A : in STD_LOGIC_VECTOR (7 downto 0);
           B1 : in STD_LOGIC_VECTOR (7 downto 0);
           B2 : in STD_LOGIC_VECTOR (7 downto 0);
           B: in STD_LOGIC_VECTOR (7 downto 0);
           S : in STD_LOGIC_VECTOR (7 downto 0);
           op : in STD_LOGIC_VECTOR (7 downto 0);
           OUTQ : in STD_LOGIC_VECTOR (7 downto 0);
           Q : out STD_LOGIC_VECTOR (7 downto 0);
           Q1 : out STD_LOGIC_VECTOR (7 downto 0);
           Q2 : out STD_LOGIC_VECTOR (7 downto 0);
           Q3 : out STD_LOGIC_VECTOR (7 downto 0));
end component;
begin
pierre: Muxbest
    Port map(
    op=>opin,
    addr_A=>addr_Ain,
    QA=>QAin,
    Q=>Qout,
    Q1=>Q1out,
    Q2=>Q2out,
    Q3=>Q3out,
    B=>Bin,
    B1=>B1in,
    B2=>B2in,
    OUTQ=>OUTQin,
    S=>Sin,
    A=>Ain
);
process
begin

opin<=x"01";
addr_Ain<=x"00";
QAin<=x"01";

Bin<=x"02";
Sin<=x"03";

B1in<=x"04";
Ain<=x"05";

B2in<=x"06";
OUTQin<=x"07";
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
