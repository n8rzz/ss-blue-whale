require "rails_helper"

RSpec.describe ProjectTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/projectTypes").to route_to("project_types#index")
    end

    it "routes to #show" do
      expect(:get => "/projectTypes/1").to route_to("project_types#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/projectTypes").to route_to("project_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/projectTypes/1").to route_to("project_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/projectTypes/1").to route_to("project_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/projectTypes/1").to route_to("project_types#destroy", :id => "1")
    end

    it "routes to #add_task_items" do
      expect(:post => "/projectTypes/1/taskItems").to route_to("project_types#add_task_items", :id => "1")
    end
  end
end
