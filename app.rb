require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/dictionary")
require("pry")

get("/") do
    erb(:index)
end

get('/words') do
    @words = Word.all
    erb(:words)
end

get('/words/new') do
    erb(:words_form)
end

post('/words') do
    word = params.fetch('wordinput')
    Word.new({:word => word}).save
    @words = Word.all
    erb(:words)
end

get('/del_words/:id') do
    @definitions = Word.find_definition(params.fetch('id').to_i)
    @word = Word.delete(params.fetch('id').to_i)
    @definitions.each do |definition|
        @definition=Definition.delete(definition.id)
    end
    @words = Word.all
    erb(:words)
end

get('/words/:id') do
    @word = Word.find(params.fetch('id').to_i)
    erb(:word)
end

get('/words/:id/definitions/new') do
    @word = Word.find(params.fetch('id').to_i)
    erb(:word_definitions_form)
end

post('/definitions') do
    content = params.fetch('content')
    @definition = Definition.new({:content => content})
    @definition.save
    @word = Word.find(params.fetch('word_id').to_i)
    @word.add_definition(@definition)
    erb(:word)
end
