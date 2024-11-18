----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/24/2024 10:00:11 AM
-- Design Name: 
-- Module Name: Datamemorytest - Behavioral
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

entity Datamemorytest is
end Datamemorytest;

architecture Behavioral of Datamemorytest is
           signal RWin : STD_LOGIC;
           signal addr_Ain : STD_LOGIC_VECTOR (7 downto 0);
           signal DATA_INin : STD_LOGIC_VECTOR (7 downto 0);
           signal CLKin : STD_LOGIC;
           signal RSTin : STD_LOGIC;
           signal DATA_OUTDout: STD_LOGIC_VECTOR (7 downto 0);
component Datamemorybest is
Port ( 
           RW : in STD_LOGIC;
           addr_A : in STD_LOGIC_VECTOR (7 downto 0);
           DATA_IN : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           DATA_OUTD: out STD_LOGIC_VECTOR (7 downto 0));
end component;
begin
    aut:Datamemorybest
    Port map(
    RW=>RWin,
    addr_A=>addr_Ain,
    DATA_IN=>DATA_INin,
    CLK=>CLKin,
    RST=>RSTin,
    DATA_OUTD=>DATA_OUTDout
);
clk_process :process
   begin
        CLKin <= '0';
        wait for 0.5 ns;  --for 0.5 ns signal is '0'.
        CLKin <= '1';
        wait for 0.5 ns;  --for next 0.5 ns signal is '1'.
   end process;
process
begin
    --test écriture
    RWin<='0';
    addr_Ain<="11111111";
    DATA_INin<="01010101";
    wait for 100ns;
    RWin<='1';
    addr_Ain<="11111111";
    wait for 100ns;
    RSTin<='1';
    RWin<='1';
    addr_Ain<="11111111";
    wait for 100ns;
    wait;
end process;    

end Behavioral;
