----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2019 11:42:46 PM
-- Design Name: 
-- Module Name: moore - Behavioral
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

entity moore is
Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           button : in STD_LOGIC;
           zout : out STD_LOGIC);
end moore;

architecture Behavioral of moore is

TYPE state IS (state0, state1, state2); --defines the state type
SIGNAL current_state, next_state : state :=state0; --signal that uses the different states
Type color is(red, black, green);
--signal current : color:=green;

begin
  PROCESS(clk, reset) 
begin
        
    if(reset = '1') then
    current_state <= state0;
    
    elsif rising_edge(clk) then    
        
    case current_state is
    
    when state0 => 
    if(button = '1') then
        next_state <= state1; zout <= '1';  
    end if;
    
    when state1 => 
    if(button = '1') then
        next_state <= state2; zout <= '1';
    end if;
    
    when state2 =>
    if(button = '1') then
        next_state <= state0; zout <= '0';
    end if;
    end case;
    
    end if;
    
 end PROCESS combin_proc;
 

end Behavioral;
