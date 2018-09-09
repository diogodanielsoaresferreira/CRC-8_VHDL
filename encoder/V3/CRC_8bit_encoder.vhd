library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity CRC_8bit_encoder is
port (dIn 	:	in STD_LOGIC_VECTOR(15 downto 0);
		dOut	:	out STD_LOGIC_VECTOR(23 downto 0));
end CRC_8bit_encoder;

architecture Structural of CRC_8bit_encoder is
	signal rem_out :	STD_LOGIC_VECTOR(7 downto 0);
begin
	
	rem_bit0:
					entity work.Remainder_bit0
						PORT MAP (
							dIn => dIn(15 downto 0),
							dOut => rem_out(0));
							
	rem_bit1:
					entity work.Remainder_bit1
						PORT MAP (
							dIn => dIn(15 downto 0),
							dOut => rem_out(1));
	
	rem_bit2:
					entity work.Remainder_bit2
						PORT MAP (
							dIn => dIn(15 downto 0),
							dOut => rem_out(2));
	
	rem_bit3:
					entity work.Remainder_bit3
						PORT MAP (
							dIn => dIn(15 downto 0),
							dOut => rem_out(3));
							
	rem_bit4:
					entity work.Remainder_bit4
						PORT MAP (
							dIn => dIn(15 downto 0),
							dOut => rem_out(4));
	
	rem_bit5:
					entity work.Remainder_bit5
						PORT MAP (
							dIn => dIn(15 downto 0),
							dOut => rem_out(5));
	
	rem_bit6:
					entity work.Remainder_bit6
						PORT MAP (
							dIn => dIn(15 downto 0),
							dOut => rem_out(6));
	
	rem_bit7:
					entity work.Remainder_bit7
						PORT MAP (
							dIn => dIn(15 downto 0),
							dOut => rem_out(7));
	
	dOut(7 downto 0) <= rem_out;
	dOut(23 downto 8) <= dIn;

end Structural;
