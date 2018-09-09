library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Remainder_bit4 is
port (dIn 	:	in STD_LOGIC_VECTOR(15 downto 0);
		dOut	:	out STD_LOGIC);
end Remainder_bit4;

architecture LogicFunction of Remainder_bit4 is
	signal level1	:	STD_LOGIC_VECTOR(4 downto 0);
	signal level2	:	STD_LOGIC_VECTOR(1 downto 0);
	signal level3	:	STD_LOGIC;
begin

	level1(4) <= dIn(13) xor dIn(14) after 2ns;
	level1(3) <= dIn(11) xor dIn(12) after 2ns;
	level1(2) <= dIn(6) xor dIn(9) after 2ns;
	level1(1) <= dIn(4) xor dIn(2) after 2ns;
	level1(0) <= dIn(0) xor dIn(1) after 2ns;
	
	level2(1) <= level1(3) xor level1(2) after 2ns;
	level2(0) <= level1(1) xor level1(0) after 2ns;
	
	level3 <= level2(0) xor level2(1) after 2ns;
	
	dOut <= level3 xor level1(4) after 2ns;

end LogicFunction;
