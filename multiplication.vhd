----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    20:51:44 04/28/2019
-- Design Name:
-- Module Name:    multiplication - Behavioral
-- Project Name:
-- Target Devices:
-- Tool versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplication is
    Port ( a,b : in  STD_LOGIC_VECTOR (3 downto 0);
           product : out  STD_LOGIC_VECTOR (7 downto 0);
              u0o : out  STD_LOGIC_VECTOR (7 downto 0);
              u1o : out  STD_LOGIC_VECTOR (7 downto 0);
              u2o : out  STD_LOGIC_VECTOR (7 downto 0);
              u3o : out  STD_LOGIC_VECTOR (7 downto 0)
              );
end multiplication;

architecture Behavioral of multiplication is
   --sygnaly wynikające z mnozenia
    signal u0: STD_LOGIC_VECTOR (7 downto 0) := "00000000";    
    signal u1: STD_LOGIC_VECTOR (7 downto 0) := "00000000";    
    signal u2: STD_LOGIC_VECTOR (7 downto 0) := "00000000";    
    signal u3: STD_LOGIC_VECTOR (7 downto 0) := "00000000";    
   
    -- sygnaly pomocnicze przy dodawaniu   
    signal sum1: STD_LOGIC_VECTOR (7 downto 0) := "00000000";      --u0+u1
    signal sum2: STD_LOGIC_VECTOR (7 downto 0) := "00000000";     --u2+sum1
   
    --sygnaly przeniesienia bitu z dodawania
    signal cc1: STD_LOGIC_VECTOR (7 downto 0) := "00000000";    
    signal cc2: STD_LOGIC_VECTOR (7 downto 0):= "00000000";    
    signal cc3: STD_LOGIC_VECTOR (7 downto 0) := "00000000";    
   
    --trzeba dodać pomocnicze sygnały do siebie
        component sum1bitHalfAdder is
            Port ( a,b : in  STD_LOGIC;
           sumHA : out  STD_LOGIC;
           carry : out  STD_LOGIC);
        end component;
       
        component sum1bitFullAdder is
            Port (a, b, cin : in  STD_LOGIC;
            sumFA, carry: out  STD_LOGIC);
        end component;

begin
    --mnozenie
    u0 <= "0000" & a when b(0) = '1' else "00000000";             --a*b(0)
    u1 <= "000" & a & "0" when b(1) = '1' else "00000000";    --a*b(1)
    u2 <= "00" & a & "00" when b(2) = '1' else "00000000";    --a*b(2)
    u3 <= "0" & a & "000" when b(3) = '1' else "00000000";    --a*b(3)
   
    u0o<=u0;
    u1o<=u1;
    u2o<=u2;
    u3o<=u3;
    --sumowanie u0+u1
    s0: sum1bitHalfAdder
            port map (a => u0(0),
                                  b => u1(0),
                                  sumHA => sum1(0),
                                  carry => cc1(0)
                                  );
        s1: sum1bitFullAdder
            port map (a => u0(1),
                                  b => u1(1),
                                  cin => cc1(0),
                                  sumFA => sum1(1),
                                  carry => cc1(1)
                                  );
        s2: sum1bitFullAdder
            port map (a => u0(2),
                                  b => u1(2),
                                  cin => cc1(1),
                                  sumFA => sum1(2),
                                  carry => cc1(2)
                                  ); 
        s3: sum1bitFullAdder
            port map (a => u0(3),
                                  b => u1(3),
                                  cin => cc1(2),
                                  sumFA => sum1(3),
                                  carry => cc1(3)
                                  );
        s4: sum1bitFullAdder
            port map (a => u0(4),
                                  b => u1(4),
                                  cin => cc1(3),
                                  sumFA => sum1(4),
                                  carry => cc1(4)
                                  );
        s5: sum1bitFullAdder
            port map (a => u0(5),
                                  b => u1(5),
                                  cin => cc1(4),
                                  sumFA => sum1(5),
                                  carry => cc1(5)
                                  );
        s6: sum1bitFullAdder
            port map (a => u0(6),
                                  b => u1(6),
                                  cin => cc1(5),
                                  sumFA => sum1(5),
                                  carry => cc1(6)
                                  );
        s7: sum1bitFullAdder
            port map (a => u0(7),
                                  b => u1(7),
                                  cin => cc1(6),
                                  sumFA => sum1(6)
                                  );
                                 
