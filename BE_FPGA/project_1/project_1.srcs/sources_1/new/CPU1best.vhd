----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/17/2024 10:44:38 PM
-- Design Name: 
-- Module Name: CPU1best - Behavioral
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
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CPU1best is
    Port (
       CLK      : in    std_logic;
       RST      : in    std_logic;
       Output   : out   STD_LOGIC_VECTOR(7 downto 0)
    );
end CPU1best;

architecture Behavioral of CPU1best is

component Compteurbest is
        Port(   CLK     : in    STD_LOGIC;
                RST     : in    STD_LOGIC;
                DOUT   : out   STD_LOGIC_VECTOR (7 downto 0));
end component;

component Instructionmemorybest is  -- Déclaration du composant pour la mémoire des instructions (ROM)
    Port (
        CLK       : in  std_logic;
        DATA_OUTI : out STD_LOGIC_VECTOR (31 downto 0);
        addr_I    : in  STD_LOGIC_VECTOR (7 downto 0)
    );
end component;

component Basculebest is
    Port ( --partie bascule
           ai : in STD_LOGIC_VECTOR (7 downto 0);
           bi : in STD_LOGIC_VECTOR (7 downto 0); 
           ci : in STD_LOGIC_VECTOR (7 downto 0);
           opi : in STD_LOGIC_VECTOR (7 downto 0);
           ao : out STD_LOGIC_VECTOR (7 downto 0);
           bo : out STD_LOGIC_VECTOR (7 downto 0); 
           co : out STD_LOGIC_VECTOR (7 downto 0);
           opo : out STD_LOGIC_VECTOR (7 downto 0);
           CLK: in std_logic );
end component;

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
end component;

component LC_OP_RE is
    Port ( op : in STD_LOGIC_VECTOR (7 downto 0);
           W : out STD_LOGIC);
end component ;

    signal IP_memInstru         : STD_LOGIC_VECTOR(7 downto 0);
    signal memInstru_LiDi       : STD_LOGIC_VECTOR(31 downto 0);
    signal LiDi_A               : STD_LOGIC_VECTOR(7 downto 0);
    signal LiDi_B               : STD_LOGIC_VECTOR(7 downto 0);
    signal LiDi_C               : STD_LOGIC_VECTOR(7 downto 0);
    signal LiDi_OP              : STD_LOGIC_VECTOR(7 downto 0);
    signal LC_OP                : STD_LOGIC;
    signal RegistreBank_Out     : STD_LOGIC_VECTOR(7 downto 0);
    signal None_signal          : STD_LOGIC_VECTOR(7 downto 0) := (others => 'X');
    type reg_array is array(15 downto 0) of STD_LOGIC_VECTOR (7 downto 0); --définition d'un tableau de 16 régistres de 8 bits chacun
    signal registers : reg_array:= (others=>(others=>'0'));
    signal addr_w_signal        : STD_LOGIC_VECTOR(3 downto 0);

    
begin
    registers(conv_integer(unsigned(addr_W_signal)))<=LiDi_A ;
    U1 : Compteurbest Port map(   CLK     => CLK,
                                  RST     => RST, 
                                  Dout    => IP_memInstru);
                                  
    U2 : Instructionmemorybest Port map(  CLK        => CLK,
                                          addr_I     => IP_memInstru  , 
                                          DATA_OUTI  => memInstru_LiDi);
    U3 : Basculebest Port map(   ai    => memInstru_LiDi(31 downto 24),
                                 bi    => memInstru_LiDi(23 downto 16),
                                 opi   => memInstru_LiDi(15 downto 8),
                                 ci    => memInstru_LiDi(7 downto 0),
                                 CLK   => CLK,
                                 ao    => LiDi_A,
                                 bo    => LiDi_B,
                                 co    => LiDi_C,
                                 opo   => LiDi_OP);
                                 
    U4 : Benchbest Port map (   ADDR_A  => (others => 'X'),
                                ADDR_B  => (others => 'X'),
                                addr_W => addr_W_signal,
                                W       => LC_OP,                  -- ATENTION !
                                DATA    => LiDi_B,
                                RST     => RST,
                                CLK     => CLK,
                                QA      => None_signal,
                                QB      => None_signal);
                                
    U5: LC_OP_RE Port map (     op=>LiDi_OP,
                                W=>LC_OP);
                                 
                                
 
end Behavioral;
