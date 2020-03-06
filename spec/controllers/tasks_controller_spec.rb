require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
    @project = FactoryBot.create(:project, owner: @user)
    @task = @project.tasks.create!(name: "test")
  end
  
  describe "#show" do
    it "responds with JSON formatted output" do
      sign_in @user
      get :show, format: :json,
        params: {project_id: @project.id, id: @task.id}
      expect(response.content_type).to eq "application/json"
    end
  end
  
  describe "#create" do
    it "responds with JSON formatted output" do
      new_task = { name: "new" }
      sign_in @user
      expect{
        post :create, format: :json,
          params: {project_id: @project.id, task: new_task}
      }.to change(@project.tasks, :count).by(1)
    end
    
    it "requires authentication" do
      new_task = { name: "new" }
      expect{
        post :create, format: :json,
          params: {project_id: @project.id, task: new_task}
      }.to_not change(@project.tasks, :count)
      expect(response).to_not be_success
    end
  end
end
