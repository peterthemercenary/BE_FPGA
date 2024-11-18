----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/24/2024 10:27:59 AM
-- Design Name: 
-- Module Name: Instructiobmemorytest - Behavioral
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

entity Instructionmemorytest is
end Instructionmemorytest;

architecture Behavioral of Instructionmemorytest is
           signal addr_Iin : STD_LOGIC_VECTOR (7 downto 0);
           signal CLKin : STD_LOGIC;
           signal DATA_OUTIout: STD_LOGIC_VECTOR (31 downto 0);
component Instructionmemorybest is
Port ( 
           addr_I : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           DATA_OUTI: out STD_LOGIC_VECTOR (31 downto 0));
end component;
begin
    aut:Instructionmemorybest
    Port map(
    addr_I=>addr_Iin,
    CLK=>CLKin,
    DATA_OUTI=>DATA_OUTIout
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

    addr_Iin<="00000001";
    wait for 100ns;
    addr_Iin<="00000010";
    wait for 100ns;
    addr_Iin<="00000011";
    wait for 100ns;
    wait;
end process;    

end Behavioral;
