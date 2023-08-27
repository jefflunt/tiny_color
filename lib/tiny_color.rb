# this class extends the String class to add color formatting methods using
# ANSI escape codes.
#
# try these examples:
#   require 'tiny_color'
#
#   "Hello World!".red            # "Hello World!" in red
#   "Hello World!".on_green       # "Hello World!" with green background
#   "Hello World!".bold           # "Hello World!" in bold
#   "Hello World!".underline      # "Hello World!" with underline
#   "Hello World!".red.underline  # "Hello World!" with red color and underline
#
# for support notes, see: https://en.wikipedia.org/wiki/ANSI_escape_code
class String
  COLORS = {
    black:          30,
    gray:           90, # convenient alias for light_black
    grey:           90, # convenient alias for light_black
    red:            31,
    green:          32,
    yellow:         33,
    blue:           34,
    purple:         35,
    cyan:           36,
    white:          37,
    light_black:    90,
    light_red:      91,
    light_green:    92,
    light_yellow:   93,
    light_blue:     94,
    light_purple:   95,
    light_cyan:     96,
    light_white:    97
  }

  # see: https://en.wikipedia.org/wiki/ANSI_escape_code
  # not all of these modes may be supported by your terminal
  #
  # some terminal emulators require that you enable certain features, such as
  # blinking text
  MODES = {
    normal:           0,
    bold:             1,
    dim:              2,
    italic:           3,
    underline:        4,
    blink:            5,
    blink_slow:       5,
    blink_fast:       6,
    invert:           7,
    hide:             8,
    strike:           9,
    double_underline: 20,
    reveal:           28,
    overlined:        53
  }

  COLORS.each do |color, value|
    define_method color do
      "\033[#{value}m#{self}\033[0m"
    end

    define_method "on_#{color}" do
      "\033[#{value + 10}m#{self}\033[0m"
    end
  end

  def default
    "\033[39m#{self}\033[0m"
  end

  def on_default
    "\033[49m#{self}\033[0m"
  end

  MODES.each do |mode, value|
    define_method mode do
      "\033[#{value}m#{self}\033[0m"
    end
  end
end

