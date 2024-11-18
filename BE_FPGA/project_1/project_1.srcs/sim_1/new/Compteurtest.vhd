----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/05/2024 02:35:54 PM
-- Design Name: 
-- Module Name: Compteurtest - Behavioral
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


entity Compteurtest is
end Compteurtest ;
architecture comportementale of Compteurtest  is
-- Composant à tester
component Compteurbest 
Port (
CLK : in std_logic;
RST : in std_logic;
EN : in std_logic;
Din : in std_logic_vector(7 downto 0);
Dout : out std_logic_vector(7 downto 0)
);
end component;
-- Signaux internes et initialisation
signal CLK : std_logic := '0';
signal RST : std_logic := '1';
signal EN : std_logic := '1';
signal Din : std_logic_vector(7 downto 0) := (others => '0');
signal Dout : std_logic_vector(7 downto 0);

-- Période de l'horloge
constant T_CLOCK : time := 10 ns;

begin
-- Instanciation du composant
Marc: Compteurbest 
Port map (
CLK => CLK,
RST => RST,
EN => EN,
Din => Din,
Dout => Dout
);



-- Génération de l'horloge
process
begin
while True loop
CLK <= '0';
wait for T_CLOCK/2;
CLK <= '1';
wait for T_CLOCK/2;
end loop;
end process;


-- Processus de test
process
begin
-- Attente de quelques nanosecondes
wait for 20 ns;
-- Activation du reset
RST <= '1';
wait for T_CLOCK;
RST <= '0' ; --désactivation du reset
wait for T_CLOCK;

Din <= "00001110"; -- Valeur 14 chargée en entrée du compteur
wait for T_CLOCK;

EN <= '0'; -- Activation du comptage
wait for 100 ns;
-- Désactivation du compteur
EN <= '1';
wait for 20 ns;

Din <= "00001000"; -- Valeur 8 chargée en entrée du compteur
wait for T_CLOCK;
EN <= '0'; -- Activer le compteur
wait for 100 ns;
-- Test de reset pendant le comptage
RST<= '1'; -- activation du reset
wait for T_CLOCK;
RST <= '0'; -- désactivation du reset
wait for T_CLOCK;
end process;
end comportementale;
