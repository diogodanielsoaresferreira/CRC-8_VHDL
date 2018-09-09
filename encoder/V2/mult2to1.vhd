library ieee;
use ieee.std_logic_1164.all;

entity mult2to1 is
port(x0, x1	: in STD_LOGIC;
     s		: in STD_LOGIC;
     y		: out STD_LOGIC);
end mult2to1;

architecture LogicFunction of mult2to1 is
begin
  y <= (x0 AND NOT s) OR (x1 AND s) AFTER 4ns;
end LogicFunction;