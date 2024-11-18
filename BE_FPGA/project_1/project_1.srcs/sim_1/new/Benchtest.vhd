----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2024 10:30:08 AM
-- Design Name: 
-- Module Name: Benchtest - Behavioral
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

entity Benchtest is
end Benchtest;

architecture Behavioral of Benchtest is

   signal  Win : STD_LOGIC;
   signal  addr_Win :  STD_LOGIC_VECTOR (3 downto 0);
   signal addr_Ain : STD_LOGIC_VECTOR (3 downto 0);
   signal addr_Bin : STD_LOGIC_VECTOR (3 downto 0);
   signal DATAin: STD_LOGIC_VECTOR (7 downto 0);
   signal CLKin : STD_LOGIC:='0';
   signal RSTin :  STD_LOGIC;
   signal QAout :  STD_LOGIC_VECTOR (7 downto 0);
   signal QBout : STD_LOGIC_VECTOR (7 downto 0);
   
component Benchbest is
    Port ( W : in STD_LOGIC;
           addr_W : in STD_LOGIC_VECTOR (3 downto 0);
           addr_A : in STD_LOGIC_VECTOR (3 downto 0);
           addr_B : in STD_LOGIC_VECTOR (3 downto 0);
           DATA : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           QA : out STD_LOGIC_VECTOR (7 downto 0);
           QB : out STD_LOGIC_VECTOR (7 downto 0));
end  component;
begin
  MARC: Benchbest
  Port map (
        W => Win,
        addr_W=>addr_Win ,
        addr_A => addr_Ain,
        addr_B => addr_Bin,
        DATA=> DATAin,
        CLK => CLKin,
        RST => RSTin,
        QA=>QAout,
        QB=>QBout
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
        -- Test ecriture
        Win<='1';
        addr_Win<="0001";
        DATAin<="10101010";
        wait for 10ns;
        addr_Win<="0010";
        DATAin<="01010101";
        wait for 10 ns;
        addr_Win<="0011";
        DATAin<="00110011";
        wait for 10 ns;
        addr_Win<="0100";
        addr_Bin<="0100"; 
        DATAin<="11001100";
        wait for 10 ns;
        Win<='0';
        addr_Ain<="0001";
        addr_Bin<="0010";
        wait for 10 ns;
        addr_Ain<="0011";
        addr_Bin<="0100";     
        wait for 10 ns;
        RSTin<='1';
        wait for 10ns;
        addr_Ain<="0001";
        addr_Bin<="0010";
        wait;
end process;

end Behavioral;
