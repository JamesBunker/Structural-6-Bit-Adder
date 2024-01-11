LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY 6bit_ripple_TB IS
END 6bit_ripple_TB;
 
ARCHITECTURE behavior OF 6bit_ripple_TB
-- Component Declaration for the Unit Under Test (UUT)
 
COMPONENT 6bit_ripple
PORT(
A : IN std_logic_vector(5 downto 0);
B : IN std_logic_vector(5 downto 0);
Cin : IN std_logic;
S : OUT std_logic_vector(5 downto 0);
Cout : OUT std_logic
);
END COMPONENT;
 
--Inputs
signal A : std_logic_vector(5 downto 0) := (others => '0');
signal B : std_logic_vector(5 downto 0) := (others => '0');
signal Cin : std_logic := '0';
 
--Outputs
signal S : std_logic_vector(3 downto 0);
signal Cout : std_logic;
 
BEGIN
 
-- Instantiate the Unit Under Test (UUT)
uut: 6bit_ripple PORT MAP (
A => A,
B => B,
Cin => Cin,
S => S,
Cout =>; Cout
);
 
-- Stimulus process
stim_proc: process
begin
-- hold reset state for 100 ns.
wait for 100 ns;
A <= "011011";
B <= "000000";
 
wait for 100 ns;
A <= "111111";
B <= "110101";
 
wait for 100 ns;
A <= "000000";
B <= "010101";
 
wait for 100 ns;
A <= "001010";
B <= "101010";
 
wait for 100 ns;
A <= "101011";
B <= "111111";
 
wait;
 
end process;
 
END;
