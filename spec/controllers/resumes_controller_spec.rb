require 'rails_helper'

RSpec.describe ResumesController, :type => :controller do
  # This should return the minimal set of attributes required to create a valid
  # Resume. As you add validations to Resume, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ResumesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all resumes as @resumes" do
      resume = Resume.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:resumes)).to eq([resume])
    end
  end

  describe "GET show" do
    it "assigns the requested resume as @resume" do
      resume = Resume.create! valid_attributes
      get :show, {:id => resume.to_param}, valid_session
      expect(assigns(:resume)).to eq(resume)
    end
  end

  describe "GET new" do
    it "assigns a new resume as @resume" do
      get :new, {}, valid_session
      expect(assigns(:resume)).to be_a_new(Resume)
    end
  end

  describe "GET edit" do
    it "assigns the requested resume as @resume" do
      resume = Resume.create! valid_attributes
      get :edit, {:id => resume.to_param}, valid_session
      expect(assigns(:resume)).to eq(resume)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Resume" do
        expect {
          post :create, {:resume => valid_attributes}, valid_session
        }.to change(Resume, :count).by(1)
      end

      it "assigns a newly created resume as @resume" do
        post :create, {:resume => valid_attributes}, valid_session
        expect(assigns(:resume)).to be_a(Resume)
        expect(assigns(:resume)).to be_persisted
      end

      it "redirects to the created resume" do
        post :create, {:resume => valid_attributes}, valid_session
        expect(response).to redirect_to(Resume.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved resume as @resume" do
        post :create, {:resume => invalid_attributes}, valid_session
        expect(assigns(:resume)).to be_a_new(Resume)
      end

      it "re-renders the 'new' template" do
        post :create, {:resume => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested resume" do
        resume = Resume.create! valid_attributes
        put :update, {:id => resume.to_param, :resume => new_attributes}, valid_session
        resume.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested resume as @resume" do
        resume = Resume.create! valid_attributes
        put :update, {:id => resume.to_param, :resume => valid_attributes}, valid_session
        expect(assigns(:resume)).to eq(resume)
      end

      it "redirects to the resume" do
        resume = Resume.create! valid_attributes
        put :update, {:id => resume.to_param, :resume => valid_attributes}, valid_session
        expect(response).to redirect_to(resume)
      end
    end

    describe "with invalid params" do
      it "assigns the resume as @resume" do
        resume = Resume.create! valid_attributes
        put :update, {:id => resume.to_param, :resume => invalid_attributes}, valid_session
        expect(assigns(:resume)).to eq(resume)
      end

      it "re-renders the 'edit' template" do
        resume = Resume.create! valid_attributes
        put :update, {:id => resume.to_param, :resume => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested resume" do
      resume = Resume.create! valid_attributes
      expect {
        delete :destroy, {:id => resume.to_param}, valid_session
      }.to change(Resume, :count).by(-1)
    end

    it "redirects to the resumes list" do
      resume = Resume.create! valid_attributes
      delete :destroy, {:id => resume.to_param}, valid_session
      expect(response).to redirect_to(resumes_url)
    end
  end

end
