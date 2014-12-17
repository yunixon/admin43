require 'rails_helper'

describe NewslinesController do
 
  login_superadmin
  let(:valid_attributes) { attributes_for(:newsline) }
  let(:invalid_attributes) { attributes_for(:invalid_newsline) }

  describe 'GET #index' do
    it 'assigns all newslines as @newslines' do
      newsline = Newsline.create! valid_attributes
      newsline.publicate!
      get :index
      expect(assigns(:newslines)).to eq([newsline])
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET show' do

    it 'assigns the requested newsline as @newsline' do
      newsline = Newsline.create! valid_attributes
      newsline.publicate!
      get :show, id: newsline
      expect(assigns(:newsline)).to eq(newsline)
    end

    it 'renders the show template' do
      newsline = Newsline.create! valid_attributes
      newsline.publicate!
      get :show, id: newsline
      expect(response).to render_template :show
    end
  end

  describe 'GET new' do
    it 'assigns a new newsline as @newsline' do
      get :new
      expect(assigns(:newsline)).to be_a_new(Newsline)
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET edit' do
    it 'assigns the requested newsline as @newsline' do
      newsline = Newsline.create! valid_attributes
      newsline.publicate!
      get :edit, id: newsline
      expect(assigns(:newsline)).to eq(newsline)
    end

    it 'renders the edit template' do
      newsline = Newsline.create! valid_attributes
      get :edit, id: newsline
      expect(response).to render_template :edit
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Newsline' do
        expect {
          post :create, newsline: valid_attributes
        }.to change(Newsline, :count).by(1)
      end

      it 'assigns a newly created newsline as @newsline' do
        post :create, newsline: valid_attributes
        expect(assigns(:newsline)).to be_a(Newsline)
        expect(assigns(:newsline)).to be_persisted
      end

      it 'redirects to the created newsline' do
        post :create, newsline: valid_attributes
        expect(response).to redirect_to newsline_path(assigns[:newsline])
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved newsline as @newsline' do
        expect {
          post :create, newsline: invalid_attributes
        }.to_not change(Newsline, :count)
      end

      it 're-renders the :new template' do
        post :create, newsline: invalid_attributes
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH update' do
    describe 'with valid params' do
      let(:new_attributes) do
        { name: 'new name' }
      end

      it 'updates the requested newsline' do
        newsline = Newsline.create! valid_attributes
        patch :update, { id: newsline, newsline: new_attributes }
        newsline.reload
        expect(newsline.name).to eq 'new name'
      end

      it 'assigns the requested newsline as @newsline' do
        newsline = Newsline.create! valid_attributes
        patch :update, { id: newsline, newsline: valid_attributes }
        expect(assigns(:newsline)).to eq(newsline)
      end

      it 'redirects to the newsline' do
        newsline = Newsline.create! valid_attributes
        patch :update, { id: newsline, newsline: valid_attributes }
        expect(response).to redirect_to(newsline)
      end
    end

    describe 'with invalid params' do
      it 'assigns the newsline as @newsline' do
        newsline = Newsline.create! valid_attributes
        patch :update, { id: newsline, newsline: invalid_attributes }
        expect(assigns(:newsline)).to eq(newsline)
      end

      it "re-renders the 'edit' template" do
        newsline = Newsline.create! valid_attributes
        patch :update, { id: newsline, newsline: invalid_attributes }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested newsline' do
      newsline = Newsline.create! valid_attributes
      expect {
        delete :destroy, { id: newsline }
      }.to change(Newsline, :count).by(-1)
    end

    it 'redirects to the newslines list' do
      newsline = Newsline.create! valid_attributes
      delete :destroy, { id: newsline }
      expect(response).to redirect_to(newslines_url)
    end
  end

end
