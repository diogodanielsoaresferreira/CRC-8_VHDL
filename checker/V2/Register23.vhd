library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Register23 is
port(dIn		:	in std_logic_vector(23 downto 0);
	  wrEn	:	in std_logic;
	  clk		:	in std_logic;
	  dOut	:	out std_logic_vector(23 downto 0));
end Register23;

architecture Behavioral of Register23 is
begin

	process(clk)
	begin
		if(rising_edge(clk)) then
			if(wrEn='1') then
				dOut <= dIn;
			end if;
		end if;
		
	end process;

end Behavioral;