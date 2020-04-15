
library IEEE;
use IEEE.std_logic_1164.all;  --  libreria IEEE con definizione tipi standard logic


entity fsm_adder is
  port(clock       : in std_logic;
        sel1, sel2 :    std_logic_vector(1 downto 0)
        );
end fsm_adder;

---------------------------------------------

architecture arc_enumtype of fsm_adder is




  -- enumerated type state machine encoding
  type states is (a_plus_b, plus_c, plus_d, plus_e, plus_f);
  attribute enum_encoding           : string;
  attribute enum_encoding of states : type is "000 010 011 110 100";
  signal CURRENT_STATE, NEXT_STATE  : states;

begin
  P_OPC : process(CLOCK, RESET)
  begin
    if (CLOCK = '1' and CLOCK'EVENT) then
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


  P_OUTPUTS : process(CURRENT_STATE)
  begin
    --Y <= '0';
    case CURRENT_STATE is
      
      when a_plus_b =>
        sel1 <= '00';
        sel2 <= '00';
      when plus_c =>
        sel1 <= '01';
        sel2 <= '01';
      when plus_d =>
        sel1 <= '01';
        sel2 <= '11';
      when plus_e =>
        sel1 <= '11';
        sel2 <= '10';
      when plus_f =>
        sel1 <= '10';
        sel2 <= '10';
        
    end case;
  end process P_OUTPUTS;
end FSM_OPC;




end arc_enumtype;

