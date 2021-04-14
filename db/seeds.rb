require 'csv'

csv_text = File.read(Rails.root.join("lib", "seeds", "pokemon.csv"))
csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
csv.each do |row|
  t = Pokemon.new
  t.name = row["Name"]
  t.type_1 = row["Type 1"]
  t.type_2 = row["Type 2"]
  t.total = row["Total"]
  t.hp = row["HP"]
  t.attack = row["Attack"]
  t.defense = row["Defense"]
  t.special_attack = row["Sp. Atk"]
  t.special_defense = row["Sp. Def"]
  t.speed = row["Speed"]
  t.generation = row["Generation"]
  t.legendary = row["Legendary"].downcase

  t.save
end
