library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity RemainderCheck_bit7 is
port (dIn 	:	in STD_LOGIC_VECTOR(15 downto 0);
		CRCbit:	in STD_LOGIC;
		dOut	:	out STD_LOGIC);
end RemainderCheck_bit7;

architecture LogicFunction of RemainderCheck_bit7 is
	signal level1	:	STD_LOGIC_VECTOR(4 downto 0);
	signal level2	:	STD_LOGIC_VECTOR(1 downto 0);
	signal level3	:	STD_LOGIC;
begin

	level1(4) <= dIn(0) xor CRCbit after 2ns;
	level1(3) <= dIn(15) xor dIn(14) after 2ns;
	level1(2) <= dIn(12) xor dIn(13) after 2ns;
	level1(1) <= dIn(7) xor dIn(6) after 2ns;
	level1(0) <= dIn(2) xor dIn(5) after 2ns;
	
	level2(1) <= level1(3) xor level1(2) after 2ns;
	level2(0) <= level1(1) xor level1(0) after 2ns;
	
	level3 <= level2(0) xor level2(1) after 2ns;
	
	dOut <= level3 xor level1(4) after 2ns;

end LogicFunction;
