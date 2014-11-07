class NewslineElement < ActiveRecord::Base
  belongs_to :newsline
  belongs_to :element, :polymorphic => true
end
