require  'spec_helper'

describe Contact::PostsController do
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    @post = Factory(:post)
    get :show, :id => @post.id
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Post.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Post.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(contact/post_url(assigns[:contact/post]))
  end
  
  it "edit action should render edit template" do
    @post = Factory(:post)
    get :edit, :id => @post.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    @post = Factory(:post)
    Post.any_instance.stubs(:valid?).returns(false)
    put :update, :id => @post.id
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    @post = Factory(:post)
    Post.any_instance.stubs(:valid?).returns(true)
    put :update, :id => @post.id
    response.should redirect_to(contact/post_url(assigns[:contact/post]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    post = Post.first
    delete :destroy, :id => contact/post
    response.should redirect_to(contact_posts_path_url)
    Post.exists?(post.id).should be_false
  end
end
