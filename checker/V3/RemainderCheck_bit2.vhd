library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity RemainderCheck_bit2 is
port (dIn 	:	in STD_LOGIC_VECTOR(15 downto 0);
		CRCbit:	in STD_LOGIC;
		dOut	:	out STD_LOGIC);
end RemainderCheck_bit2;

architecture LogicFunction of RemainderCheck_bit2 is
	signal level1	:	STD_LOGIC_VECTOR(4 downto 0);
	signal level2	:	STD_LOGIC_VECTOR(2 downto 0);
	signal level3	:	STD_LOGIC;
begin

	level1(4) <= dIn(0) xor dIn(1) after 2ns;
	level1(3) <= dIn(13) xor dIn(14) after 2ns;
	level1(2) <= dIn(10) xor dIn(9) after 2ns;
	level1(1) <= dIn(7) xor dIn(6) after 2ns;
	level1(0) <= dIn(5) xor dIn(2) after 2ns;
	
	level2(2) <= level1(4) xor CRCbit after 2ns;
	level2(1) <= level1(3) xor level1(2) after 2ns;
	level2(0) <= level1(1) xor level1(0) after 2ns;
	
	level3 <= level2(0) xor level2(1) after 2ns;
	
	dOut <= level3 xor level2(2) after 2ns;

end LogicFunction;