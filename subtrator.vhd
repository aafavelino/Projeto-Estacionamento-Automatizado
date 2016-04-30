-- Escrito por:
--     Adelino Afonso Fernandes Avelino

library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY subtrator IS
    PORT(digito      : IN  STD_LOGIC_VECTOR(7 downto 0);
         dado        : IN STD_LOGIC_VECTOR(7 downto 0);
         saida       : OUT STD_LOGIC_VECTOR(7 downto 0));
END subtrator;

ARCHITECTURE behavior OF subtrator IS
BEGIN
   saida <= digito - dado;
END behavior;