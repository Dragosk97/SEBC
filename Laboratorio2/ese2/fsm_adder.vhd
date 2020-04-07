
library IEEE;
use IEEE.std_logic_1164.all; --  libreria IEEE con definizione tipi standard logic


entity fsm_adder is
port( 	A,B,C,D,E,F:	in std_logic;
	clock: 	in std_logic;
	reset:	in std_logic;
	Y:	out std_logic
);
end	fsm_adder;

---------------------------------------------

architecture arc_enumtype of fsm_adder is

component datapath_adder 
port( 	MUX00:	in std_logic_vector(15 downto 0);
	MUX01:	in std_logic_vector(15 downto 0);
	MUX02:	in std_logic_vector(15 downto 0);
	MUX03:	in std_logic_vector(15 downto 0);
	MUX10:	in std_logic_vector(15 downto 0);
	MUX11:	in std_logic_vector(15 downto 0);
	MUX12:	in std_logic_vector(15 downto 0);
	MUX13:	in std_logic_vector(15 downto 0);
	clock: 	in std_logic;
	reset:	in std_logic;
	SEL00:	in std_logic;
	SEL01:	in std_logic;
	SEL10:	in std_logic;
	SEL11:	in std_logic;
	SUM:	out std_logic_vector(15 downto 0)
);
end	component;


	-- enumerated type state machine encoding
	TYPE states IS (a_plus_b, plus_c, plus_d, plus_e, plus_f);
	ATTRIBUTE enum_encoding            : string;
	ATTRIBUTE enum_encoding OF states : TYPE IS "000 100 101 111 110 010";
	SIGNAL state_vector                : states;

begin
 	P_OPC : process(CLOCK, RESET)		
	begin
		
		--if reset='1' then
	    --	CURRENT_STATE <= S0;
		if (CLOCK ='1' and CLOCK'EVENT) then 
			CURRENT_STATE <= NEXT_STATE;
		end if;
	end process P_OPC;

	P_NEXT_STATE : process(CURRENT_STATE)
	begin
		case CURRENT_STATE is
			when a_plus_b => 
					NEXT_STATE <= plus_c;
	
			when plus_c => 
					NEXT_STATE <= plus_d;

			when plus_d => 
					NEXT_STATE <= plus_e;
	
			when plus_e => 
					NEXT_STATE <= plus_f;
			
			when plus_f =>
					NEXT_STATE <= a_plus_b;
				
		end case;	
	end process P_NEXT_STATE;

	
	P_OUTPUTS: process(CURRENT_STATE)
	begin
		--Y <= '0';
		case CURRENT_STATE is
				
			when a_plus_b => Y <= '0000';
			when plus_c => Y <= '0101';
			when plus_d => Y <= '0111';
			when plus_e => Y <= '1110';
			when plus_f => Y <= '1010';
	
		end case; 	
	end process P_OUTPUTS;
end FSM_OPC;
 

configuration CFG_FSM_OPC of odd_parity_checker is
	for  FSM_OPC
	end for;
end CFG_FSM_OPC;

