
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.std_logic_unsigned.ALL;

entity Adder is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
			  B : in  STD_LOGIC_VECTOR (31 downto 0);
           C : out  STD_LOGIC_VECTOR (31 downto 0));
end Adder;

architecture Behavioral of Adder is

begin

	Process(A) 
		Begin
			C <= A + B;
		End Process;
end Behavioral;