require 'sinatra'

get '/' do

  @list = []

  File.open("question.txt", "r") do |f|
    # f에 question을 넣겠다라는 의미
    f.each_line do |line|
        @list << line
    end
  end

  erb :index
end

get '/ask' do
  @q = params["question"]
  @id = params["id"]

  File.open("question.txt", "a") do |f|
    # f에 question을 넣겠다라는 의미
    f.write(@q +","+ @id)
    f.write("\n")
  end

  erb :ask
end
