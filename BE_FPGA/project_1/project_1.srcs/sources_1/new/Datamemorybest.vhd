----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/23/2024 06:45:54 PM
-- Design Name: 
-- Module Name: Memobest - Behavioral
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

entity Datamemorybest is    -- Déclaration du composant pour la mémoire des données (RAM)
    Port ( 
           RW : in STD_LOGIC;
           addr_A : in STD_LOGIC_VECTOR (7 downto 0);
           DATA_IN : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           DATA_OUTD: out STD_LOGIC_VECTOR (7 downto 0));
end Datamemorybest;



architecture Behavioral of Datamemorybest is

    type reg_array is array(255 downto 0) of STD_LOGIC_VECTOR (7 downto 0); --définition d'un tableau de 16 régistres de 8 bits chacun
    signal registers : reg_array:= (others=>(others=>'0'));--initialisation du contenu du banc de registres
    begin
    
     process(CLK)
      begin
       if rising_edge(CLK) then
        if RST='1'then
         registers<=(others=>(others=>'0'));
         end if; 
        if RW='0'then --ecriture
           registers( conv_integer(unsigned(addr_A)))<=DATA_IN;
        elsif RW='1'then
            DATA_OUTD<= registers( conv_integer(unsigned(addr_A)));
        end if;
       end if;
     end process;
     

    
 
end Behavioral;
