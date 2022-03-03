require 'typhoeus'
require_relative 'utility'

class Word
  def self.random(letters = 5)
    # TODO: Add support for words longer or shorter than 3 letters
    [
     "crown", "flaws", "crane", "trips", "money", "query", "water",
     "speed", "phone", "smoke", "robot", "stick", "angry", "grave",
     "right", "wrong", "reign", "cable", "stone", "flint", "steel"
    ].sample.upcase
  end
  def self.exists?(word)
    res = Typhoeus.get("https://api.dictionaryapi.dev/api/v2/entries/en/#{word}", followlocation: true)
    res.response_code == 200
  end
end
