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

entity Memobest is
    Port ( 
           RW : in STD_LOGIC;
           addr_A : in STD_LOGIC_VECTOR (7 downto 0);
           addr_I : in STD_LOGIC_VECTOR (7 downto 0);
           DATA_IN : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           DATA_OUTD: out STD_LOGIC_VECTOR (7 downto 0);
           DATA_OUTI: out STD_LOGIC_VECTOR (31 downto 0));
end Memobest;



architecture Behavioral of Memobest is
   -- Déclaration du composant pour la mémoire des données (RAM)
    component DataMemory
        Port (
            CLK    : in  std_logic;
            RST    : in  std_logic;
            RW     : in  std_logic;  -- 1 = Read, 0 = Write
            addr_A : in STD_LOGIC_VECTOR (7 downto 0);
            DATA_IN : in STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

    -- Déclaration du composant pour la mémoire des instructions (ROM)
    component InstructionMemory
        Port (
            CLK    : in  std_logic;
            DATA_OUTI: out STD_LOGIC_VECTOR (31 downto 0);
            addr_I : in STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;
    
    type reg_array is array(15 downto 0) of STD_LOGIC_VECTOR (7 downto 0); --définition d'un tableau de 16 régistres de 8 bits chacun
    signal registers : reg_array:= (others=>(others=>'0'));--initialisation du contenu du banc de registres
    begin
    
     process(CLK)
      begin
       if rising_edge(CLK) then
        if RST='1'then
         registers<=(others=>(others=>'0')); 
        elsif RW='0'then
           registers( conv_integer(unsigned(addr_A)))<=DATA_IN;
        end if;
       end if;
     end process;
     
    DATA_OUTD<= registers( conv_integer(unsigned(addr_A)));
    
 
end Behavioral;
