library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity CRC_8bit_encoder is
port (dIn 	:	in STD_LOGIC_VECTOR(15 downto 0);
		dOut	:	out STD_LOGIC_VECTOR(23 downto 0));
end CRC_8bit_encoder;

architecture Structural of CRC_8bit_encoder is
	signal rem_out :	STD_LOGIC_VECTOR(7 downto 0);
begin
	
	rem_bit7to0:
					entity work.Remainder_bit7to0
						PORT MAP (
							dIn => dIn(15 downto 0),
							dOut => rem_out);
	
	dOut(7 downto 0) <= rem_out;
	dOut(23 downto 8) <= dIn;

end Structural;
