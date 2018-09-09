library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity RemainderCheck_bit6 is
port (dIn 	:	in STD_LOGIC_VECTOR(15 downto 0);
		CRCbit:	in STD_LOGIC;
		dOut	:	out STD_LOGIC);
end RemainderCheck_bit6;

architecture LogicFunction of RemainderCheck_bit6 is
	signal level1	:	STD_LOGIC_VECTOR(2 downto 0);
	signal level2	:	STD_LOGIC_VECTOR(1 downto 0);
begin

	level1(2) <= dIn(11) xor dIn(7) after 2ns;
	level1(1) <= dIn(4) xor dIn(2) after 2ns;
	level1(0) <= dIn(1) xor dIn(0) after 2ns;
	
	level2(1) <= level1(1) xor level1(0) after 2ns;
	level2(0) <= level1(2) xor CRCbit after 2ns;
	
	dOut <= level2(1) xor level2(0) after 2ns;

end LogicFunction;
