
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  get '/articles/new' do #read/index
    erb :new
  end
  
  post '/articles' do #create
    @article = Article.create(params)
    redirect to "/articles/#{ @article.id }"
  end
  
  get "/articles/:id" do #read/show
    @article = Article.find(params[:id])
    erb :show
  end
  
  get '/articles/:id/edit' do #update(edit)
    @article = Article.find(params[:id])
    erb :edit
  end
  
  
  
end
