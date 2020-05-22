library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.all;

entity busT0 is
  port (ck  : in  std_logic;
        rst : in  std_logic;
        A   : in  std_logic_vector(7 downto 0);
        B   : out std_logic_vector(8 downto 0);
        C   : out std_logic_vector(7 downto 0));
end busT0;

architecture behavioral of busT0 is

  signal buss     : std_logic_vector(7 downto 0);
  signal inc      : std_logic;
  signal old_inc  : std_logic;
  signal old_a    : std_logic_vector(7 downto 0);
  signal buffer_a : std_logic_vector(7 downto 0);
begin

  inc_proc : process (ck, rst) is
  begin  -- process inc_proc
    if rst = '0' then                   -- asynchronous reset (active low)
      inc <= 0;
    elsif ck'event and ck = '1' then    -- rising clock edge
      old_A   <= A;
      old_inc <= inc;
      if old_A+1 xor A = "00000000" then
        inc = 1;
      else
        inc = 0;
      end if;
    end process inc_proc;

      pck : process(ck, rst)
      begin
        if rst = '1' then
          buss <= (others => '0');
        --B <= (others => '0');
        elsif ck'event and ck = '1' then
          if inc = '0' then
            buss <= A & inc;
          end if;
          if inc = '1' then
            if old_inc = '0' then
              a_buffer <= A;
            end if;
            buss <= a_buffer & inc;
          end if;
        end if;
      end process;


      B <= buss;

      pout : process(ck, rst)
      begin
        if rst = '1' then
          C <= (others => '0');
        elsif ck'event and ck = '1' then
          if inc = '1' then
            C <= C+1;
          else
            C <= buss;
          end if;
        end if;
        
      end process;

    end behavioral;

