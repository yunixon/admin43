require 'rails_helper'

describe ResumesController do
 
  login_superadmin
  let(:valid_attributes) { attributes_for(:resume) }
  let(:invalid_attributes) { attributes_for(:invalid_resume) }

  describe 'GET #index' do
    it 'assigns all resumes as @resumes' do
      resume = Resume.create! valid_attributes
      resume.publicate!
      get :index
      expect(assigns(:resumes)).to eq([resume])
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET show' do

    it 'assigns the requested resume as @resume' do
      resume = Resume.create! valid_attributes
      resume.publicate!
      get :show, id: resume
      expect(assigns(:resume)).to eq(resume)
    end

    it 'renders the show template' do
      resume = Resume.create! valid_attributes
      resume.publicate!
      get :show, id: resume
      expect(response).to render_template :show
    end
  end

  describe 'GET new' do
    it 'assigns a new resume as @resume' do
      get :new
      expect(assigns(:resume)).to be_a_new(Resume)
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET edit' do
    it 'assigns the requested resume as @resume' do
      resume = Resume.create! valid_attributes
      resume.publicate!
      get :edit, id: resume
      expect(assigns(:resume)).to eq(resume)
    end

    it 'renders the edit template' do
      resume = Resume.create! valid_attributes
      get :edit, id: resume
      expect(response).to render_template :edit
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Resume' do
        expect {
          post :create, resume: valid_attributes
        }.to change(Resume, :count).by(1)
      end

      it 'assigns a newly created resume as @resume' do
        post :create, resume: valid_attributes
        expect(assigns(:resume)).to be_a(Resume)
        expect(assigns(:resume)).to be_persisted
      end

      it 'redirects to the created resume' do
        post :create, resume: valid_attributes
        expect(response).to redirect_to resume_path(assigns[:resume])
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved resume as @resume' do
        expect {
          post :create, resume: invalid_attributes
        }.to_not change(Resume, :count)
      end

      it 're-renders the :new template' do
        post :create, resume: invalid_attributes
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH update' do
    describe 'with valid params' do
      let(:new_attributes) do
        { name: 'new name' }
      end

      it 'updates the requested resume' do
        resume = Resume.create! valid_attributes
        patch :update, { id: resume, resume: new_attributes }
        resume.reload
        expect(resume.name).to eq 'new name'
      end

      it 'assigns the requested resume as @resume' do
        resume = Resume.create! valid_attributes
        patch :update, { id: resume, resume: valid_attributes }
        expect(assigns(:resume)).to eq(resume)
      end

      it 'redirects to the resume' do
        resume = Resume.create! valid_attributes
        patch :update, { id: resume, resume: valid_attributes }
        expect(response).to redirect_to(resume)
      end
    end

    describe 'with invalid params' do
      it 'assigns the resume as @resume' do
        resume = Resume.create! valid_attributes
        patch :update, { id: resume, resume: invalid_attributes }
        expect(assigns(:resume)).to eq(resume)
      end

      it "re-renders the 'edit' template" do
        resume = Resume.create! valid_attributes
        patch :update, { id: resume, resume: invalid_attributes }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested resume' do
      resume = Resume.create! valid_attributes
      expect {
        delete :destroy, { id: resume }
      }.to change(Resume, :count).by(-1)
    end

    it 'redirects to the resumes list' do
      resume = Resume.create! valid_attributes
      delete :destroy, { id: resume }
      expect(response).to redirect_to(resumes_url)
    end
  end

end
