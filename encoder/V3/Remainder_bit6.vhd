library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Remainder_bit6 is
port (dIn 	:	in STD_LOGIC_VECTOR(15 downto 0);
		dOut	:	out STD_LOGIC);
end Remainder_bit6;

architecture LogicFunction of Remainder_bit6 is
	signal level1	:	STD_LOGIC_VECTOR(2 downto 0);
	signal level2	:	STD_LOGIC;
begin

	level1(2) <= dIn(11) xor dIn(7) after 2ns;
	level1(1) <= dIn(4) xor dIn(2) after 2ns;
	level1(0) <= dIn(1) xor dIn(0) after 2ns;
	
	level2<= level1(1) xor level1(0) after 2ns;
	
	dOut <= level2 xor level1(2) after 2ns;

end LogicFunction;
