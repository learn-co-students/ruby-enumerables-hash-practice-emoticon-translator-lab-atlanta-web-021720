# require modules here
require 'yaml'

def load_library(emote)
  # code goes here
  emoticons = YAML.load_file(emote)

  new_hash = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }

  emoticons.each do |key, value|
    new_hash['get_emoticon'][value[0]] = emoticons[key][1]
    new_hash['get_meaning'][value[1]] = key

  end
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  emote = load_library(file_path)

  emote.each do |key, value|
    value.each do |val|

      if emoticon === val[0]
         return val[1]
      end
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  emote = load_library(file_path)

  emote.each do |key, value|
    value.each do |val|

      if emoticon === val[0]
        return val[1]
      end
    end
  end
  "Sorry, that emoticon was not found"
end
