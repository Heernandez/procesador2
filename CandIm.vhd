
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity CandIm  is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Instr : out  STD_LOGIC_VECTOR (31 downto 0));
end CandIm ;

architecture Behavioral of CandIm is



	COMPONENT Counter
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;          
		cout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;


		COMPONENT im
	PORT(
		clk : IN std_logic;
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

signal a : std_logic_vector(31 downto 0) := (Others =>'0');


begin
		Inst_Counter: Counter PORT MAP(
		rst => rst,
		clk => clk,
		cout => a
	);
	
	Inst_im: im PORT MAP(
		clk => clk,
		address => a,
		reset => rst,
		outInstruction => Instr
	);


end Behavioral;

