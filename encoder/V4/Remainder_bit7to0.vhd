library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Remainder_bit7to0 is
port (dIn 	:	in STD_LOGIC_VECTOR(15 downto 0);
		dOut	:	out STD_LOGIC_VECTOR(7 downto 0));
end Remainder_bit7to0;

architecture LogicFunction of Remainder_bit7to0 is
	signal level0	:	STD_LOGIC_VECTOR(12 downto 0);
	signal level1	:	STD_LOGIC_VECTOR(10 downto 0);
	signal level2	:	STD_LOGIC_VECTOR(7 downto 0);
begin

	level0(0) <= dIn(14) xor dIn(1) after 2ns;
	level0(1) <= dIn(15) xor dIn(7) after 2ns;
	level0(2) <= dIn(6) xor dIn(0) after 2ns;
	level0(3) <= dIn(13) xor dIn(12) after 2ns;
	level0(4) <= dIn(11) xor dIn(2) after 2ns;
	level0(5) <= dIn(10) xor dIn(5) after 2ns;
	level0(6) <= dIn(8) xor dIn(3) after 2ns;
	level0(7) <= dIn(9) xor dIn(4) after 2ns;
	level0(8) <= dIn(8) xor dIn(2) after 2ns;
	level0(9) <= dIn(10) xor dIn(6) after 2ns;
	level0(10) <= dIn(7) xor dIn(4) after 2ns;
	level0(11) <= dIn(1) xor dIn(0) after 2ns;
	level0(12) <= dIn(14) xor dIn(5) after 2ns;

	level1(0) <= level0(1) xor level0(0) after 2ns;
	level1(1) <= level0(2) xor level0(3) after 2ns;
	level1(2) <= dIn(13) xor level0(2) after 2ns;
	level1(3) <= dIn(2) xor level0(5) after 2ns;
	level1(4) <= level0(7) xor level0(8) after 2ns;
	level1(5) <= level0(0) xor dIn(7) after 2ns;
	level1(6) <= level0(4) xor level0(9) after 2ns;
	level1(7) <= level0(4) xor level0(7) after 2ns;
	level1(8) <= level0(3) xor dIn(3) after 2ns;
	level1(9) <= level0(4) xor level0(10) after 2ns;
	level1(10) <= dIn(2) xor level0(1) after 2ns;

	level2(0) <= level1(0) xor level0(6) after 2ns;
	level2(1) <= level1(5) xor level1(3) after 2ns;
	level2(2) <= dIn(9) xor level1(2) after 2ns;
	level2(3) <= level1(1) xor level1(7) after 2ns;
	level2(4) <= level1(0) xor level1(8) after 2ns;
	level2(5) <= level0(12) xor level1(10) after 2ns;
	
	dOut(0) <= level1(2) xor level2(0) after 2ns;
	dOut(1) <= level1(0) xor level1(4) after 2ns;
	dOut(2) <= level2(2) xor level2(1) after 2ns;
	dOut(3) <= level1(6) xor level2(0) after 2ns;
	dOut(4) <= level2(3) xor level0(0) after 2ns;
	dOut(5) <= level1(3) xor level2(4) after 2ns;
	dOut(6) <= level0(11) xor level1(9) after 2ns;
	dOut(7) <= level1(1) xor level2(5) after 2ns;
	

end LogicFunction;
