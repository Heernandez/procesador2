
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity mux is
    Port ( sel : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
			  C : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end mux;

architecture Behavioral of mux is

begin

	PROCESS (A,B,sel) -- Lista sensiliva
		BEGIN
			IF sel = '1' THEN C <= B;
			ELSE C <= A;
			END IF;
	END PROCESS;
	
end Behavioral;

