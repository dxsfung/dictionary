class Word
    @@words = []
    attr_reader(:word, :definition, :id, :delete_flag)
    attr_writer(:delete_flag)
    define_method(:initialize) do |word|
        @word = word.fetch(:word)
        @definition = word.fetch(:definition)
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

    define_singleton_method(:delete) do |id|
        @@words[id-1].delete_flag = true
    end

end

class Dealership
    @@dealerships = []
    attr_reader(:name, :id, :cars)
    define_method(:initialize) do |dealer|
        @name = dealer
        @id = @@dealerships.length().+(1)
        @cars = []
    end

    define_singleton_method(:all) do
        @@dealerships
    end

    define_method(:save) do
        @@dealerships.push(self)
    end

    define_singleton_method(:delete) do |id|
        @@dealerships[id-1] = nil
    end

    define_singleton_method(:clear) do
        @@dealerships = []
    end

    define_singleton_method(:find) do |id|
        found_dealership = nil
        @@dealerships.each() do |dealership|
          if dealership != nil
            if dealership.id().eql?(id)
                found_dealership = dealership
            end
          end
        end
        found_dealership
    end

    define_singleton_method(:find_cars) do |id|
        found_cars=@@dealerships[id-1].cars
        if found_cars != nil
          return found_cars
        else
          return []
        end
    end

    define_method(:add_word) do |word|
        @cars.push(word)
    end

end
