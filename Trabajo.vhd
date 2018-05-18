
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Trabajo is
    Port ( rst : in STD_LOGIC;
			  clk : in STD_LOGIC;
 			  Instr : in  STD_LOGIC_VECTOR (31 downto 0);
           Result : out  STD_LOGIC_VECTOR (31 downto 0));
end Trabajo;

architecture Behavioral of Trabajo is

	COMPONENT rf
	PORT(
		rst : IN std_logic;
		rs1 : IN std_logic_vector(5 downto 0);
		rs2 : IN std_logic_vector(5 downto 0);
		rd : IN std_logic_vector(5 downto 0);
		dwr : IN std_logic_vector(31 downto 0);          
		crs1 : OUT std_logic_vector(31 downto 0);
		crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT uc
	PORT(
		OP2 : IN std_logic_vector(1 downto 0);
		OP3 : IN std_logic_vector(5 downto 0);          
		ALUOP : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

	COMPONENT sign
	PORT(
		IMM : IN std_logic_vector(12 downto 0);          
		NIMM : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT mux
	PORT(
		sel : IN std_logic;
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);          
		C : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT alu
	PORT(
		a : IN std_logic_vector(31 downto 0);
		b : IN std_logic_vector(31 downto 0);
		aluop : IN std_logic_vector(5 downto 0);   
		carry : in  STD_LOGIC;		
		c : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;



	
	COMPONENT WindowsManager
	PORT(
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);
		CWP : IN std_logic_vector(4 downto 0);     
		nrs1 : OUT std_logic_vector(5 downto 0);
		nrs2 : OUT std_logic_vector(5 downto 0);
		nrd : OUT std_logic_vector(5 downto 0);
		nCWP : OUT std_logic_vector(4 downto 0)
		);
	END COMPONENT;

	
	COMPONENT PSRMoodifier
	PORT(
		crs1 : IN std_logic;
		operando2 : IN std_logic;
		Result : IN std_logic_vector(31 downto 0);
		Aluop : IN std_logic_vector(5 downto 0);          
		NZVC : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	
	COMPONENT PSR
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		NZVC : IN std_logic_vector(3 downto 0);
		nCWP : IN std_logic_vector(4 downto 0);          
		C : OUT std_logic;
		CWP : OUT std_logic_vector(4 downto 0)
		);
	END COMPONENT;
	


signal c1     : std_logic_vector(31 downto 0) :=(Others =>'0');
signal c2     : std_logic_vector(31 downto 0) :=(Others =>'0');
signal option : std_logic_vector(5 downto 0) :=(Others =>'0');

signal extend : std_logic_vector(31 downto 0) :=(Others =>'0');
signal op     : std_logic_vector(31 downto 0) :=(Others =>'0');


signal res    : std_logic_vector(31 downto 0) :=(Others =>'0');



signal nr1  : std_logic_vector(5 downto 0) :=(Others =>'0');
signal nr2  : std_logic_vector(5 downto 0) :=(Others =>'0');
signal nd2  : std_logic_vector(5 downto 0) :=(Others =>'0');

signal n_cwp  : std_logic_vector(4 downto 0):="00000"; --(Others =>'0');
signal cwpin  : std_logic_vector(4 downto 0) :="00000";--(Others =>'0');
signal ICC : std_logic_vector(3 downto 0) :="0000";--(Others =>'0');

signal cwpin2  : std_logic_vector(4 downto 0) :="00000";--(Others =>'0');


signal carry : std_logic :='0';
begin



Inst_WindowsManager: WindowsManager PORT MAP(
		rs1 => Instr(18 downto 14),
		rs2 => Instr(4 downto 0),
		rd =>  Instr(29 downto 25),
		op => Instr(31 downto 30) ,
		op3 => Instr(24 downto 19),
		CWP => cwpin,
		nrs1 => nr1,
		nrs2 => nr2,
		nrd => nd2,
		nCWP => n_cwp
	);
Inst_PSR: PSR PORT MAP(
		clk => clk,
		rst => rst,
		NZVC => ICC,
		nCWP => n_cwp,
		C => carry,
		CWP => cwpin
	);

	Inst_rf: rf PORT MAP(
		rst => rst,
		rs1 => nr1,
		rs2 => nr2,
		rd =>  nd2,
		dwr => res,
		crs1 => c1,
		crs2 => c2
	);
	
	Inst_uc: uc PORT MAP(
		OP2 => Instr(31 downto 30) ,
		OP3 => Instr(24 downto 19),
		ALUOP => option
	);

	Inst_sign: sign PORT MAP(
		IMM =>  Instr(12 downto 0),
		NIMM => extend
	);

	Inst_mux: mux PORT MAP(
		sel => Instr(13),
		A =>  c2,
		B =>  extend,
		C =>  op
	);
	
	Inst_alu: alu PORT MAP(
		a => c1,
		b => op,
		carry => carry,
		aluop => option,
		c => res
	);
	
	
	Inst_PSRMoodifier: PSRMoodifier PORT MAP(
		crs1 => c1(31),
		operando2 => c2(31),
		Result => res,
		Aluop => option,
		NZVC => ICC
	);



	
Result <= res;
end Behavioral;

