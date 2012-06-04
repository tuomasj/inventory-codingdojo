require 'spec_helper'

describe ProductsController do
  def create_product
    product = Product.create(:name => "Rat")
    return product
  end
  
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
  
  describe "GET show" do
    it "responds successfully" do
      get :show
      response.should be_successful
    end
    
    it "assigns the right product" do
      product = create_product 
      get :show, {:id => product.id}
      assigns(:product).should eq product
    end
    
    it "renders show template" do
      product = create_product
      get :show, {:id => product.id}
      response.should render_template(:show)
    end
  end
  
  describe "GET edit" do
    it "responds successfully" do
      get :edit
      response.should be_successful
    end
    
    it "assigns the right product" do
      product = create_product 
      get :edit, {:id => product.id}
      assigns(:product).should eq product
    end
  end
  
  describe "PUT update" do
    it "updates the record" do
      product = create_product
      put :update, {:product => {"name" => "edited name"},
          :id => product.id}
      Product.find_by_name("edited name").should_not be_nil
      response.should redirect_to(product_path)
    end
  end
  
  describe "DELETE destroy" do
    it "removes the record" do
      product = create_product
      expect {
        delete :destroy, { :id => product.id }
      }.to change(Product, :count).by(-1)
    end
  end
    
end
