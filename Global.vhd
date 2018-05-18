
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Global is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Paso : out  STD_LOGIC_VECTOR (31 downto 0));
end Global;

architecture Behavioral of Global is



	COMPONENT CandIm
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;          
		Instr : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT Trabajo
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;
		Instr : IN std_logic_vector(31 downto 0);          
		Result : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

signal Instruccion : STD_LOGIC_VECTOR(31 DOWNTO 0) := (Others =>'0');



begin

Inst_CandIm: CandIm PORT MAP(
		rst => rst,
		clk => clk,
		Instr => Instruccion
	);

	Inst_Trabajo: Trabajo PORT MAP(
		rst => rst,
		clk => clk,

		Instr => Instruccion,
		Result => Paso
	);




end Behavioral;

