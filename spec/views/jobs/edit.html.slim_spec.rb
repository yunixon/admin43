require 'rails_helper'

RSpec.describe 'jobs/edit', type: :view do
  before(:each) do
    @job = assign(:job, Job.create!(
      employer_id: 1,
      name: 'MyString',
      body: 'MyText',
      status: 1
    ))
  end

  it 'renders the edit job form' do
    render

    assert_select 'form[action=?][method=?]', job_path(@job), 'post' do

      assert_select 'input#job_employer_id[name=?]', 'job[employer_id]'

      assert_select 'input#job_name[name=?]', 'job[name]'

      assert_select 'textarea#job_body[name=?]', 'job[body]'

      assert_select 'input#job_status[name=?]', 'job[status]'
    end
  end
end
