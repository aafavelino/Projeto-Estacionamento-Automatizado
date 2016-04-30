-- Escrito por:
--     Adelino Afonso Fernandes Avelino

library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY main IS
    PORT(vagas_ocupadas : IN STD_LOGIC_VECTOR(7 downto 0);
         saida01        : OUT  STD_LOGIC_VECTOR(7 downto 0);
         saida02        : OUT  STD_LOGIC_VECTOR(7 downto 0));
END main;

ARCHITECTURE behavior OF main IS



COMPONENT somador IS
    PORT(digito      : IN  STD_LOGIC_VECTOR(7 downto 0);
         dado        : IN STD_LOGIC_VECTOR(7 downto 0);
         saida       : OUT STD_LOGIC_VECTOR(7 downto 0));
END COMPONENT;

COMPONENT subtrator IS
    PORT(digito      : IN  STD_LOGIC_VECTOR(7 downto 0);
         dado        : IN STD_LOGIC_VECTOR(7 downto 0);
         saida       : OUT STD_LOGIC_VECTOR(7 downto 0));
END COMPONENT;

COMPONENT comparador IS
    PORT(digito      : IN  STD_LOGIC_VECTOR(7 downto 0);
         dado        : IN STD_LOGIC_VECTOR(7 downto 0);
         compara     : OUT STD_LOGIC);
END COMPONENT;

COMPONENT mux_2x1 IS
    PORT(digito      : IN  STD_LOGIC_VECTOR(7 downto 0);
         dado        : IN  STD_LOGIC_VECTOR(7 downto 0);
         seletor     : IN  STD_LOGIC;
         saida       : OUT STD_LOGIC_VECTOR(7 downto 0));
END COMPONENT;


COMPONENT display IS
    PORT(digito      : IN    STD_LOGIC_VECTOR(7 downto 0);
         dado : out STD_LOGIC_VECTOR(7 downto 0));
END COMPONENT;


SIGNAL total_vagas : STD_LOGIC_VECTOR (7 downto 0);
SIGNAL vagas_livres: STD_LOGIC_VECTOR(7 downto 0);
SIGNAL dez : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL um : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL menor_maior : STD_LOGIC;
SIGNAL menor_maior1 : STD_LOGIC;
SIGNAL menor_maior2 : STD_LOGIC;
SIGNAL menor_maior3 : STD_LOGIC;
SIGNAL menor_maior4 : STD_LOGIC;
SIGNAL dezena : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL dezena1 : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL dezena2 : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL dezena3 : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL dezena4 : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL unidade : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL vagas_restantes : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL vagas_restantes1 : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL vagas_restantes2 : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL vagas_restantes3 : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL vagas_restantes4 : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL resto : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL resto1 : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL resto2 : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL resto3 : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL resto4 : STD_LOGIC_VECTOR(7 downto 0);
BEGIN
dez <= "00001010";
um  <= "00000001";

total_vagas <= "00110010";

subtrair : subtrator
PORT MAP(total_vagas , vagas_ocupadas, vagas_livres);

comparar : comparador
PORT MAP(vagas_livres, dez, menor_maior);

subtrair1 : subtrator
PORT MAP(vagas_livres, dez, vagas_restantes);

mux : mux_2x1
PORT MAP(vagas_livres, vagas_restantes, menor_maior, resto);

PROCESS(dezena,um, menor_maior)
  BEGIN
    IF(menor_maior = '1')THEN
      dezena <= um;
    ELSE
      dezena <= "00000000";
    END IF;
END PROCESS;




comparar1 : comparador
PORT MAP(resto, dez, menor_maior1);

subtrair2 : subtrator
PORT MAP(resto, dez, vagas_restantes1);

mux1 : mux_2x1
PORT MAP(resto, vagas_restantes1, menor_maior1, resto1);

PROCESS(dezena1,um, menor_maior1)
  BEGIN
    IF(menor_maior1 = '1')THEN
      dezena1 <= dezena + 1;
    ELSE
      dezena1 <= dezena;
    END IF;
END PROCESS;


comparar2 : comparador
PORT MAP(resto1, dez, menor_maior2);

subtrair3 : subtrator
PORT MAP(resto1, dez, vagas_restantes2);

mux2 : mux_2x1
PORT MAP(resto1, vagas_restantes2, menor_maior2, resto2);

PROCESS(dezena2,um, menor_maior2)
  BEGIN
    IF(menor_maior2 = '1')THEN
      dezena2 <= dezena1 + 1;
    ELSE
      dezena2 <= dezena1;
    END IF;
END PROCESS;

comparar3 : comparador
PORT MAP(resto2, dez, menor_maior3);

subtrair4 : subtrator
PORT MAP(resto2, dez, vagas_restantes3);

mux3 : mux_2x1
PORT MAP(resto2, vagas_restantes3, menor_maior3, resto3);

PROCESS(dezena3,um, menor_maior3)
  BEGIN
    IF(menor_maior3 = '1')THEN
      dezena3 <= dezena2 + 1;
    ELSE
      dezena3 <= dezena2;
    END IF;
END PROCESS;



comparar4 : comparador
PORT MAP(resto3, dez, menor_maior4);

subtrair5 : subtrator
PORT MAP(resto3, dez, vagas_restantes4);

mux4 : mux_2x1
PORT MAP(resto3, vagas_restantes4, menor_maior4, resto4);

PROCESS(dezena4,um, menor_maior4)
  BEGIN
    IF(menor_maior4 = '1')THEN
      dezena4 <= dezena3 + 1;
    ELSE
      dezena4 <= dezena3;
    END IF;
END PROCESS;

displays : display
PORT MAP(dezena4, saida01);

displays2 : display
PORT MAP(resto4, saida02);
   
   
END behavior;