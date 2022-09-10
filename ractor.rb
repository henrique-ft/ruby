# Ractor is a nice way to implement some paralell task
def log_info(info)
  Ractor.new { p Ractor.receive }.send(info)
end

# This will execute in paralel and prints in random order
log_info("ractor")
log_info("is")
log_info("nice")

p "end"

# We can use the select function to wait each ractor
def log_info_2(info)
  r = Ractor.new { p Ractor.receive }.send(info)

  Ractor.select(r)
end

# This print the messages in order
log_info_2("one")
log_info_2("two")
log_info_2("three")
