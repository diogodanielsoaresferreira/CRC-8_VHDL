library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Remainder_CRC8 is
port (dIn 	:	in STD_LOGIC_VECTOR(8 downto 0);
		en	 	:	in STD_LOGIC;
		dOut	:	out STD_LOGIC_VECTOR(8 downto 0));
end Remainder_CRC8;

architecture LogicFunction of Remainder_CRC8 is
begin

	dOut(0) <= dIn(0) xor en after 2ns;
	dOut(1) <= dIn(1);
	dOut(2) <= dIn(2) xor en after 2ns;
	dOut(3) <= dIn(3);
	dOut(4) <= dIn(4) xor en after 2ns;
	dOut(5) <= dIn(5);
	dOut(6) <= dIn(6) xor en after 2ns;
	dOut(7) <= dIn(7) xor en after 2ns;
	dOut(8) <= dIn(8) xor en after 2ns;

end LogicFunction;
