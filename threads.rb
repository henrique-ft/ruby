p Thread.main

# Threads mudam o estado de acordo com a execução

a = Thread.new { raise "die now" }
b = Thread.new { Thread.stop }
c = Thread.new { Thread.exit }
d = Thread.new { sleep }

p d.kill
p a.status
p b.status
p c.status
p d.status
p Thread.current.status

# As Threads do Ruby não são iguais as de linguagens de baixo nível. Portanto não são tão eficientes.