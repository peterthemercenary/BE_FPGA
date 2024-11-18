----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/08/2024 02:36:52 PM
-- Design Name: 
-- Module Name: ALUtest - Behavioral
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

entity ALUtest is
end ALUtest;
architecture Behavioral of ALUtest is
    signal ain : STD_LOGIC_VECTOR(7 downto 0);
    signal bin : STD_LOGIC_VECTOR(7 downto 0);
    signal opin : STD_LOGIC_VECTOR(2 downto 0);
    signal resout : STD_LOGIC_VECTOR(7 downto 0);
    signal cout : STD_LOGIC;
    signal oout : STD_LOGIC;
    signal nout : STD_LOGIC;
component ALUbest is
    Port (
    a : in STD_LOGIC_VECTOR(7 downto 0);
    b : in STD_LOGIC_VECTOR(7 downto 0);
    Ctrl_Alu : in STD_LOGIC_VECTOR(2 downto 0);
    res : out STD_LOGIC_VECTOR(7 downto 0);
    c : out STD_LOGIC;
    o : out STD_LOGIC;
    n : out STD_LOGIC
    );
end component;
begin
        uut: ALUbest
        Port map (
        a => ain,
        b => bin,
        Ctrl_Alu => opin,
        res => resout,
        c=> cout,
        o => oout,
        n => nout
        );
process
begin
        -- Test Addition
        ain <= "00001110"; -- 14
        bin <= "00000010"; -- 2
        opin <= "000"; -- Addition
        wait for 10 ns;
        -- Test Soustraction
        ain <= "00001111"; -- 15
        bin<= "00000001"; -- 1
        opin <= "001"; -- Soustraction
        wait for 20 ns;
        -- Test Multiplication
        ain <= "00000010"; -- 2
        bin <= "00000111"; -- 7
        opin <= "010"; -- Multiplication
        wait for 30 ns;
        -- Test AND
        ain <= "11001100"; -- 204
        bin <= "10101010"; -- 170
        opin <= "011"; -- AND
        wait for 40 ns;
        -- Test OR
        ain <= "11001100"; -- 204
        bin <= "10101010"; -- 170
        opin <= "100"; -- OR
        wait for 50 ns;
        -- Test XOR
        ain <= "11001100"; -- 204
        bin <= "10101010"; -- 170
        opin <= "101"; -- XOR
        wait for 60 ns;
        -- Test NOT
        ain <= "11001100"; -- 204
        opin <= "110"; -- NOT A
        wait for 10 ns;
        wait;
end process;
end Behavioral;


