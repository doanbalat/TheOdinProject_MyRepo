HANGMAN_PICS = [
  "  +---+  \n  |   |  \n      |  \n      |  \n      |  \n      |  \n=========",
  "  +---+  \n  |   |  \n  O   |  \n      |  \n      |  \n      |  \n=========",
  "  +---+  \n  |   |  \n  O   |  \n  |   |  \n      |  \n      |  \n=========",
  "  +---+  \n  |   |  \n  O   |  \n /|   |  \n      |  \n      |  \n=========",
  "  +---+  \n  |   |  \n  O   |  \n /|\\  |  \n      |  \n      |  \n=========",
  "  +---+  \n  |   |  \n  O   |  \n /|\\  |  \n /    |  \n      |  \n=========",
  "  +---+  \n  |   |  \n  O   |  \n /|\\  |  \n / \\  |  \n      |  \n========="
]

file = File.open('D:\\MyCode\\Ruby\\10000EnglishWords.txt')
dictionary = file.readlines.map(&:chomp)

def display_hangman(incorrect_guesses)
  puts HANGMAN_PICS[incorrect_guesses]
  puts
end

def display_word(word, guessed_letters)
  word.each_char do |char|
    guessed_letters.include?(char) ? print(char+' ') : print('_'+' ')
  end
  puts
end

def display_alphabet(alphabet_array, guessed_letters)
  alphabet_array.each do |letter|
    if guessed_letters.include?(letter)
      index = alphabet_array.index(letter)
      alphabet_array[index] = '*'
    end
  end
  puts alphabet_array.join(' ')
end


def main(dictionary)
  word = dictionary.sample.upcase
  alphabet_array = ('A'..'Z').to_a
  guessed_letters = ''
  incorrect_guesses = 0
  while incorrect_guesses < 6 ### HANGMAN_PICS.length
    puts "\e[H\e[2J"
    display_hangman(incorrect_guesses)
    puts "**************************************"
    display_word(word, guessed_letters)
    puts "**************************************"
    display_alphabet(alphabet_array, guessed_letters)
    print "Enter a letter: "
    letter = gets.chomp.upcase
    if !guessed_letters.include?(letter)
      guessed_letters += letter
      if !word.include?(letter)
        incorrect_guesses += 1
      end
    end
  end
end
main(dictionary)
