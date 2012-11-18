# .spec/spec_helper.rb   
require 'rubygems'
require 'spork'  
require 'capybara/rspec'
 
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__) 
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}   

require 'rspec/rails'
require 'rspec/autorun'
require 'shoulda/matchers'    

Spork.prefork do  
  RSpec.configure do |config|
    #config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.infer_base_class_for_anonymous_controllers = false
  end
end  
Spork.each_run do  
end