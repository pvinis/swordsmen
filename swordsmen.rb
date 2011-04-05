# swordsmen

$result = ""

def clear_screen
  print `clear`
end


def leave_empty_lines(n)
  $result += "\n"*n
end

$insults = ["you suck", "fuck you", "yo mama"]

def print_insult(prev)
  prev = rand($insults.length) if prev == -1
  $result += $insults[prev]+"\n"
  prev
end

def print_bubble(lr)
  case lr%2
  when 0
    $result += "  /\n"
  when 1
    $result += "   \\\n"
  end
end

$pwaist = 0
$waist = 1
$legs = 0

def print_men
  $result += "~o  o~\n"

  
  if $pwaist == 0 and $waist == 1
    $pwaist = 1
    $waist = 2
  elsif $pwaist == 1 and $waist == 2
    $pwaist = 2
    $waist = 1
  elsif $pwaist == 2 and $waist == 1
    $pwaist = 1
    $waist = 0
  elsif $pwaist == 1 and $waist == 0
    $pwaist = 0
    $waist = 1
  end
  
  $result += case $waist
  when 0
    "<|/\\|>\n"
  when 1
    "<|--|>\n"
  when 2
    "<|\\/|>\n"
  end
  
  $legs += 1
  $legs = 0 if $legs == 2
  
  $result += case $legs
  when 0
    "/ \\/ \\"
  when 1
    " |\\ |\\"
  end
end




def print_scene(n)
  i = 0
  prev = -1
  b = 1
  offset = 0
  inc = 1

  n.times do
    i += 1
    i = 0 if i > 6
    prev = -1 if i == 0
    if prev == -1
      if b == 1
        b = 2
      else
        b = 1
      end
    end

    offset += inc
    inc = -1 if offset == 13
    inc = 1 if offset == 0
    
    clear_screen
    leave_empty_lines 10
    prev = print_insult prev
    print_bubble b
    print_men
    puts move($result, offset)
    $result = ""
    sleep 0.1
    
  end
end



def move(str, offset)
  result = ""
  str.each_line do |line|
    result += (" "*offset)+line
  end
  result
end

def main
  print_scene 300
end


main