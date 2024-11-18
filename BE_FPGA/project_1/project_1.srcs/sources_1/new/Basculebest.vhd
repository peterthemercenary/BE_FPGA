----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/24/2024 11:43:51 AM
-- Design Name: 
-- Module Name: Basculebest - Behavioral
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

entity Basculebest is
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
end Basculebest;

architecture Behavioral of Basculebest is

begin
 process(CLK)
 begin
  if rising_edge(CLK) then
   ao<=ai;
   bo<=bi;
   co<=ci;
   opo<=opi;
  end if;
 end process;

end Behavioral;
