require 'rails_helper'

describe TaskItemsController, :type => :controller do
  describe 'GET #show' do
    before(:each) do
      @task_item = FactoryGirl.create :task_item
      get :show, params: { id: @task_item.id }
    end

    it 'has project_type ids as an embedded object' do
      task_item_response = JSON.parse(response.body)
      expect(task_item_response[:project_type_ids]).to eq nil
    end
  end
end
