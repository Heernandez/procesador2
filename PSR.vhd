
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PSR is
    Port ( clk : in STD_LOGIC;
			  rst : in STD_LOGIC;
			  NZVC : in  STD_LOGIC_VECTOR (3 downto 0);
           nCWP : in  STD_LOGIC_VECTOR (4 downto 0);
			  C   : out STD_LOGIC;
           CWP : out  STD_LOGIC_VECTOR (4 downto 0));
end PSR;

architecture Behavioral of PSR is


signal PSR_R: std_logic_vector (31 downto 0):=(Others =>'0');


begin
	PROCESS(clk,rst,NZVC,nCWP)
		BEGIN 
			 if (rising_edge(clk) and clk ='1') then
					if (rst ='1') then
						PSR_R <="00000000000000000000000000000000";	
						C <='0';
						CWP<="00000";
					else 
						C <= PSR_R(20);
						CWP <= PSR_R(4 downto 0);
					   PSR_R(23 downto 20) <= NZVC;
					   PSR_R(4 downto 0) <= nCWP;
				 end if;
			 end if;
		END PROCESS;

end Behavioral;

