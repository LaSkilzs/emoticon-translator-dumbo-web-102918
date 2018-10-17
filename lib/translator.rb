require "yaml"
require "pry"

def load_library(file)
  text = YAML.load_file(file)
  
  hash = {"get_emoticon"=>{"english_emoticon"=> {}}, "get_meaning"=>{"japanese_emoticon" => {}}}
  
  text.each do |meaning, array|
    hash["get_emoticon"]["english_emoticon"][array[0]] = array[1]
    hash["get_meaning"]["japanese_emoticon"][array[1]] = meaning
  end

   hash
end

def get_japanese_emoticon(file, emoticon)
  hash = load_library(file)
  if hash["get_emoticon"]["english_emoticon"][emoticon]
    return hash["get_emoticon"]["english_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
  hash = load_library(file)
  
  if hash["get_meaning"]["japanese_emoticon"][emoticon]
    return hash["get_meaning"]["japanese_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end