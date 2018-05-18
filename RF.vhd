
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
USE ieee.numeric_std.ALL;
use ieee.std_logic_unsigned.all;


entity rf is
    Port ( 
			  rst : in STD_LOGIC;
			  rs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           rd : in  STD_LOGIC_VECTOR (5 downto 0);
           dwr : in  STD_LOGIC_VECTOR (31 downto 0);
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0)	  
			  
			  );
end rf;

architecture Behavioral of rf is



type rom_type is array (0 to 63) of std_logic_vector (31 downto 0);
signal RF : rom_type := (Others => x"00000000");

begin
	
	PROCESS (rs1,rs2,rd,dwr,rst) -- Lista sensiliva
		BEGIN
			
				IF rst ='1' THEN
					crs1 <= (Others => '0');
					crs2 <= (Others => '0');
				ELSE 
					crs1 <= RF(conv_integer(rs1));
					crs2<=  RF(conv_integer(rs2));
					IF rd /= "00000" THEN 
						RF(conv_integer(rd)) <= dwr;
					ELSE 
						RF(conv_integer(rd)) <= (Others => '0');
					END IF;
				END IF;
		
	
	END PROCESS;

end Behavioral;

