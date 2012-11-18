class Project < ActiveRecord::Base
  belongs_to :user
  has_many :matter, :dependent => :destroy
  
  attr_accessible  :grave, :name

  validates :name, :presence => true
  validates :name, :length => { :minimum => 3 }
end
