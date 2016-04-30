-- Escrito por:
--     Adelino Afonso Fernandes Avelino

library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY comparador IS
    PORT(digito      : IN  STD_LOGIC_VECTOR(7 downto 0);
         dado        : IN STD_LOGIC_VECTOR(7 downto 0);
         compara     : OUT STD_LOGIC);
END comparador;


ARCHITECTURE behavior OF comparador IS
BEGIN

     compara <= '1' WHEN (digito >= dado) ELSE '0';
 
END behavior;
