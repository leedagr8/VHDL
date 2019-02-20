----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2019 10:42:19 PM
-- Design Name: 
-- Module Name: mealy - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mealy is
Port ( rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           button : in STD_LOGIC;
           stateNUM : out STD_LOGIC_VECTOR (1 downto 0);
           zOut : out STD_LOGIC );
end mealy;

architecture Behavioral of mealy is
TYPE state IS(state0, state1, state2);
SIGNAL current_state, next_state : state :=state0;
begin
Combat_proc : PROCESS(current_state, button)
begin
    CASE current_state IS
    
    when state0 => stateNUM <="00";
        if(button = '1') then
                next_state <= state1; zout <= '1';
        else
                next_state <= state0; zout <= '0';
        end if;
        
     when state1 => stateNUM <= "01";
        if(button = '1') then
            next_state <= state2; zout <= '1';
        else
            next_state <= state1; zout <= '1';
         end if;
         
      when state2 => stateNUM <= "10";
        if(button = '1') then
            next_state <= state0; zout <= '0';
        else
            next_state <= state2; zout <= '1';
        end if;     
        end case;
     end process Combat_proc;               
      clk_proc: process
        begin
            wait until(clk'event and clk ='1');
            if(rst = '1') then
                current_state <= state0;
            else
                current_state <= next_state;
             end if;
        end process clk_proc;


end Behavioral;



