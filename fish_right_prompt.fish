function fish_right_prompt 
  if test "$CMD_DURATION" -gt 1000
    echo $CMD_DURATION | humanize_duration
  end
end
