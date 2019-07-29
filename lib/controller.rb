require 'gossip' #appel du gem gossip
require 'sinatra' #appel du gem sinatra

class ApplicationController < Sinatra::Base
 
    get '/' do #affichage de la page index
        erb :index
    end

    get '/gossips/new/' do #affichage du gossip
        erb :new_gossip
    end

    post '/gossips/new/' do  #recupération du contenu, nom de l'auteur + numero du gossip 
        Gossip.new(params["gossip_author"], params["gossip_content"], params['name']).save
    end

    get '/' do  #affichage de l'ensemble
        erb :index, locals: {gossips: Gossip.all}
    end

      get '/gossip/new/' do
        # matches "GET /hello/foo" and "GET /hello/bar"
        # params['name'] is 'foo' or 'bar'
        "Hello #{params['name']}!"
      end
  end
