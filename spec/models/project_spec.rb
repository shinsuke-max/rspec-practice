require 'rails_helper'

RSpec.describe Project, type: :model do
  it "is invalid without project name" do
    user = User.create(
      first_name: "Aaron",
      last_name:  "Sumner",
      email:      "test@example.com",
      password:   "hogehoge")
    user_project = user.projects.build(name: nil)
    expect(user_project.errors[:name]).to include()
  end
  
  it "does not allow duplicate project names per user" do
    user = User.create(
      first_name: "Aaron",
      last_name:  "Sumner",
      email:      "test@example.com",
      password:   "hogehoge")
    # データベースに登録されてないといけないから create  
    user.projects.create(name: "Test Project")
    
    new_project = user.projects.build(name: "Test Project")
    new_project.valid?
    expect(new_project.errors[:name]).to include("has already been taken")
  end
  
  it "allows two users to share a project name" do
    user = User.create(
      first_name: "Aaron",
      last_name:  "Sumner",
      email:      "test@example.com",
      password:   "hogehoge")
    
    user.projects.create(name: "test project")
    
    other_user = User.create(
      first_name: "shin",
      last_name:  "sato",
      email:      "shi@example.com",
      password:   "hogehogi")
    other_project = other_user.projects.build(name: "test project")
    other_project.valid?
    expect(other_project).to be_valid
  end
  
  describe "late status" do
    # 締め切り日が過ぎていれば遅れていること
    it "is late when the due date is past today" do
      project = FactoryBot.create(:project, :due_yesterday)
      expect(project).to be_late
    end
    
    it "is on time when the due date is today" do
      project = FactoryBot.create(:project, :due_today)
      expect(project).to_not be_late
    end
    
    it "is on time when the due date is in the future" do
      project = FactoryBot.create(:project, :due_tomorrow)
      expect(project).to_not be_late
    end
  end
  
  it "can have many notes" do
    project = FactoryBot.create(:project, :with_note)
    expect(project.notes.length).to eq 5
  end
end
