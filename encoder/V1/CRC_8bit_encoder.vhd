library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity CRC_8bit_encoder is
port (dIn 	:	in STD_LOGIC_VECTOR(15 downto 0);
		dOut	:	out STD_LOGIC_VECTOR(23 downto 0));
end CRC_8bit_encoder;

architecture Structural of CRC_8bit_encoder is
	signal rem1,rem2,rem3,rem4,rem5,rem6,rem7,rem8,rem9,rem10,
			 rem11,rem12,rem13,rem14,rem15 :	STD_LOGIC_VECTOR(8 downto 0);
begin
	
	rem_polynomial0:
					entity work.Remainder_CRC8
						PORT MAP (
							dIn => dIn(15 downto 7),
							en => dIn(15),
							dOut => rem1);
							
	rem_polynomial1:
					entity work.Remainder_CRC8
						PORT MAP (
							dIn => rem1(7 downto 0) & dIn(6),
							en => rem1(7),
							dOut => rem2);
	
	rem_polynomial2:
					entity work.Remainder_CRC8
						PORT MAP (
							dIn => rem2(7 downto 0) & dIn(5),
							en => rem2(7),
							dOut => rem3);
	
	rem_polynomial3:
					entity work.Remainder_CRC8
						PORT MAP (
							dIn => rem3(7 downto 0) & dIn(4),
							en => rem3(7),
							dOut => rem4);
	
	rem_polynomial4:
					entity work.Remainder_CRC8
						PORT MAP (
							dIn => rem4(7 downto 0) & dIn(3),
							en => rem4(7),
							dOut => rem5);
	
	rem_polynomial5:
					entity work.Remainder_CRC8
						PORT MAP (
							dIn => rem5(7 downto 0) & dIn(2),
							en => rem5(7),
							dOut => rem6);
	
	rem_polynomial6:
					entity work.Remainder_CRC8
						PORT MAP (
							dIn => rem6(7 downto 0) & dIn(1),
							en => rem6(7),
							dOut => rem7);
	
	rem_polynomial7:
					entity work.Remainder_CRC8
						PORT MAP (
							dIn => rem7(7 downto 0) & dIn(0),
							en => rem7(7),
							dOut => rem8);
	
	
	rem_polynomial8:
					entity work.Remainder_CRC8
						PORT MAP (
							dIn => rem8(7 downto 0) & '0',
							en => rem8(7),
							dOut => rem9);
	
	rem_polynomial9:
					entity work.Remainder_CRC8
						PORT MAP (
							dIn => rem9(7 downto 0) & '0',
							en => rem9(7),
							dOut => rem10);
	
	rem_polynomial10:
					entity work.Remainder_CRC8
						PORT MAP (
							dIn => rem10(7 downto 0) & '0',
							en => rem10(7),
							dOut => rem11);
	
	rem_polynomial11:
					entity work.Remainder_CRC8
						PORT MAP (
							dIn => rem11(7 downto 0) & '0',
							en => rem11(7),
							dOut => rem12);
	
	rem_polynomial12:
					entity work.Remainder_CRC8
						PORT MAP (
							dIn => rem12(7 downto 0) & '0',
							en => rem12(7),
							dOut => rem13);
	
	rem_polynomial13:
					entity work.Remainder_CRC8
						PORT MAP (
							dIn => rem13(7 downto 0) & '0',
							en => rem13(7),
							dOut => rem14);
	
	rem_polynomial14:
					entity work.Remainder_CRC8
						PORT MAP (
							dIn => rem14(7 downto 0) & '0',
							en => rem14(7),
							dOut => rem15);
	
	rem_polynomial15:
					entity work.Remainder_CRC8
						PORT MAP (
							dIn => rem15(7 downto 0) & '0',
							en => rem15(7),
							dOut(7 downto 0) => dOut(7 downto 0));
	
	
	dOut(23 downto 8) <= dIn;

end Structural;
