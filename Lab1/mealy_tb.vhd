----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2019 12:22:37 PM
-- Design Name: 
-- Module Name: mealy_tb - Behavioral
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

entity mealy_tb is
--  Port ( );
end mealy_tb;

architecture Behavioral of mealy_tb is

COMPONENT mealy PORT(

           rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           button : in STD_LOGIC;
         --  stateout : out STD_LOGIC_VECTOR (1 downto 0);
           zOut : out STD_LOGIC );
end component;    


signal rst : STD_LOGIC := '0';
signal clk: std_logic:= '1';
signal button : std_logic:= '0';
signal zout : std_logic:= '0';
--signal stateOut: std_logic_Vector (1 downto 0):= "00";

begin

     uut: mealy port map(rst => rst, 
                        clk => clk, 
                        button => button, 
                     --   stateout => stateout, 
                        zout => zout); --mapping my testbench to my design source

    clock_process : process is
        Begin
        clk <= NOT(clk);
         wait for 20 ns;
    End Process;
    
   
        
    test2: button <= 
        '0' ,    --button state isnt pressed
        '1'  after 10ns, -- after 10 ns button is pressed  
        '0' after 40ns, ---- stop pressing button
        '1' after 10ns,
        '0' after 60ns; 
         


end Behavioral;
