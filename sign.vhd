
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity sign is
    Port ( IMM : in  STD_LOGIC_VECTOR (12 downto 0);
           NIMM : out  STD_LOGIC_VECTOR (31 downto 0));
end sign;

architecture Behavioral of sign is

signal temp : std_logic_vector(31 downto 0) := (others => '0');

begin

	PROCESS (IMM) -- Lista sensiliva
		BEGIN
			
			IF IMM(12) = '0' THEN 
				NIMM <= "0000000000000000000" & IMM;

			ELSE 
				NIMM <= "1111111111111111111" & IMM;

			END IF;
	END PROCESS;


end Behavioral;


