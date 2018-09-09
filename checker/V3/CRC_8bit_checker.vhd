library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity CRC_8bit_checker is

port (dIn 		:	in STD_LOGIC_VECTOR(23 downto 0);
		correct	:	out STD_LOGIC);

end CRC_8bit_checker;

architecture Structural of CRC_8bit_checker is
	signal rem_out :	STD_LOGIC_VECTOR(7 downto 0);
begin
	
	rem_bit0:
					entity work.RemainderCheck_bit0
						PORT MAP (
							dIn => dIn(23 downto 8),
							CRCbit => dIn(0),
							dOut => rem_out(0));
							
	rem_bit1:
					entity work.RemainderCheck_bit1
						PORT MAP (
							dIn => dIn(23 downto 8),
							CRCbit => dIn(1),
							dOut => rem_out(1));
	
	rem_bit2:
					entity work.RemainderCheck_bit2
						PORT MAP (
							dIn => dIn(23 downto 8),
							CRCbit => dIn(2),
							dOut => rem_out(2));
	
	rem_bit3:
					entity work.RemainderCheck_bit3
						PORT MAP (
							dIn => dIn(23 downto 8),
							CRCbit => dIn(3),
							dOut => rem_out(3));
							
	rem_bit4:
					entity work.RemainderCheck_bit4
						PORT MAP (
							dIn => dIn(23 downto 8),
							CRCbit => dIn(4),
							dOut => rem_out(4));
	
	rem_bit5:
					entity work.RemainderCheck_bit5
						PORT MAP (
							dIn => dIn(23 downto 8),
							CRCbit => dIn(5),
							dOut => rem_out(5));
	
	rem_bit6:
					entity work.RemainderCheck_bit6
						PORT MAP (
							dIn => dIn(23 downto 8),
							CRCbit => dIn(6),
							dOut => rem_out(6));
	
	rem_bit7:
					entity work.RemainderCheck_bit7
						PORT MAP (
							dIn => dIn(23 downto 8),
							CRCbit => dIn(7),
							dOut => rem_out(7));
	
	check_crc8:
					entity work.Check_CRC8
						PORT MAP (
							dIn => rem_out,
							dOut => correct);

end Structural;
