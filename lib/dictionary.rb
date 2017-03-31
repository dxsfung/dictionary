class Word
    @@words = []
    attr_reader(:word, :definitions, :id, :delete_flag)
    attr_writer(:delete_flag)
    define_method(:initialize) do |word|
        @word = word.fetch(:word)
        @definitions = []
        @id = @@words.length.+(1)
        @delete_flag = false
    end

    define_singleton_method(:all) do
        @@words
    end

    define_method(:save) do
        @@words.push(self)
    end

    define_singleton_method(:clear) do
        @@words = []
    end

    define_singleton_method(:find) do |id|
        found_word = nil
        @@words.each do |word|
            if word.delete_flag != true
                if word.id.eql?(id.to_i)
                    found_word = word
                end
            end
        end
        found_word
    end

    define_singleton_method(:find_delete) do |id|
        found_word = nil
        @@words.each do |word|
            if word != nil
                if word.delete_flag == true
                    found_word = word
                end
            end
        end
    end

    define_singleton_method(:delete) do |id|
        @@words[id-1].delete_flag = true
    end

    define_singleton_method(:find_definition) do |id|
        found_definitions=@@words[id-1].definitions
        if found_definitions != nil
            return found_definitions
        else
            return []
        end
    end

    define_method(:add_definition) do |definition|
        @definitions.push(definition)
    end


end

class Definition
    @@definitions = []
    attr_reader(:content, :id, :delete_flag)
    define_method(:initialize) do |meaning|
        @content = meaning.fetch(:content)
        @id = @@definitions.length.+(1)
        @delete_flag = false
    end

    define_singleton_method(:all) do
        @@definitions
    end

    define_method(:save) do
        @@definitions.push(self)
    end

    define_singleton_method(:delete) do |id|
        @@definitions[id-1].delete_flag = true
    end

    define_singleton_method(:clear) do
        @@definitions = []
    end

    define_singleton_method(:find) do |id|
        found_definition = nil
        @@definitions.each do |definition|
            if definition != nil
                if definition.delete_flag != true
                    if definition.id.eql?(id)
                        found_definition = definition
                    end
                end
            end
        end
        found_definition
    end

    define_singleton_method(:find_delete) do |id|
        found_definition = nil
        @@definitions.each do |definition|
            if definition != nil
                if definition.delete_flag == true
                    found_definition = definition
                end
            end
        end
    end

end
