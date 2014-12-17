require 'rails_helper'

describe JobsController do

  login_superadmin
  let(:valid_attributes) { attributes_for(:job) }
  let(:invalid_attributes) { attributes_for(:invalid_job) }

  describe 'GET #index' do
    it 'assigns all jobs as @jobs' do
      job = Job.create! valid_attributes
      job.submit!
      job.accept!
      get :index
      expect(assigns(:jobs)).to eq([job])
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET show' do

    it 'assigns the requested job as @job' do
      job = Job.create! valid_attributes
      job.submit!
      job.accept!
      get :show, id: job
      expect(assigns(:job)).to eq(job)
    end

    it 'renders the show template' do
      job = Job.create! valid_attributes
      job.submit!
      job.accept!
      get :show, id: job
      expect(response).to render_template :show
    end
  end

  describe 'GET new' do
    it 'assigns a new job as @job' do
      get :new
      expect(assigns(:job)).to be_a_new(Job)
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET edit' do
    it 'assigns the requested job as @job' do
      job = Job.create! valid_attributes
      job.submit!
      job.accept!
      get :edit, id: job
      expect(assigns(:job)).to eq(job)
    end

    it 'renders the edit template' do
      job = Job.create! valid_attributes
      get :edit, id: job
      expect(response).to render_template :edit
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Job' do
        expect {
          post :create, job: valid_attributes
        }.to change(Job, :count).by(1)
      end

      it 'assigns a newly created job as @job' do
        post :create, job: valid_attributes
        expect(assigns(:job)).to be_a(Job)
        expect(assigns(:job)).to be_persisted
      end

      it 'redirects to the created job' do
        post :create, job: valid_attributes
        expect(response).to redirect_to job_path(assigns[:job])
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved job as @job' do
        expect {
          post :create, job: invalid_attributes
        }.to_not change(Job, :count)
      end

      it 're-renders the :new template' do
        post :create, job: invalid_attributes
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH update' do
    describe 'with valid params' do
      let(:new_attributes) do
        { name: 'new name' }
      end

      it 'updates the requested job' do
        job = Job.create! valid_attributes
        patch :update, { id: job, job: new_attributes }
        job.reload
        expect(job.name).to eq 'new name'
      end

      it 'assigns the requested job as @job' do
        job = Job.create! valid_attributes
        patch :update, { id: job, job: valid_attributes }
        expect(assigns(:job)).to eq(job)
      end

      it 'redirects to the job' do
        job = Job.create! valid_attributes
        patch :update, { id: job, job: valid_attributes }
        expect(response).to redirect_to(job)
      end
    end

    describe 'with invalid params' do
      it 'assigns the job as @job' do
        job = Job.create! valid_attributes
        patch :update, { id: job, job: invalid_attributes }
        expect(assigns(:job)).to eq(job)
      end

      it "re-renders the 'edit' template" do
        job = Job.create! valid_attributes
        patch :update, { id: job, job: invalid_attributes }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested job' do
      job = Job.create! valid_attributes
      expect {
        delete :destroy, { id: job }
      }.to change(Job, :count).by(-1)
    end

    it 'redirects to the jobs list' do
      job = Job.create! valid_attributes
      delete :destroy, { id: job }
      expect(response).to redirect_to(jobs_url)
    end
  end

end
