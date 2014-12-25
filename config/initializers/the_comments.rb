# TheComments.config.param_name => value

TheComments.configure do |config|
  config.max_reply_depth     = 6                   # comments tree depth
  config.tolerance_time      = 10                  # sec - after this delay user can post a comment
  config.default_state       = :published              # default state for comment
  config.default_owner_state = :published          # default state for comment for Moderator
  config.empty_inputs        = [:commentBody]      # array of spam trap fields
  config.default_title       = 'Название не задано'   # default commentable_title for denormalization
  config.template_engine     = :slim

  config.empty_trap_protection     = false
  config.tolerance_time_protection = false
  config.delete_descendants_on_node_delete = true
end
