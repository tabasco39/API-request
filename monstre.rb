require 'httparty'
monstres_de_larves = []
monstres_de_caverne =[]
monstres_des_plaines_herbeuses = []

result = HTTParty.get('https://fr.dofus.dofapi.fr/monsters')

larves = result.parsed_response.select { |x| x["type"] == "Larves"}
monstres_de_larves << larves
puts monstres_de_larves

caverne = result.parsed_response.select { |x| x["type"] == "Monstres des cavernes"}
monstres_de_caverne << caverne
puts monstres_de_caverne

plaine = result.parsed_response.select { |x| x["type"] == "Monstres des Plaines herbeuses"}
monstres_des_plaines_herbeuses  << plaine
puts monstres_des_plaines_herbeuses

File.open('larves.json','w') {|f| f.write(monstres_de_larves.to_json)}
File.open('caverne.json','w') {|f| f.write(monstres_de_caverne.to_json)}
File.open('plaine.json','w') {|f| f.write(monstres_des_plaines_herbeuses.to_json)}


    
