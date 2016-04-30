-- Escrito por:
--     Adelino Afonso Fernandes Avelino
library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY somador IS
    PORT(digito      : IN  STD_LOGIC_VECTOR(7 downto 0);
         dado        : IN STD_LOGIC_VECTOR(7 downto 0);
         saida       : OUT STD_LOGIC_VECTOR(7 downto 0));
END somador;

ARCHITECTURE behavior OF somador IS
BEGIN
   saida <= digito + dado;
END behavior;