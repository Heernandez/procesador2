
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity unidad is
    Port ( a : in  STD_LOGIC_VECTOR (4 downto 0);
           b : out  STD_LOGIC_VECTOR (4 downto 0));
end unidad;

architecture Behavioral of unidad is

begin
b<=a;

end Behavioral;

