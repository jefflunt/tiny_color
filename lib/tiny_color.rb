# this code extends the String class, adding ANSI color codes for modifying the
# text.
#
# usage:
#   puts 'Hi'.green + ' there!'
#
#   "Hi there!"                             # where 'Hi' will appear in green,
#                                           # and the rest in your # default
#                                           # terminal color
#
# you can also add background colors:
#   puts 'Hi'.black.on_yellow + ' there!'
#
#   "Hi there!"                             # where 'Hi' will appear in black
#                                           # with a yellow background, and the
#                                           # rest in your default terminal
#                                           # color
class String
  COLORS = {
    black:          30,
    light_black:    90,

    red:            31,
    light_red:      91,

    green:          32,
    light_green:    92,

    yellow:         33,
    light_yellow:   93,

    blue:           34,
    light_blue:     94,

    purple:         35,
    light_purple:   95,

    cyan:           36,
    light_cyan:     96,

    white:          37,
    light_white:    97
  }

  COLORS.each do |color, value|
    define_method color do
      "\033[#{value}m#{self}\033[0m"
    end

    define_method "on_#{color}" do
      "\033[#{value + 10}m#{self}\033[0m"
    end
  end
end

