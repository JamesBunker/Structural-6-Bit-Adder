library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
 
 entity 6bit_ripple is
 Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
 B : in STD_LOGIC_VECTOR (5 downto 0);
 Cin : in STD_LOGIC;
 S : out STD_LOGIC_VECTOR (5 downto 0);
 Cout : out STD_LOGIC);
end 6bit_ripple;
 
architecture Structural of 6bit_ripple is
-- Carry out signals
	signal Cout1,Cout2,Cout3,Cout4,Cout5: STD_LOGIC;
	component FullAdder is 
    	Port ( A_FA : in  STD_LOGIC;
           B_FA : in  STD_LOGIC;
           Cin_FA : in  STD_LOGIC;
           Sum_FA : out  STD_LOGIC;
           Cout_FA : out  STD_LOGIC);
	end component FullAdder;
begin
FA0: FullAdder port map( A(0), B(0), Cin, S(0), Cout0);
FA1: FullAdder port map( A(1), B(1), Cout0, S(1), Cout1);
FA2: FullAdder port map( A(2), B(2), Cout1, S(2), Cout2);
FA3: FullAdder port map( A(3), B(3), Cout2, S(3), Cout3);
FA4: FullAdder port map( A(4), B(4), Cout3, S(4), Cout4);
FA5: FullAdder port map( A(5), B(5), Cout4, S(5), Cout5);
end Structural;

