----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/08/2024 02:05:42 PM
-- Design Name: 
-- Module Name: ALUbest - Behavioral
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

entity ALUbest is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in STD_LOGIC_VECTOR (2 downto 0);
           c,n : out STD_LOGIC;
           o : out STD_LOGIC;
           res : out STD_LOGIC_VECTOR (7 downto 0));
end ALUbest;

architecture Behavioral of ALUbest is
 signal radd,rsub,rmul,tmp,rand,rxor,rror,rnot: STD_LOGIC_VECTOR(15 downto 0);
begin

 radd<=(x"00"&a) + (x"00"&b);
 rsub<=(x"00"&a) - (x"00"&b);
 rmul<=a*b;
 rand<=(x"00"&a) and (x"00"&b);
 rror<=(x"00"&a) or (x"00"&b);
 rxor<=(x"00"&a) xor (x"00"&b);
 rnot<= not (x"00"&a)  ;
 tmp<=radd when Ctrl_Alu="000" else
      rsub when Ctrl_Alu="001" else
      rmul when Ctrl_Alu="010" else
      rror when Ctrl_Alu="100" else
      rand when Ctrl_Alu="011" else
      rxor when Ctrl_Alu="101" else
      rnot when Ctrl_Alu="110" else
      x"0000";
 res<=tmp(7 downto 0);
 c<=radd(8);
 n<=rsub(7);
 o<='1' when rmul(15 downto 8)/=x"00" else '0';


end Behavioral;
