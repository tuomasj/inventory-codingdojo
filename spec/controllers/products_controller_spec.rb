require 'spec_helper'

describe ProductsController do
  describe "GET index" do
    it "responds successfully" do
      get :index
      response.should be_successful
    end
    
    it "should contain array of product" do
      products = []
      products << Product.create(name: "cat")
      products << Product.create(name: "dog")
      get :index
      assigns(:products).should eq products 
    end
  end
  
  describe "GET new" do
    it "responds successfully" do
      get :new
      response.should be_successful
    end
    
    it "creates new instance of product" do
      get :new
      assigns(:product).should be_a_new(Product)
    end
  end
  
  describe "POST create" do
    it "redirects successfully" do
      post :create
      response.should be_successful
    end
    
    it "assigns a product" do
      post :create
      assigns(:product).should_not be_nil
    end
    it "creates a record with valid parameter" do
      post :create, {:product => {"name" => "Katti"}}
      Product.count.should eq(1)
    end
  end
end
