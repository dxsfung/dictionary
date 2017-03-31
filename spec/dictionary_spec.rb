require('rspec')
require('dictionary')

describe(Word) do
    before() do
        Word.clear()
    end

    describe('#word') do
        it("returns the word of the wordobject") do
            test_wordobject = Word.new({:word => "abandon"})
            expect(test_wordobject.word()).to(eq("abandon"))
        end
    end

    describe('#id') do
        it("returns the id of the wordobject") do
            test_wordobject = Word.new({:word => "abandon"})
            expect(test_wordobject.id()).to(eq(1))
        end
    end

    describe('#definitions') do
        it("initially returns an empty array of definitions for the wordobject") do
            test_wordobject = Word.new({:word => "abandon"})
            expect(test_wordobject.definitions).to(eq([]))
        end
    end

    describe("#save") do
        it("adds a wordobject to the array of saved wordobjects") do
            test_wordobject = Word.new({:word => "abandon"})
            test_wordobject.save
            expect(Word.all).to(eq([test_wordobject]))
        end
    end

    describe(".all") do
        it("is empty at first") do
            expect(Word.all).to(eq([]))
        end
    end

    describe(".clear") do
        it("empties out all of the saved wordobjects") do
            Word.new({:word => "abandon"}).save
            Word.clear
            expect(Word.all).to(eq([]))
        end
    end

    describe(".find") do
        it("returns a wordobject by its id number") do
            test_wordobject = Word.new({:word => "abandon"})
            test_wordobject.save
            test_wordobject2 = Word.new({:word => "assassin"})
            test_wordobject2.save
            expect(Word.find(test_wordobject.id)).to(eq(test_wordobject))
        end
    end

    describe('#add_definition') do
        it("adds a new definition to a wordobject") do
            test_wordobject = Word.new({:word => "abandon"})
            test_definition = Definition.new({:content => "to leave completely and finally; forsake utterly; desert"})
            test_wordobject.add_definition(test_definition)
            expect(test_wordobject.definitions).to(eq([test_definition]))
        end
    end
end # Word class

describe(Definition) do
    before do
        Definition.clear
    end

    describe('#content') do
        it("returns the content of the definition") do
            test_definition = Definition.new({:content => "to leave completely and finally; forsake utterly; desert"})
            expect(test_definition.content).to(eq("to leave completely and finally; forsake utterly; desert"))
        end
    end

    describe('#id') do
        it("returns the id of the definition") do
            test_definition = Definition.new({:content => "to leave completely and finally; forsake utterly; desert"})
            expect(test_definition.id).to(eq(1))
        end

        it("returns the id of the definition") do
            test_definition = Definition.new({:content => "to leave completely and finally; forsake utterly; desert"})
            test_definition.save
            test_definition2 = Definition.new({:content => "2nd Meaning of the word"})
            test_definition2.save
            expect(test_definition2.id).to(eq(2))
        end

    end

    describe("#save") do
        it("adds a definition to the array of saved definitions") do
            test_definition = Definition.new({:content => "to leave completely and finally; forsake utterly; desert"})
            test_definition.save
            expect(Definition.all).to(eq([test_definition]))
        end
    end

    describe(".all") do
        it("is empty at first") do
            expect(Definition.all).to(eq([]))
        end
    end

    describe(".clear") do
        it("empties out all of the saved definitions of the Class") do
            test_definition = Definition.new({:content => "to leave completely and finally; forsake utterly; desert"})
            test_definition.save
            Definition.clear
            expect(Definition.all).to(eq([]))
        end
    end

    describe(".find") do
        it("returns a definition by its id number") do
            test_definition = Definition.new({:content => "to leave completely and finally; forsake utterly; desert"})
            test_definition.save
            test_definition2 = Definition.new({:content => "2nd meaning: to leave completely and finally; forsake utterly; desert"})
            test_definition2.save
            expect(Definition.find(test_definition.id)).to(eq(test_definition))
        end
    end


end  #class Definition
