library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity tbinccomp is
end tbinccomp;

architecture test of tbinccomp is

signal ck: std_logic:='0';
signal rst: std_logic;
signal INCA, INCB, INCC: std_logic;
signal C: std_logic_vector(7 downto 0);

component inccomp
Port(	C: out std_logic_vector(7 downto 0);
	ck: in std_logic;
	rst: in std_logic;
	INCA: in std_logic;
	INCB: in std_logic;
	INCC: in std_logic);
end component;

begin
	process(ck)
	begin
	  ck <= not(ck) after 2.5 ns;
	end process;
	
	rst <= '0', '1' after 0.1 ns, '0' after 0.2 ns;
	
	INCA <= '0', '1' after 2.2 ns, '0' after 10.2 ns;
	INCB <= '0', '1' after 5.2 ns;
	INCC <= '0', '1' after 3.2 ns, '0' after 8.2 ns;
	
	UINCCOMP: inccomp
	Port Map(C,ck,rst,INCA,INCB,INCC);	

end test;

