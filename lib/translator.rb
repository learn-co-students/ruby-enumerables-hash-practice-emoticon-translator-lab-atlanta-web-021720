require "yaml"

def load_library(file_path)
  yaml_list = YAML.load_file(file_path)
  meaning_list = {:get_meaning => {}, :get_emoticon => {}}
  
  yaml_list.each { |meaning, emoticons|
  meaning_list[:get_meaning][emoticons[1]] = meaning
  meaning_list[:get_emoticon][emoticons[0]] = emoticons[1]
  }
  meaning_list
end

def get_japanese_emoticon(file_path, emoticon)
  meaning_list = load_library(file_path)
  if meaning_list[:get_emoticon][emoticon]
    answer = meaning_list[:get_emoticon][emoticon]
  else
    answer = "Sorry, that emoticon was not found"
  end
  answer
end

def get_english_meaning(file_path, emoticon)
  meaning_list = load_library(file_path)
  if meaning_list[:get_meaning][emoticon]
    answer = meaning_list[:get_meaning][emoticon]
  else
    answer ="Sorry, that emoticon was not found"
  end
  answer
end