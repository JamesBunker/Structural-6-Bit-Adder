library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity top is
  generic (bits : integer := 6);
  port (clk : in  std_logic;
        Ain : in  std_logic_vector (bits-1 downto 0);
        Bin : in  std_logic_vector (bits-1 downto 0);
        Cin : in  std_logic;
        OVF : out std_logic;
        Cathode   : out std_logic_vector(7 downto 0);
        Anode  : out std_logic_vector(7 downto 0));
end top;

architecture Structural of top is

component SSD_logic is
    Port (clk : in      STD_LOGIC;    
           input : in STD_LOGIC_VECTOR (31 downto 0); -- 4 bytes * 8 ssd
           Cathode : out STD_LOGIC_VECTOR (7 downto 0);
           Anode : out STD_LOGIC_VECTOR (7 downto 0));
end component SSD_logic;

component nBitAdder is
Generic(n:integer);
    Port ( A : in  STD_LOGIC_VECTOR (n-1 downto 0);
           B : in  STD_LOGIC_VECTOR (n-1 downto 0);
		   Cin : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (n downto 0);
           Cout : out  STD_LOGIC);
end component nBitAdder;

  signal SUM : std_logic_vector(bits downto 0);
  signal SUM_padded : std_logic_vector (31 downto 0);

begin

  nBitAddition : nBitAdder
    generic map (n => bits)
    port map (A  => Ain,
              B  => Bin,
              Cin => Cin,
              S  => SUM,
              Cout => OVF);

  SUM_padded <= ((SUM_padded'length - 1) downto SUM'length => '0') & SUM;

  SSD : SSD_logic
    port map (clk => clk, input => SUM_padded, Cathode => Cathode, Anode => Anode);

end Structural;
