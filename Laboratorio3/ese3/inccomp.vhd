library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity inccomp is
Port(	C: out std_logic_vector(7 downto 0);
	ck: in std_logic;
	rst: in std_logic;
	INCA: in std_logic;
	INCB: in std_logic;
	INCC: in std_logic);
end inccomp;

architecture behavioral of inccomp is

signal syncha, synchb, synchc : std_logic_vector(7 downto 0);

begin

	p1: process(ck,rst)
	variable tmpa, tmpb, tmpc : std_logic_vector(7 downto 0);
	begin
	  if rst='1' then
	  	syncha <= (others => '0');
			synchb <= (others => '0');
			synchc <= (others => '0');
			C <= (others => '0');
	  elsif ck'event and ck='1' then
	  	tmpa:= syncha;
			tmpb:= synchb;
			tmpc:= synchc;
	  	if INCA='1' then
				syncha <= syncha+1;
				tmpa:= tmpa+1;
			end if;
			if INCB='1' then
				synchb <= synchb+1;
				tmpb:= tmpb+1;
			end if;
			if INCC='1' then
				synchc <= synchc+1;
				tmpc:= tmpc+1;
			end if;
			if ((tmpa)>(tmpb) AND (tmpa)>(tmpc)) then
				C <= tmpa;
			elsif ((tmpb)>(tmpa) AND (tmpb)>(tmpc)) then
				C <= tmpb;
			elsif ((tmpc)>(tmpa) AND (tmpc)>(tmpb)) then
				C <= tmpc;
			end if;
	  end if;
	end process;
end behavioral;
