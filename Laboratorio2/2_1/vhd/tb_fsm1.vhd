library IEEE;

use IEEE.std_logic_1164.all;
		


entity TBFSM is
end TBFSM;

architecture TEST of TBFSM is

	signal A,B,C,D,E,F : std_logic_vector(15 downto 0) := "0000000000000000";  -- input for adder
	signal clock: std_logic;
	signal Y: std_logic_vector(15 downto 0);

        component adder is
          port (
            A, B, C, D, E, F : in  std_logic_vector(15 downto 0);
            clock            : in  std_logic;
            Y                : out std_logic_vector(15 downto 0));
        end component adder;

begin

  A <= "0000000000000000";
	B <= "0000000000000001";
	C <= "0000000000000010";
	D <= "0000000000000100";
	E <= "0000000000001000";
	F <= "0000000000010000";
	
	
	clock_process:process
	begin
		clock <= '1';			-- clock cycle 2 ns
		wait for 1 ns;
	        clock <= '0';
		wait for 1 ns;
	end process;
        
  -- instance "adder_1"
  adder_1: entity work.adder
    port map (
      A     => A,
      B     => B,
      C     => C,
      D     => D,
      E     => E,
      F     => F,
      clock => clock,
      Y     => Y);

end TEST;



