-- Escrito por:
--     Adelino Afonso Fernandes Avelino

library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY display IS
    PORT(digito      : IN    STD_LOGIC_VECTOR(7 downto 0);
         dado : out STD_LOGIC_VECTOR(7 downto 0));
END display;

ARCHITECTURE slave OF display IS
    
BEGIN
PROCESS  (Digito)
-- Decodificador
BEGIN
CASE Digito IS
        WHEN "00000000" =>
            dado <= "01111110";
        WHEN "00000001" =>
            dado <= "00110000";
        WHEN "00000010" =>
            dado <= "01101101";
        WHEN "00000011" =>
            dado <= "01111001";
        WHEN "00000100" =>
            dado <= "00110011";
        WHEN "00000101" =>
            dado <= "01011011";
        WHEN "00000110" =>
            dado <= "01011111";
        WHEN "00000111" =>
            dado <= "01110000";
        WHEN "00001000" =>
            dado <= "01111111";
        WHEN "00001001" =>
            dado <= "01111011"; 
        WHEN "00001010" =>
            dado <= "01110111";
        WHEN "00001011" =>
            dado <= "00011111"; 
        WHEN "00001100" =>
            dado <= "01001110"; 
        WHEN "00001101" =>
            dado <= "00111101"; 
        WHEN "00001110" =>
            dado <= "01001111"; 
        WHEN "00001111" =>
            dado <= "01000111"; 
       WHEN OTHERS =>
            dado <= "00111110";
END CASE;
END PROCESS;


END slave;