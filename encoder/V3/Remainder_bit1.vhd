library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Remainder_bit1 is
port (dIn 	:	in STD_LOGIC_VECTOR(15 downto 0);
		dOut	:	out STD_LOGIC);
end Remainder_bit1;

architecture LogicFunction of Remainder_bit1 is
	signal level1	:	STD_LOGIC_VECTOR(3 downto 0);
	signal level2	:	STD_LOGIC_VECTOR(1 downto 0);
begin

	level1(3) <= dIn(15) xor dIn(14) after 2ns;
	level1(2) <= dIn(9) xor dIn(8) after 2ns;
	level1(1) <= dIn(7) xor dIn(4) after 2ns;
	level1(0) <= dIn(2) xor dIn(1) after 2ns;
	
	level2(1) <= level1(3) xor level1(2) after 2ns;
	level2(0) <= level1(1) xor level1(0) after 2ns;
	
	dOut <= level2(0) xor level2(1) after 2ns;

end LogicFunction;
