require 'rails_helper'

RSpec.describe 'events/index', type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        title: 'Title',
        location: 'Location',
        agenda: 'MyText',
        address: 'MyText',
        logo: 'Logo',
        organizer_id: 1
      ),
      Event.create!(
        title: 'Title',
        location: 'Location',
        agenda: 'MyText',
        address: 'MyText',
        logo: 'Logo',
        organizer_id: 1
      )
    ])
  end

  it 'renders a list of events' do
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    assert_select 'tr>td', text: 'Location'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 'Logo'.to_s, count: 2
    assert_select 'tr>td', text: 1.to_s, count: 2
  end
end
