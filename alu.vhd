
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity alu is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           aluop : in  STD_LOGIC_VECTOR (5 downto 0);
			  carry : in  STD_LOGIC;
           c : out  STD_LOGIC_VECTOR (31 downto 0));
end alu;

architecture Behavioral of alu is

signal k : std_logic_vector(31 downto 0) := (others => '0');
begin
PROCESS (a,b,aluop) -- Lista sensiliva
		BEGIN
			CASE aluop IS
			
				WHEN "000001" =>  c <= a and b;      -- AND      (AND)
			   WHEN "010001" =>  c <= a and b;      -- ANDCC   (AND)
  				WHEN "000101" =>  c <= a and not b; -- ANDN   (AND NOT)
				WHEN "010101" =>  c <= a and not b;  -- ANDNCC (AND NOT)
				WHEN "000010" =>  c <= a or b; -- OR (OR)
 				WHEN "010010" =>  c <= a or b; --ORCC (OR)
				WHEN "000110" =>  c <= a or not b; -- ORN (OR NOT)
				WHEN "010110" =>  c <= a or not b; --ORNCC (OR NOT)
				WHEN "000011" =>  c <= a xor b;  -- XOR (XOR)
				WHEN "010011" =>  c <= a xor b;  --XORCC  (XOR)
				WHEN "000111" =>  c <= a nor b; --XNOR  (NOR)
				WHEN "010111" =>  c <= a nor b; --XNORCC  (NOR) 
				WHEN "000000" =>  c <= a + b ;  --ADD (+)
				WHEN "010000" =>  c <= a + b ;  --ADDCC  (+)
				WHEN "000100" =>  c <= a - b ; -- SUB (-)
				WHEN "010100" =>  c <= a - b;  -- SUBCC (-)
				WHEN "011000" =>  c <= a + b + carry;  -- ADDXcc (+)
				WHEN "011100" =>  c <= a - b - carry;  -- SUBXcc (-)
				WHEN "111100" =>  c <= a + b ;  -- SAVE
				WHEN "111101" =>  c <= a + b ;  -- RESTORE
			   WHEN  OTHERS  =>    c <= k;  
			 

			END CASE;
		
END PROCESS;
end Behavioral;