
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_adder is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_adder;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_adder.all;

entity adder is

   port( A, B, C, D, E, F : in std_logic_vector (15 downto 0);  clock : in 
         std_logic;  Y : out std_logic_vector (15 downto 0));

end adder;

architecture SYN_str of adder is

   component fsm_adder
      port( clock : in std_logic;  sel1, sel2 : out std_logic_vector (1 downto 
            0));
   end component;
   
   component datapath_adder
      port( MUX00, MUX01, MUX02, MUX03, MUX10, MUX11, MUX12, MUX13 : in 
            std_logic_vector (15 downto 0);  clock, reset, SEL00, SEL01, SEL10,
            SEL11 : in std_logic;  SUM : out std_logic_vector (15 downto 0));
   end component;
   
   signal X_Logic0_port, Y_15_port, Y_14_port, Y_13_port, Y_12_port, Y_11_port,
      Y_10_port, Y_9_port, Y_8_port, Y_7_port, Y_6_port, Y_5_port, Y_4_port, 
      Y_3_port, Y_2_port, Y_1_port, Y_0_port, sig_sel1_1_port, sig_sel1_0_port,
      sig_sel2_1_port, sig_sel2_0_port : std_logic;

begin
   Y <= ( Y_15_port, Y_14_port, Y_13_port, Y_12_port, Y_11_port, Y_10_port, 
      Y_9_port, Y_8_port, Y_7_port, Y_6_port, Y_5_port, Y_4_port, Y_3_port, 
      Y_2_port, Y_1_port, Y_0_port );
   
   X_Logic0_port <= '0';
   ADDER : datapath_adder port map( MUX00(15) => A(15), MUX00(14) => A(14), 
                           MUX00(13) => A(13), MUX00(12) => A(12), MUX00(11) =>
                           A(11), MUX00(10) => A(10), MUX00(9) => A(9), 
                           MUX00(8) => A(8), MUX00(7) => A(7), MUX00(6) => A(6)
                           , MUX00(5) => A(5), MUX00(4) => A(4), MUX00(3) => 
                           A(3), MUX00(2) => A(2), MUX00(1) => A(1), MUX00(0) 
                           => A(0), MUX01(15) => Y_15_port, MUX01(14) => 
                           Y_14_port, MUX01(13) => Y_13_port, MUX01(12) => 
                           Y_12_port, MUX01(11) => Y_11_port, MUX01(10) => 
                           Y_10_port, MUX01(9) => Y_9_port, MUX01(8) => 
                           Y_8_port, MUX01(7) => Y_7_port, MUX01(6) => Y_6_port
                           , MUX01(5) => Y_5_port, MUX01(4) => Y_4_port, 
                           MUX01(3) => Y_3_port, MUX01(2) => Y_2_port, MUX01(1)
                           => Y_1_port, MUX01(0) => Y_0_port, MUX02(15) => 
                           F(15), MUX02(14) => F(14), MUX02(13) => F(13), 
                           MUX02(12) => F(12), MUX02(11) => F(11), MUX02(10) =>
                           F(10), MUX02(9) => F(9), MUX02(8) => F(8), MUX02(7) 
                           => F(7), MUX02(6) => F(6), MUX02(5) => F(5), 
                           MUX02(4) => F(4), MUX02(3) => F(3), MUX02(2) => F(2)
                           , MUX02(1) => F(1), MUX02(0) => F(0), MUX03(15) => 
                           E(15), MUX03(14) => E(14), MUX03(13) => E(13), 
                           MUX03(12) => E(12), MUX03(11) => E(11), MUX03(10) =>
                           E(10), MUX03(9) => E(9), MUX03(8) => E(8), MUX03(7) 
                           => E(7), MUX03(6) => E(6), MUX03(5) => E(5), 
                           MUX03(4) => E(4), MUX03(3) => E(3), MUX03(2) => E(2)
                           , MUX03(1) => E(1), MUX03(0) => E(0), MUX10(15) => 
                           B(15), MUX10(14) => B(14), MUX10(13) => B(13), 
                           MUX10(12) => B(12), MUX10(11) => B(11), MUX10(10) =>
                           B(10), MUX10(9) => B(9), MUX10(8) => B(8), MUX10(7) 
                           => B(7), MUX10(6) => B(6), MUX10(5) => B(5), 
                           MUX10(4) => B(4), MUX10(3) => B(3), MUX10(2) => B(2)
                           , MUX10(1) => B(1), MUX10(0) => B(0), MUX11(15) => 
                           C(15), MUX11(14) => C(14), MUX11(13) => C(13), 
                           MUX11(12) => C(12), MUX11(11) => C(11), MUX11(10) =>
                           C(10), MUX11(9) => C(9), MUX11(8) => C(8), MUX11(7) 
                           => C(7), MUX11(6) => C(6), MUX11(5) => C(5), 
                           MUX11(4) => C(4), MUX11(3) => C(3), MUX11(2) => C(2)
                           , MUX11(1) => C(1), MUX11(0) => C(0), MUX12(15) => 
                           Y_15_port, MUX12(14) => Y_14_port, MUX12(13) => 
                           Y_13_port, MUX12(12) => Y_12_port, MUX12(11) => 
                           Y_11_port, MUX12(10) => Y_10_port, MUX12(9) => 
                           Y_9_port, MUX12(8) => Y_8_port, MUX12(7) => Y_7_port
                           , MUX12(6) => Y_6_port, MUX12(5) => Y_5_port, 
                           MUX12(4) => Y_4_port, MUX12(3) => Y_3_port, MUX12(2)
                           => Y_2_port, MUX12(1) => Y_1_port, MUX12(0) => 
                           Y_0_port, MUX13(15) => D(15), MUX13(14) => D(14), 
                           MUX13(13) => D(13), MUX13(12) => D(12), MUX13(11) =>
                           D(11), MUX13(10) => D(10), MUX13(9) => D(9), 
                           MUX13(8) => D(8), MUX13(7) => D(7), MUX13(6) => D(6)
                           , MUX13(5) => D(5), MUX13(4) => D(4), MUX13(3) => 
                           D(3), MUX13(2) => D(2), MUX13(1) => D(1), MUX13(0) 
                           => D(0), clock => clock, reset => X_Logic0_port, 
                           SEL00 => sig_sel1_0_port, SEL01 => sig_sel1_1_port, 
                           SEL10 => sig_sel2_0_port, SEL11 => sig_sel2_1_port, 
                           SUM(15) => Y_15_port, SUM(14) => Y_14_port, SUM(13) 
                           => Y_13_port, SUM(12) => Y_12_port, SUM(11) => 
                           Y_11_port, SUM(10) => Y_10_port, SUM(9) => Y_9_port,
                           SUM(8) => Y_8_port, SUM(7) => Y_7_port, SUM(6) => 
                           Y_6_port, SUM(5) => Y_5_port, SUM(4) => Y_4_port, 
                           SUM(3) => Y_3_port, SUM(2) => Y_2_port, SUM(1) => 
                           Y_1_port, SUM(0) => Y_0_port);
   FSM_ADD : fsm_adder port map( clock => clock, sel1(1) => sig_sel1_1_port, 
                           sel1(0) => sig_sel1_0_port, sel2(1) => 
                           sig_sel2_1_port, sel2(0) => sig_sel2_0_port);

end SYN_str;
