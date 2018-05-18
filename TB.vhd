
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY TB IS
END TB;
 
ARCHITECTURE behavior OF TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Global
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         Paso : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal Paso : std_logic_vector(31 downto 0);

   -- Clock period definitions
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Global PORT MAP (
          rst => rst,
          clk => clk,
          Paso => Paso
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      rst <= '1';
      wait for 20 ns;	
		rst <= '0';
      wait;
   end process;

END;
