class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # GET bakeries
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  # GET /bakeries/:id
  get '/bakeries/:id' do
    bakeries = Bakery.find(params[:id])
    bakeries.to_json(include: :baked_goods)
  end

  # GET /baked_goods/by_price
   get '/baked_goods/by_price' do
    baked_good = BakedGood.all.order(price: :desc)
    baked_good.to_json
   end

  #  GET /baked_goods/most_expensive
  get '/baked_goods/most_expensive' do
    baked_good = BakedGood.all.order(price: :desc).first
    baked_good.to_json
  end




end
