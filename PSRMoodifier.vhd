
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity PSRMoodifier is
    Port ( crs1 : in  STD_LOGIC;
           operando2 : in  STD_LOGIC;
           Result : in  STD_LOGIC_VECTOR (31 downto 0);
           Aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           NZVC : out  STD_LOGIC_VECTOR (3 downto 0));
end PSRMoodifier;

architecture Behavioral of PSRMoodifier is

begin
 PROCESS(Crs1,Operando2,Result,Aluop)
 BEGIN
	IF (Result = x"00000000") Then
					NZVC(2)<= '1';
			ELSE
					NZVC(2)<= '0';
			
			END IF;
	--logicas con cc	
	IF (ALUOP = "010001" OR 
		 ALUOP = "010101" OR
		 ALUOP = "010010" OR
		 ALUOP = "010110" OR
		 ALUOP = "010011" OR
		 ALUOP = "010111" ) THEN
		 
		 NZVC(3) <= Result(31);
		 NZVC(1 DOWNTO 0) <= "00";
	END IF;
	
	--addcc
	IF (ALUOP = "010000" ) THEN
		 NZVC(3) <= Result(31);
		 NZVC(1) <= ((crs1 and operando2 and (not result(31))) or( not crs1 and not operando2 and result(31)));
		 NZVC(0) <= (crs1 and operando2) or ((not result(31)) and (crs1 or operando2));
		 
		 
	END IF;
	
	--subcc
	IF (ALUOP = "010100" ) THEN
		 
		 NZVC(3) <= Result(31);
		 NZVC(1) <= ((crs1 and not operando2) and (not result(31))) or( not crs1 and  operando2 and result(31));
		 NZVC(0) <= (((not crs1) and operando2) or (result(31) and((not crs1) or operando2)));   
		 
		 
	END IF;
		 
 END PROCESS;

end Behavioral;

