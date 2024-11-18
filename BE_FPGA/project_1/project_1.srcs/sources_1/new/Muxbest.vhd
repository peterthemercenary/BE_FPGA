----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/24/2024 11:59:16 AM
-- Design Name: 
-- Module Name: Muxbest - Behavioral
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

entity Muxbest is
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
end Muxbest;

architecture Behavioral of Muxbest is
signal Qout : STD_LOGIC_VECTOR(7 downto 0);
signal Qout1 : STD_LOGIC_VECTOR(7 downto 0);
signal Qout2 : STD_LOGIC_VECTOR(7 downto 0);
signal Qout3 : STD_LOGIC_VECTOR(7 downto 0);
begin

with op select
Qout<=addr_A when x"06", --récupérer l'adresse 
      QA when others;    -- récupérer la valeur
Q<=Qout;

with op select
Qout1<=B when x"01" | x"02" | x"03",     -- + ou - ou *  
       S when others ;                      -- récupérer le résultat
Q1<=Qout1;

with op select
Qout2<=B1 when x"07",     -- chargement 
       A when  x"08" ,
       x"00" when others;    -- sauvegarde
Q2<=Qout2;

with op select
Qout3<=B2 when x"07",     -- chargement 
       OUTQ when others;    -- sauvegarde
Q3<=Qout3;



end Behavioral;
