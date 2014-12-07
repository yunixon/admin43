require 'rails_helper'

RSpec.describe 'resumes/new', type: :view do
  before(:each) do
    assign(:resume, Resume.new(
      user_id: 1,
      body: 'MyText',
      status: 0
    ))
  end

  it 'renders new resume form' do
    render

    assert_select 'form[action=?][method=?]', resumes_path, 'post' do

      assert_select 'input#resume_user_id[name=?]', 'resume[user_id]'

      assert_select 'textarea#resume_body[name=?]', 'resume[body]'

      assert_select 'input#resume_status[name=?]', 'resume[status]'
    end
  end
end