-- dodawanie sum1 + u2       
        t0: sum1bitHalfAdder
            port map (a => sum1(0),
                                  b => u2(0),
                                  sumHA => sum2(0),
                                  carry => cc2(0)
                                  );
        t1: sum1bitFullAdder
            port map (a => sum1(1),
                                  b => u2(1),
                                  cin => cc2(0),
                                  sumFA => sum2(1),
                                  carry => cc2(1)
                                  );
        t2: sum1bitFullAdder
            port map (a => sum1(2),
                                  b => u2(2),
                                  cin => cc2(1),
                                  sumFA => sum2(2),
                                  carry => cc2(2)
                                  ); 
        t3: sum1bitFullAdder
            port map (a => sum1(3),
                                  b => u2(3),
                                  cin => cc2(2),
                                  sumFA => sum2(3),
                                  carry => cc2(3)
                                  );
        t4: sum1bitFullAdder
            port map (a => sum1(4),
                                  b => u2(4),
                                  cin => cc2(3),
                                  sumFA => sum2(4),
                                  carry => cc2(4)
                                  );
        t5: sum1bitFullAdder
            port map (a => sum1(5),
                                  b => u2(5),
                                  cin => cc2(4),
                                  sumFA => sum2(5),
                                  carry => cc2(5)
                                  );
        t6: sum1bitFullAdder
            port map (a => sum1(6),
                                  b => u2(6),
                                  cin => cc2(5),
                                  sumFA => sum2(6),
                                  carry => cc2(6)
                                  );
                                   
        t7: sum1bitFullAdder
            port map (a => sum1(7),
                                  b => u2(7),
                                  cin => cc2(6),
                                  sumFA => sum2(7)
                                  );
                                 
    -- sumowanie sum2 + u3   
        w0: sum1bitHalfAdder
            port map (a => sum2(0),
                                  b => u3(0),
                                  sumHA => product(0),
                                  carry => cc3(0)
                                  );
        w1: sum1bitFullAdder
            port map (a => sum2(1),
                                  b => u3(1),
                                  cin => cc3(0),
                                  sumFA => product(1),
                                  carry => cc1(1)
                                  );
        w2: sum1bitFullAdder
            port map (a => sum2(2),
                                  b => u3(2),
                                  cin => cc3(1),
                                  sumFA => product(2),
                                  carry => cc3(2)
                                  ); 
        w3: sum1bitFullAdder
            port map (a => sum2(3),
                                  b => u3(3),
                                  cin => cc3(2),
                                  sumFA => product(3),
                                  carry => cc3(3)
                                  );
        w4: sum1bitFullAdder
            port map (a => sum2(4),
                                  b => u3(4),
                                  cin => cc3(3),
                                  sumFA => product(4),
                                  carry => cc3(4)
                                  );
        w5: sum1bitFullAdder
            port map (a => sum2(5),
                                  b => u3(5),
                                  cin => cc3(4),
                                  sumFA => product(5),
                                  carry => cc3(5)
                                  );
        w6: sum1bitFullAdder
            port map (a => sum2(6),
                                  b => u3(6),
                                  cin => cc3(5),
                                  sumFA => product(6),
                                  carry => cc3(6)
                                  );   
        w7: sum1bitFullAdder
            port map (a => sum2(7),
                                  b => u3(7),
                                  cin => cc3(6),
                                  sumFA => product(7)
                                  );                             
                                 
end Behavioral;