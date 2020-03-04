require 'rails_helper'

RSpec.describe Note, type: :model do
  before do
    @user = User.create(
      first_name: "John",
      last_name:  "Smith",
      email:      "s@example.com",
      password:   "hogehoge")
    @project = @user.projects.create(name: "test project")
  end
  
  it "is valid with a user, project, and message" do
    note = Note.new(
      user: @user,
      project: @project,
      message: "hoge")
    expect(note).to be_valid
  end
  
  it "is invalid without a user" do
    note = Note.new(
      user: nil,
      project: @project,
      message: "h")
    expect(note.errors[:user]).to include()
  end
  
  it "is invalid without a user" do
    note = Note.new(
      user: @user,
      project: nil,
      message: "h")
    expect(note.errors[:user]).to include()
  end

  it "is invalid without a message" do
    note1 = @project.notes.build(message: nil, user: @user)
    expect(note1.errors[:message]).to include()
  end
  
  describe "search message for a term" do
    before do
      @note1 = Note.create(user: @user, project: @project, message: "this is first note")
      @note2 = Note.create(user: @user, project: @project, message: "this is second note")
      @note3 = Note.create(user: @user, project: @project, message: "First, preheat the oven")
    end
    
    context "when a match is found" do
      it "returns notes that match the search term" do
        expect(Note.search("first")).to include(@note1, @note3)
      end
    end
      
    context "when no match is found" do
      it "returns an empty collection when no results are found" do
        expect(Note.search("message")).to be_empty
      end
    end
  end

end
