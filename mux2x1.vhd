-- Escrito por:
--     Adelino Afonso Fernandes Avelino

library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY mux_2x1 IS
    PORT(digito      : IN  STD_LOGIC_VECTOR(7 downto 0);
         dado        : IN  STD_LOGIC_VECTOR(7 downto 0);
         seletor     : IN  STD_LOGIC;
         saida       : OUT STD_LOGIC_VECTOR(7 downto 0));
END mux_2x1;

ARCHITECTURE behavior OF mux_2x1 IS
BEGIN
  PROCESS(digito,dado,seletor)
    BEGIN
    IF (seletor='0') THEN
    saida <= digito;
    ELSE
    saida <= dado;
    END IF;
  END PROCESS;
END behavior;