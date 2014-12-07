require 'rails_helper'

RSpec.describe 'jobs/index', type: :view do
  before(:each) do
    assign(:jobs, [
      Job.create!(
        employer_id: 1,
        name: 'Name',
        body: 'MyText',
        status: 2
      ),
      Job.create!(
        employer_id: 1,
        name: 'Name',
        body: 'MyText',
        status: 2
      )
    ])
  end

  it 'renders a list of jobs' do
    render
    assert_select 'tr>td', text: 1.to_s, count: 2
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
  end
end
