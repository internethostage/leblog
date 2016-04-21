require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "#new" do
    let(:post) { FactoryGirl.create(:post) }
    let(:user) { FactoryGirl.create(:user) }
    describe "with a signed in user" do
      before { request.session[:user_id] = user.id}

      it "renders the new template" do
        get :new, post_id: post.id
        expect(response).to render_template(:new)
      end

      it "assigns a new post object" do
        get :new, post_id: post.id
        expect(assigns(:post)).to be_a_new(Post)
      end
    end

    describe "without a signed in user" do
      it "redirects to sign up page" do
        get :new, post_id: post.id
        expect(response).to redirect_to new_session_path
      end
    end
  end

  describe "#create" do
    let(:createpost) { FactoryGirl.create(:post) }
    let(:user) { FactoryGirl.create(:user) }
    describe "with a signed in user" do
      before { request.session[:user_id] = user.id}

      describe "with valid attributes" do
        def valid_request
          post :create, post: FactoryGirl.attributes_for(:post)
        end

        it "saves a record to the database" do
          count_before = Post.count
          valid_request
          count_after  = Post.count
          expect(count_after).to eq(count_before + 1)
        end

        it "redirects to the product's show page" do
          valid_request
          expect(response).to redirect_to(post_path(Post.last))
        end

        it "sets a success flash message" do
          valid_request
          expect(flash[:notice]).to be
        end

        it "associates a user to the post" do
          valid_request
          expect(Post.last.user_id).to eq(user.id)
        end
      end

      describe "with invalid attributes" do
        def invalid_request
          post :create, post: FactoryGirl.attributes_for(:post, title: "ble")
        end

        it "doesn't save a record to the database" do
          count_before = Post.count
          invalid_request
          count_after  = Post.count
          expect(count_after).to eq(count_before)
        end

        it "renders the new template again" do
          invalid_request
          expect(response).to render_template(:new)
        end

      end
    end

    describe "without a signed in user" do
      before { request.session[:user_id] = nil}
      def valid_request
        post :create, post: FactoryGirl.attributes_for(:post)
      end

      it "does not allow to add new posts" do
        count_before = Post.count
        valid_request
        count_after  = Post.count
        expect(count_after).to eq(count_before)
      end

      it "redirects the user to the sign in page" do
        valid_request
        expect(response).to redirect_to(new_session_path)
      end
    end

  end

  describe "#show" do
    let(:post) { FactoryGirl.create(:post) }
    let(:user) { FactoryGirl.create(:user) }
    before do
      get :show, id: post.id
    end
    it "renders the specific post page" do
      expect(response).to render_template(:show)
    end

    it "sets a product instance variable" do
      expect(assigns(:post)).to eq(post)
    end

  end

  describe "#index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "assigns an instance variable to all campaignss in the DB" do
      p = FactoryGirl.create(:post)
      p2 = FactoryGirl.create(:post)
      get :index
      expect(Post.last(2)).to eq([p,p2])
    end

  end

  describe "#edit" do
    it "renders the edit template"
    it "sets an instance variable with the passed id"

  end

  describe "#update" do
    describe "with valid params" do
      it "updates the record whose id is passed"
      it "redirects to the show page"
      it "sets a flash notice message"
    end

    describe "with invalid params" do
      it "doesn't update the record"
      it "renders the edit template"
    end

  end

  describe "destroy" do
    it "removes the post from the database"
    it "renders the index page"
    it "sets a flash message"

  end

end
