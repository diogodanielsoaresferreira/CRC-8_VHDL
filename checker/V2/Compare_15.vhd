library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Compare_15 is
port(dIn		:	in 	std_logic_vector(3 downto 0);
	  result	:	out 	std_logic);
end Compare_15;

architecture logicFunction of Compare_15 is
	signal level1	:	STD_LOGIC_VECTOR(1 downto 0);
begin
	
	level1(1) <= dIn(2) and dIn(3) after 2ns;
	level1(0) <= dIn(0) and dIn(1) after 2ns;
	
	
	result <= level1(0) and level1(1) after 2ns;
end logicFunction;