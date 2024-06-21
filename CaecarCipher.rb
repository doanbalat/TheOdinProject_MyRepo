def caesar_cipher(string, shift)
    print string.chars
    puts
    old_arr = string.chars
    new_arr = string.chars.map do |char|
        if char.ord.between?(97, 122) or char.ord.between?(65, 90)
            char = char.ord + shift
            if char > 122 or (char > 90 and char < 97)
                char = char - 26
            end
            char.chr
        end
    end
    new_arr = new_arr.map.with_index do |char, i|
        char || old_arr[i]
    end
    return new_arr.join
end

print caesar_cipher("What a string!", 5)


