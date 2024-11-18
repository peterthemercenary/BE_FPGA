----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2024 09:53:19 AM
-- Design Name: 
-- Module Name: Benchbest - Behavioral
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

entity Benchbest is
    Port ( W : in STD_LOGIC;
           addr_W : in STD_LOGIC_VECTOR (3 downto 0);
           addr_A : in STD_LOGIC_VECTOR (3 downto 0);
           addr_B : in STD_LOGIC_VECTOR (3 downto 0);
           DATA : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           QA : out STD_LOGIC_VECTOR (7 downto 0);
           QB : out STD_LOGIC_VECTOR (7 downto 0));
end Benchbest;

architecture Behavioral of Benchbest is
type reg_array is array(15 downto 0) of STD_LOGIC_VECTOR (7 downto 0); --définition d'un tableau de 16 régistres de 8 bits chacun
signal registers : reg_array:= (others=>(others=>'0'));--initialisation du contenu du banc de registres
begin

 process(CLK)
  begin
   if rising_edge(CLK) then
    if RST='1'then 
     registers<=(others=>(others=>'0'));
    elsif W='1'then
     registers(conv_integer(unsigned(addr_W)))<=DATA;
    end if;
   end if;
 end process;
 
 QA<= DATA when (addr_A=addr_W and W='1') else --bypass ok
      registers(conv_integer(unsigned(addr_A)));
 QB<= DATA when (addr_B=addr_W and W='1') else 
      registers(conv_integer(unsigned(addr_B)));

 
end Behavioral;
