library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity christmas_light is
Port (
    sysclk  : in std_logic;
    reset   : in std_logic;
    btn1    : in std_logic;
    btn2    : in std_logic;
    btn3    : in std_logic;
    switches: in std_logic_vector(1 downto 0);
    colors  : out std_logic_vector(5 downto 0);
    led     : out std_logic_vector(3 downto 0)
);
end christmas_light;

architecture Behavioral of christmas_light is
    -- Signal necessary to implement the RGB leds functionality.
    signal colors_buf : std_logic_vector(5 downto 0);
    signal ucolors : unsigned(5 downto 0);
    
begin

    -- Asynchronous assignment to propagate the output buffer. 

    -- Asynchronous assignment to convert the std_logic into an unsigned.
    
    -- Asynchronous assignment that activate the led number 3 when button 3 is pressed.
    
    -- Asynchronous process implementing the switches functionality.
    -- It light up a number of leds equal to the value set through the switches.
    process( switches )
    begin

    end process;
    
    -- Synchronous process implementing the RGB leds functionality.
    -- It continues changing the colors. At each (almost) a second
    -- it add 1 to the colors output port, thus changing the RGB
    -- code of the two RGB leds.
    process( sysclk, reset )
        variable counter : integer;
    begin

    end process;

end Behavioral;
