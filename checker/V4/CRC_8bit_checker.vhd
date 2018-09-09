library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity CRC_8bit_checker is

port (dIn 		:	in STD_LOGIC_VECTOR(23 downto 0);
		correct	:	out STD_LOGIC);

end CRC_8bit_checker;

architecture Structural of CRC_8bit_checker is
	signal rem_out :	STD_LOGIC_VECTOR(7 downto 0);
begin
	
	rem_bit7to0:
					entity work.RemainderCheck_bit7to0
						PORT MAP (
							dIn => dIn(23 downto 8),
							CRCbits => dIn(7 downto 0),
							dOut => rem_out);
	
	check_crc8:
					entity work.Check_CRC8
						PORT MAP (
							dIn => rem_out,
							dOut => correct);

end Structural;
