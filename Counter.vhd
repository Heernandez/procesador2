
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Counter is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           cout : out  STD_LOGIC_VECTOR (31 downto 0));
end Counter;


architecture Behavioral of Counter is

	COMPONENT Adder
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);          
		C : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT ProgramCounter
	PORT(
		AddressIn : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;
		rst : IN std_logic;          
		AddressOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;


--signals


signal InPC : std_logic_vector(31 downto 0):= (Others => '0');
signal InNPC : std_logic_vector(31 downto 0):= (Others => '0');
--signal OutNPC : std_logic_vector(31 downto 0):= (Others => '0');


begin
	Inst_PC: ProgramCounter PORT MAP(
		AddressIn => InPC,
		AddressOut => Cout,
		clk => clk,
		rst => rst 
	);
	
	Inst_Adder: Adder PORT MAP(
		A => InPC,
		B => "00000000000000000000000000000001",
		C =>  InNPC
	);
	
	Inst_NextPC: ProgramCounter PORT MAP(
		AddressIn => InNPC,
		AddressOut => InPC,
		clk => clk,
		rst => rst
	);




end Behavioral;

