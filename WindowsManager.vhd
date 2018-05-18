
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity WindowsManager is
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           CWP : in  STD_LOGIC_VECTOR (4 downto 0); 
           nrs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrd : out  STD_LOGIC_VECTOR (5 downto 0);
           nCWP : out  STD_LOGIC_VECTOR (4 downto 0));
end WindowsManager;

architecture Behavioral of WindowsManager is

signal nx: std_logic_vector(4 downto 0);
begin

PROCESS (rs1,rs2,rd,OP,OP3,CWP)
BEGIN		
		
	 nx <= CWP;
	 IF (op ="10" and op3 = "111100" )  THEN --SAVE
	  		nCWP <= "00000";
			nx <= "00000";
	 ELSIF(op ="10" and op3 ="111101") THEN
			nCWP <= "00001"; -- RESTORE	
			nx <= "00001";			
	 ELSE  
			nCWP <= CWP;
			
	end if;
	--rs1 to nsr1
	 IF   ( conv_integer(rs1) >= 24 AND conv_integer(rs1) <= 31 ) THEN
            nrs1 <= conv_std_logic_vector((conv_integer(rs1) - (conv_integer(cwp) * 16)   ),6);		
    ELSIF( conv_integer(rs1) >= 16 AND conv_integer(rs1) <= 23 ) THEN
          nrs1 <= conv_std_logic_vector((conv_integer(rs1) + (conv_integer(cwp) * 16)  ),6);				
    ELSIF( conv_integer(rs1) >=  8 AND conv_integer(rs1) <= 15 ) THEN
            nrs1 <= conv_std_logic_vector((conv_integer(rs1) + (conv_integer(cwp ) * 16)),6);
	 ELSIF(  conv_integer(rs1) >=  0 AND conv_integer(rs1) <= 7 ) THEN
				nrs1 <= conv_std_logic_vector(conv_integer(rs1),6);		 
    END IF;
	 --rs2 to nsr2
	 IF   ( conv_integer(rs2) >= 24 AND conv_integer(rs2) <= 31 ) THEN
	 
            nrs2 <= conv_std_logic_vector((conv_integer(rs2) - (conv_integer(cwp) * 16) ),6);
				
    ELSIF( conv_integer(rs2) >= 16 AND conv_integer(rs2) <= 23 ) THEN
	 
            nrs2 <= conv_std_logic_vector((conv_integer(rs2) + (conv_integer(cwp )* 16)),6);
						
    ELSIF( conv_integer(rs2) >=  8 AND conv_integer(rs2) <= 15 ) THEN
	 
            nrs2 <= conv_std_logic_vector((conv_integer(rs2) + (conv_integer(cwp) * 16)),6);
				 
	 ELSIF(  conv_integer(rs2) >=  0 AND conv_integer(rs2) <= 7 ) THEN
				nrs2 <= conv_std_logic_vector(conv_integer(rs2),6);
    END IF;
	

	
	  --rd to nrd
	 IF ( conv_integer(rd) >= 24 AND conv_integer(rd) <= 31 ) THEN
	    nrd <= conv_std_logic_vector((conv_integer(rd) - ((conv_integer(nx)) * 16)),6);		
    ELSIF( conv_integer(rd) >= 16 AND conv_integer(rd) <= 23 ) THEN
       nrd <= conv_std_logic_vector((conv_integer(rd) + ((conv_integer(nx))* 16)),6);				
    ELSIF( conv_integer(rd) >=  8 AND conv_integer(rd) <= 15 ) THEN
       nrd <= conv_std_logic_vector((conv_integer(rd) + ((conv_integer(nx)) * 16)),6);
    ELSE   nrd <= conv_std_logic_vector(conv_integer(rd),6);
    END IF;
	 
	END PROCESS;

end Behavioral;