library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity CRC_8bit_checker is

port (dIn 		:	in STD_LOGIC_VECTOR(23 downto 0);
		load		:	in STD_LOGIC;
		CLOCK		:	in STD_LOGIC;
		correct	:	out STD_LOGIC);

end CRC_8bit_checker;

architecture Structural of CRC_8bit_checker is
	signal register_In		:	STD_LOGIC_VECTOR(23 downto 0);
	signal register_Out		:	STD_LOGIC_VECTOR(23 downto 0);
	signal rem_out				:	STD_LOGIC_VECTOR(8 downto 0);
	signal counter				:	STD_LOGIC_VECTOR(3 downto 0);
	signal stop_calculation	:	STD_LOGIC;
begin

	mux0 :	entity work.mult2to1 
					PORT MAP (
						x0 => rem_out(7),
						x1 => dIn(23),
						s => load,
						y => register_In(23));
						
	mux1 :	entity work.mult2to1 
					PORT MAP (
						x0 => rem_out(6),
						x1 => dIn(22),
						s => load,
						y => register_In(22));
						
	mux2 :	entity work.mult2to1 
					PORT MAP (
						x0 => rem_out(5),
						x1 => dIn(21),
						s => load,
						y => register_In(21));
						
	mux3 :	entity work.mult2to1 
					PORT MAP (
						x0 => rem_out(4),
						x1 => dIn(20),
						s => load,
						y => register_In(20));
						
	mux4 :	entity work.mult2to1 
					PORT MAP (
						x0 => rem_out(3),
						x1 => dIn(19),
						s => load,
						y => register_In(19));
						
	mux5 :	entity work.mult2to1 
					PORT MAP (
						x0 => rem_out(2),
						x1 => dIn(18),
						s => load,
						y => register_In(18));
						
	mux6 :	entity work.mult2to1 
					PORT MAP (
						x0 => rem_out(1),
						x1 => dIn(17),
						s => load,
						y => register_In(17));
						
	mux7 :	entity work.mult2to1 
					PORT MAP (
						x0 => rem_out(0),
						x1 => dIn(16),
						s => load,
						y => register_In(16));
						
	mux8 :	entity work.mult2to1 
					PORT MAP (
						x0 => register_Out(14),
						x1 => dIn(15),
						s => load,
						y => register_In(15));
						
	mux9 :	entity work.mult2to1 
					PORT MAP (
						x0 => register_Out(13),
						x1 => dIn(14),
						s => load,
						y => register_In(14));
						
	mux10 :	entity work.mult2to1 
					PORT MAP (
						x0 => register_Out(12),
						x1 => dIn(13),
						s => load,
						y => register_In(13));
						
	mux11 :	entity work.mult2to1 
					PORT MAP (
						x0 => register_Out(11),
						x1 => dIn(12),
						s => load,
						y => register_In(12));
						
	mux12 :	entity work.mult2to1 
					PORT MAP (
						x0 => register_Out(10),
						x1 => dIn(11),
						s => load,
						y => register_In(11));
						
	mux13 :	entity work.mult2to1 
					PORT MAP (
						x0 => register_Out(9),
						x1 => dIn(10),
						s => load,
						y => register_In(10));
						
	mux14 :	entity work.mult2to1 
					PORT MAP (
						x0 => register_Out(8),
						x1 => dIn(9),
						s => load,
						y => register_In(9));
						
	mux15 :	entity work.mult2to1 
					PORT MAP (
						x0 => register_Out(7),
						x1 => dIn(8),
						s => load,
						y => register_In(8));
						
	mux16 :	entity work.mult2to1 
					PORT MAP (
						x0 => register_Out(6),
						x1 => dIn(7),
						s => load,
						y => register_In(7));
						
	mux17 :	entity work.mult2to1 
					PORT MAP (
						x0 => register_Out(5),
						x1 =>  dIn(6),
						s => load,
						y => register_In(6));
						
	mux18 :	entity work.mult2to1 
					PORT MAP (
						x0 => register_Out(4),
						x1 =>  dIn(5),
						s => load,
						y => register_In(5));
						
	mux19 :	entity work.mult2to1 
					PORT MAP (
						x0 => register_Out(3),
						x1 =>  dIn(4),
						s => load,
						y => register_In(4));
						
	mux20 :	entity work.mult2to1 
					PORT MAP (
						x0 => register_Out(2),
						x1 =>  dIn(3),
						s => load,
						y => register_In(3));
						
	mux21 :	entity work.mult2to1 
					PORT MAP (
						x0 => register_Out(1),
						x1 =>  dIn(2),
						s => load,
						y => register_In(2));
						
	mux22 :	entity work.mult2to1 
					PORT MAP (
						x0 => register_Out(0),
						x1 =>  dIn(1),
						s => load,
						y => register_In(1));
						
	mux23 :	entity work.mult2to1 
					PORT MAP (
						x0 => rem_out(8),
						x1 =>  dIn(0),
						s => load,
						y => register_In(0));
						
	register23:	entity work.Register23
					PORT MAP (
						dIn => register_In,
						dOut => register_Out,
						clk => CLOCK,
						wrEn => not stop_calculation);
	
	rem_polynomial:
					entity work.Remainder_CRC8
						PORT MAP (
							dIn => register_Out(23 downto 15),
							en => register_Out(23),
							dOut => rem_out);
	
	counter_4bit:
					entity work.BinUCntEnRst4
						PORT MAP(reset => load,
									clk	=> CLOCK,
									enable=> not stop_calculation,
									cntOut=> counter);
									
	end_crccalculations:
					entity work.Compare_15
						PORT MAP(dIn => counter,
									result => stop_calculation);
	
	check_crc8:
					entity work.Check_CRC8
						PORT MAP (
							dIn => rem_out (7 downto 0),
							en => stop_calculation,
							dOut => correct);

end Structural;
