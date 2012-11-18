# features/support/env.rb   
require 'rubygems'
require 'spork'
require 'cucumber/rails'
#require 'factory_girl/step_definitions'  
Spork.prefork do  
	Capybara.default_selector = :css  
	DatabaseCleaner.strategy = :transaction  
	Cucumber::Rails::Database.javascript_strategy = :truncation
end  
Spork.each_run do  
end 