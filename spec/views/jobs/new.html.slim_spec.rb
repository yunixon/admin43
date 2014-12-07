require 'rails_helper'

RSpec.describe 'jobs/new', type: :view do
  before(:each) do
    assign(:job, Job.new(
      employer_id: 1,
      name: 'MyString',
      body: 'MyText',
      status: 1
    ))
  end

  it 'renders new job form' do
    render

    assert_select 'form[action=?][method=?]', jobs_path, 'post' do

      assert_select 'input#job_employer_id[name=?]', 'job[employer_id]'

      assert_select 'input#job_name[name=?]', 'job[name]'

      assert_select 'textarea#job_body[name=?]', 'job[body]'

      assert_select 'input#job_status[name=?]', 'job[status]'
    end
  end
end
