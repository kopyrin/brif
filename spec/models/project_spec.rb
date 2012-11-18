require 'spec_helper'

describe Project do
  #сначала проверяем валидаторы
  context "validates" do
    before(:all) do
      @project = FactoryGirl.create :project
    end

    #должна быть валидная, если валидные атрибуты (name, autor)
    it "is valid with valid attributes" do
      @project.should be_valid
    end

    #не валидная без name
    it "is not valid without a name" do
      @project.name = nil
      @project.errors_on(:name).should include("can't be blank")
      @project.should be_valid
    end

    #не валидная без autor
    it "is not valid without a autor" do
      @project.autor = nil
      @project.errors_on(:autor).should include("can't be blank")
      @project.should_not be_valid
    end

    #не валидная, если длина name, меньше чем 3 символа
    it "is not valid if length of name less then 3 characters" do
      @project.name = "12"
      @project.should_not be_valid
    end

    #валидная с длиной name больше, чем 3 символа
    it "is valid if length of name greater then 3 characters" do
      @project.name = "123"
      @project.should be_valid
    end
  end
end
