class Matter < ActiveRecord::Base
  belongs_to :project
  attr_accessible :answer, :category, :demand, :ordercategory, :project_id, :sybcategory
end
