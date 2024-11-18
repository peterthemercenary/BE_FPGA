----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/05/2024 03:01:15 PM
-- Design Name: 
-- Module Name: Basculetest - Behavioral
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

entity Basculetest is
--  Port ( );
end Basculetest;

architecture Behavioral of Basculetest is
    signal aiin : STD_LOGIC_VECTOR (7 downto 0);
    signal biin : STD_LOGIC_VECTOR (7 downto 0); 
    signal ciin : STD_LOGIC_VECTOR (7 downto 0);
    signal opiin : STD_LOGIC_VECTOR (7 downto 0);
    signal aoout : STD_LOGIC_VECTOR (7 downto 0);
    signal boout : STD_LOGIC_VECTOR (7 downto 0); 
    signal coout : STD_LOGIC_VECTOR (7 downto 0);
    signal opoout : STD_LOGIC_VECTOR (7 downto 0);
    signal CLKin : std_logic;
component Basculebest is
    Port ( --partie bascule
           ai : in STD_LOGIC_VECTOR (7 downto 0);
           bi : in STD_LOGIC_VECTOR (7 downto 0); 
           ci : in STD_LOGIC_VECTOR (7 downto 0);
           opi : in STD_LOGIC_VECTOR (7 downto 0);
           ao : out STD_LOGIC_VECTOR (7 downto 0);
           bo : out STD_LOGIC_VECTOR (7 downto 0); 
           co : out STD_LOGIC_VECTOR (7 downto 0);
           opo : out STD_LOGIC_VECTOR (7 downto 0);
           CLK: in std_logic
           
           );
end component;
begin

hassan : Basculebest
    Port map (
        ai  => aiin,
        bi  => biin,
        ci  => ciin,
        opi => opiin,
        ao  => aoout,
        bo  => boout,
        co  => coout,
        opo => opoout,
        CLK => CLKin
    );
clk_process :process
   begin
        CLKin <= '0';
        wait for 100 ns;  --for 0.5 ns signal is '0'.
        CLKin <= '1';
        wait for 100 ns;  --for next 0.5 ns signal is '1'.
   end process;
process
begin

aiin<=x"01";
wait for 50 ns;

aiin<=x"04";
wait for 50 ns;

aiin<=x"05";
wait for 50 ns;

aiin<=x"06";
wait for 50 ns;


end process;

end Behavioral;
