require 'pry'

pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}

# Steps
# First, need all of the names
# Setup an initial data structure (create an empty hash for each name)
# For each name, find the associated property values



def nyc_pigeon_organizer(data)
  names = names(data)
  initial_structure = initial_structure(names)
  result = populate(initial_structure, data, names)
end


def names(data) # gets all of the values under gender which are the names into two arrays by gender, flatten into one array of all the names
  data.fetch(:gender).values.flatten
end

def initial_structure(names)
  initial_structure = names.each_with_object({}) do |name, initial_structure|
    initial_structure[name] = {:color => [], :gender => [], :lives => []}
  end
end

def populate (initial_structure, data, names)
  # in our data, look at the pigeons with property value of each property value
  # if the pigeons with property value includes a particular pigeon, add the property value
  # to that pigeons property array
  names.each_with_object(initial_structure) do |name, initial_structure| # names has all the keys of our initial structure
    initial_structure[name][:color] = find_pigeon_property_values(name, :color, data) 
    initial_structure[name][:gender] = find_pigeon_property_values(name, :gender, data)
    initial_structure[name][:lives] = find_pigeon_property_values(name, :lives, data)
  end
end


def find_pigeon_property_values(name, property, data) # want to return an array so use .collect
  data[property].collect do |property_value, pigeons_with_property_value|
    if pigeons_with_property_value.include?(name)
      property_value.to_s
    end
  end.compact # method chaining 
end


#how does it know what the property is











#METHOD FOR CREATING HASH

# def nyc_pigeon_organizer(pigeon_data)
# name_hash = pigeon_names(pigeon_data).collect {|name| {name => {color: [], gender: [], lives: []}}}
# binding.pry
# end

# def pigeon_names(pigeon_data)
#   male_pigeons = pigeon_data[:gender][:male]
#   female_pigeons = pigeon_data[:gender][:female]
#   pigeons = male_pigeons + female_pigeons
# end

# #METHOD FOR POPULATING COLOR

# def color_hash(pigeon_data)
#   # pigeon_data[:color].each do |colors, name|
#   name_hash = pigeon_names(pigeon_data).collect {|name| {name => {color: [], gender: [], lives: []}}}

#   end
# end


#METHOD FOR POPULATING GENDER

#METHOD FOR POPULATING LIVES



### GOOD SECOND TRY BELOW

# def nyc_pigeon_organizer(pigeon_data) # a hash created for each pigeon by name

#   key1 = pigeon_colors(pigeon_data).join(" ").split()
#   key2 = pigeon_gender(pigeon_data).join(" ").split()
#   key3 = pigeon_lives(pigeon_data).join(" ").split()

#   name_hash = pigeon_names(pigeon_data).collect {|name| {name =>{color: [key1], 
#     gender: [key2], lives: [key3]}}}
#   binding.pry
# end

# def pigeon_names(pigeon_data) #this gives us an array of the unique pigeon names
#   male_pigeons = pigeon_data[:gender][:male]
#   female_pigeons = pigeon_data[:gender][:male]
#   pigeons = male_pigeons + female_pigeons
# end

# def pigeon_gender(pigeon_data) #array of the genders
#   pigeon_data[:gender].keys 
# end


# def pigeon_colors(pigeon_data) # array of the colors
#   pigeon_colors = pigeon_data[:color].keys
# end

# def pigeon_lives(pigeon_data) # array of the places pigeons live
#   pigeon_lives = pigeon_data[:lives].keys
# end



# OLD CODE

# # def pigeon_keys(pigeon_data) # array of the pigeon keys (color, gender, lives) <- unnecessary 
# #   pigeon_keys = pigeon_data.keys
# # end

# def nyc_pigeon_organizer(data)
# end

# def nyc_pigeon_organizer(pigeon_data)
#  pigeon_list = {"pigeon" => {color: [], gender: [], lives: []}}
# pigeon_list = {pigeons_names(pigeon_data) => {color: [pigeon_colors(pigeon_data)], 
#    gender: [pigeon_gender(pigeon_data)], lives: [pigeon_lives(pigeon_data)]}}
# end


