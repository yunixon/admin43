require 'rails_helper'

describe EventsController do

  login_superadmin
  let(:valid_attributes) { attributes_for(:event) }
  let(:invalid_attributes) { attributes_for(:invalid_event) }

  describe 'GET #index' do
    it 'assigns all events as @events' do
      event = Event.create! valid_attributes
      event.submit!
      event.accept!
      get :index
      expect(assigns(:events)).to eq([event])
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET show' do

    it 'assigns the requested event as @event' do
      event = Event.create! valid_attributes
      event.submit!
      event.accept!
      get :show, id: event
      expect(assigns(:event)).to eq(event)
    end

    it 'renders the show template' do
      event = Event.create! valid_attributes
      event.submit!
      event.accept!
      get :show, id: event
      expect(response).to render_template :show
    end
  end

  describe 'GET new' do
    it 'assigns a new event as @event' do
      get :new
      expect(assigns(:event)).to be_a_new(Event)
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET edit' do
    it 'assigns the requested event as @event' do
      event = Event.create! valid_attributes
      event.submit!
      event.accept!
      get :edit, id: event
      expect(assigns(:event)).to eq(event)
    end

    it 'renders the edit template' do
      event = Event.create! valid_attributes
      get :edit, id: event
      expect(response).to render_template :edit
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Event' do
        expect {
          post :create, event: valid_attributes
        }.to change(Event, :count).by(1)
      end

      it 'assigns a newly created event as @event' do
        post :create, event: valid_attributes
        expect(assigns(:event)).to be_a(Event)
        expect(assigns(:event)).to be_persisted
      end

      it 'redirects to the created event' do
        post :create, event: valid_attributes
        expect(response).to redirect_to event_path(assigns[:event])
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved event as @event' do
        expect {
          post :create, event: invalid_attributes
        }.to_not change(Event, :count)
      end

      it 're-renders the :new template' do
        post :create, event: invalid_attributes
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH update' do
    describe 'with valid params' do
      let(:new_attributes) do
        { title: 'new title' }
      end

      it 'updates the requested event' do
        event = Event.create! valid_attributes
        patch :update, { id: event, event: new_attributes }
        event.reload
        expect(event.title).to eq 'new title'
      end

      it 'assigns the requested event as @event' do
        event = Event.create! valid_attributes
        patch :update, { id: event, event: valid_attributes }
        expect(assigns(:event)).to eq(event)
      end

      it 'redirects to the event' do
        event = Event.create! valid_attributes
        patch :update, { id: event, event: valid_attributes }
        expect(response).to redirect_to(event)
      end
    end

    describe 'with invalid params' do
      it 'assigns the event as @event' do
        event = Event.create! valid_attributes
        patch :update, { id: event, event: invalid_attributes }
        expect(assigns(:event)).to eq(event)
      end

      it "re-renders the 'edit' template" do
        event = Event.create! valid_attributes
        patch :update, { id: event, event: invalid_attributes }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested event' do
      event = Event.create! valid_attributes
      expect {
        delete :destroy, { id: event }
      }.to change(Event, :count).by(-1)
    end

    it 'redirects to the events list' do
      event = Event.create! valid_attributes
      delete :destroy, { id: event }
      expect(response).to redirect_to(events_url)
    end
  end

end
