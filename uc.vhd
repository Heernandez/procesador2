
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity uc is
    Port ( OP2 : in  STD_LOGIC_VECTOR (1 downto 0);
           OP3 : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOP : out  STD_LOGIC_VECTOR (5 downto 0));
end uc;

architecture Behavioral of uc is

begin


PROCESS (OP2,OP3) -- Lista sensiliva
		BEGIN
			if OP2 ="10" THEN 
				ALUOP <= OP3;
			else ALUOP <= "111111";
			END IF;
END PROCESS;


end Behavioral;

