
# Você pode passar quantos argumentos quiser, que o método receberá como um array em players

def roster *players
    p players
end

rooster 'Um','Dois','Tres','Quatro'

# Dessa maneira você pode passar um array com chave e valor que irá receber em players_with_positions

def other_roster **players_with_positions
    
    players_with_positions.each do |player, position|
        
        p "Player: #{player}"
        p "Position: #{position}"
        p "\n"
    end
end

roster {
    
    "Henrique" : "Zagueiro",
    "Ronaldo" : "Atacante",
    "José" : "Goleiro"
}
