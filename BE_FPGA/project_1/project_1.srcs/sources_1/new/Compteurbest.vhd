----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/05/2024 02:23:49 PM
-- Design Name: 
-- Module Name: Compteurbest - Behavioral
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

entity Compteurbest is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           --EN : in STD_LOGIC;
           --Din : in STD_LOGIC_VECTOR (7 downto 0);
           Dout : out STD_LOGIC_VECTOR (7 downto 0));
end Compteurbest;

architecture Behavioral of Compteurbest is
signal Qa : std_logic_vector (7 downto 0);
begin
process(CLK)
begin

if rising_edge(CLK) then
    if RST='1' then
        Qa<=x"00";
    --elsif EN='0' then
    elsif RST='0' then
        Qa<= Qa + x"01";
        if Qa=x"ff" then
           Qa<=x"00";
        end if;
    end if;
end if;

end process;

Dout<=Qa;
end Behavioral;
