GREEN = "\033[;32m"
YELLOW = "\033[;33m"
RESET = "\033[0m"

def clear_screen
  print "\033[2J"
end
  
def clear_line_above
  print "\033[1A\033[K"
end
