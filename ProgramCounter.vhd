
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity ProgramCounter is
    Port ( AddressIn : in  STD_LOGIC_VECTOR (31 downto 0);
           AddressOut : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC);
end ProgramCounter;

architecture Behavioral of ProgramCounter is

begin

process(clk,rst)

	begin
		if (rising_edge(clk) and clk ='1') then
			if(rst ='1') then
				AddressOut <= "00000000000000000000000000000000";
			else
				AddressOut <= AddressIn;
			end if;
		end if;
	end process;
end Behavioral;

