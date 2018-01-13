name = 'rob'
proc = Proc.new { puts name }
name = 'bob'
proc.call # bob
