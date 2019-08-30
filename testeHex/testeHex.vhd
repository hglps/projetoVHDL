library ieee;
use ieee.std_logic_1164.all;
use work.convert.all;
use ieee.numeric_std.all;

entity testeHex is
  port (
	 clr : in std_logic;
    i_Clk: in  std_logic;
	 hex0 : out std_logic_vector(6 downto 0) := "1000000";
	 hex1 : out std_logic_vector(6 downto 0) := (others => '1');
	 hex2 : out std_logic_vector(6 downto 0) := (others => '1');
	 hex3 : out std_logic_vector(6 downto 0) := (others => '1')
    );
	 
end entity testeHex;

library ieee;
use ieee.std_logic_1164.all;
use work.convert.all;
use ieee.numeric_std.all;

package convert is	
	function convertToHex(num : integer) return std_logic_vector; 
end convert;

package body convert is
--use convert;
FUNCTION convertToHex( num : integer) RETURN std_logic_vector is
  variable result: std_logic_vector(6 downto 0);
  
  begin
  case num is
		  when -1 =>
		    result := "1111111";
        when 0 =>
          result := "0000001";
        when 1 =>
          result := "1001111";
        when 2 =>
          result := "0010010";
        when 3 =>
          result := "0000110";
        when 4 =>
          result := "1001100";          
        when 5 =>
          result := "0100100";
        when 6 =>
          result := "0100000";
        when 7 =>
          result := "0001111";
        when 8 =>
          result := "0000000";
        when 9 =>
          result := "0000100";
        when 10 =>
          result := "0001000";
        when 11 =>
          result := "1100000";
        when 12 =>
          result := "0110001";
        when 13 =>
          result := "1000010";
        when 14 =>
          result := "0110000";
        when 15 =>
          result := "0111000";
		  when others => result := (others => '1');
      end case;
	return result;
end convertToHex;

end convert;

 
architecture RTL of testeHex is
 
  signal counter0 : integer range -1 to 15 := -1;  -- counter do primeiro display
  signal counter1 : integer range -1 to 15 := -1; -- vc ja entendeu ...
  signal counter2 : integer range -1 to 15 := -1;
  signal counter3 : integer range -1 to 15 := -1;
  
	begin
	
	hex0 <= convertToHex(counter0);
	hex1 <= convertToHex(counter1);
	hex2 <= convertToHex(counter2);
	hex3 <= convertToHex(counter3);
	
	process(i_Clk, clr) is
	begin
		if (clr = '0') then
			counter0 <= - 1;
			counter1 <= - 1;
			counter2 <= - 1;
			counter3 <= - 1;

		elsif (rising_edge(i_Clk)) then
			counter0 <= counter0 + 1;
			if(counter0 = 15) then
				counter0 <= 0;
				if(counter1 = -1) then 
					counter1 <= counter1 + 2;
				else
					counter1 <= counter1 + 1;
				end if;
				if(counter1 = 15) then
					counter1 <= 0;
					if(counter2 = -1) then 
						counter2 <= counter2 + 2;
					else
						counter2 <= counter2 + 1;
					end if;
					if(counter2 = 15) then
						counter2 <= 0;
						if(counter1 = -1) then 
							counter1 <= counter1 + 2;
						else
							counter1 <= counter1 + 1;
						end if;
						if(counter3 = 15) then
							counter0 <= -1;
							counter1 <= -1;
							counter2 <= -1;
							counter3 <= -1;
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;
	

	

	
	
	
	
  --process (i_Clk) is
  --begin
	 --if rising_edge(i_Clk) then
		--variable counter;
		
    --end if;
  --end process;
  
  -- r_Hex_Encoding(7) is unused
  --zero_Segment_A <= r0_Hex_Encoding(6);
  --zero_Segment_B <= r0_Hex_Encoding(5);
  --zero_Segment_C <= r0_Hex_Encoding(4);
  --zero_Segment_D <= r0_Hex_Encoding(3);
  --zero_Segment_E <= r0_Hex_Encoding(2);
  --zero_Segment_F <= r0_Hex_Encoding(1);
  --zero_Segment_G <= r0_Hex_Encoding(0);
 
end architecture RTL;