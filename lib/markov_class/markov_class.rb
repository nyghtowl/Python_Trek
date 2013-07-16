
'''
Make Markov Chain 

Create upper and lower hashes to hold markov chains based on submitted text file.
Generate random text for tweets.

'''
 
class Markov
    END_MARKS = [".", "?", "!"]
    CAPS = "A".."Z"

    def initialize(str)
        '''
        Takes in a string and returns dict of markov chains.
        '''
        #create hash with word pairings
        @lower = Hash.new { |hash, key| hash[key] = [] } #lower case keys
        @cap = Hash.new { |hash, key| hash[key] = [] } #upper case keys

        #clean string of characters and change to list
        word_array = remove_punctuation(str).split
        #loop through string and generate word dict
        word_array.each_with_index do |head, num|
            next if num > word_array.length - 1

            head = collapse_heads(head)
            tail = word_array[num+1]

            #assign key value pair to either lower or cap hash
            hash = if is_cap(head)
                @cap
            else                
                @lower
            end

            hash[head] << tail
        end
    end

    def generate()
        message = []
        head = @cap.keys.sample
        message << head
        while !done?(message) do
            source = pick_source(head)
            choice = source[head].sample # need to strip end mark on key for cap to pull value

            if choice.nil?
                choice = pick_source(head).keys.sample
            end

            message << choice
            head = choice
        end
       
        message = message.join(" ") + END_MARKS.sample

        if message.length > 140
            message = message[0...139] + END_MARKS.sample
        else
            message
        end

    end

    def done?(message)
        raise NotImplementedError
    end

private
    def is_cap(word)
        CAPS.include?(word[0])
    end

    def is_end(word)
        END_MARKS.include?(word[-1])
    end

    def pick_source(word)
        if is_end(word) || is_cap(word)
            @cap
        else
            @lower
        end
    end    

    def remove_punctuation(str)
        '''
        Remove tail punctuation for easier chaining.
        '''
        chars = Regexp.escape("()[]-_,:\"*;")
        str.gsub(/[#{chars}]/, "")
    end

    def collapse_heads(str)
        '''
        Make sentence less sparse by removing ending punctuation on head.
        '''
        #remove characters from the string
        end_chars = Regexp.escape(".?!")
        str.gsub(/[#{end_chars}]/, "")
    end

end

class TwitterMarkov < Markov
    def done?(message)
        return message.join(" ").size > rand(130)

    end
end
