library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Check_CRC8 is
port (dIn 	:	in STD_LOGIC_VECTOR(7 downto 0);
		dOut	:	out STD_LOGIC);
end Check_CRC8;

architecture LogicFunction of Check_CRC8 is
	signal level0	:	STD_LOGIC_VECTOR(7 downto 0);
	signal level1	:	STD_LOGIC_VECTOR(3 downto 0);
begin

	level0(0) <= dIn(0) or dIn(1) after 2ns;
	level0(1) <= dIn(2) or dIn(3) after 2ns;
	level0(2) <= dIn(4) or dIn(5) after 2ns;
	level0(3) <= dIn(6) or dIn(7) after 2ns;
	
	level1(0) <= level0(0) or level0(1) after 2ns;
	level1(1) <= level0(2) or level0(3) after 2ns;
	
	dOut <= not (level1(0) or level1(1)) after 2ns;

end LogicFunction;