require "test_helper"
require 'pry'

describe TasksController do
  let (:task) {
    Task.create name: "sample task", description: "this is an example for a test",
                completed: Time.now + 5.days
  }

  # Tests for Wave 1
  describe "index" do
    it "can get the index path" do
      # Act
      get tasks_path

      # Assert
      must_respond_with :success
    end

    it "can get the root path" do
      # Act
      get root_path

      # Assert
      must_respond_with :success
    end
  end

  # Unskip these tests for Wave 2
  describe "show" do
    it "can get a valid task" do
      #  skip
      # Act
      get task_path(task.id)

      # Assert
      must_respond_with :success
    end

    it "will redirect for an invalid task" do
        # skip
      # Act
      get task_path(-1)

      # Assert
      must_respond_with :redirect
      # expect(flash[:error]).must_equal "Could not find task with id: -1"
    end
  end

  describe "new" do
    it "can get the new task page" do
      #  skip

      # Act
      get new_task_path

      # Assert
      must_respond_with :success
    end
  end

  describe "create" do
    it "can create a new task" do
      #  skip

      # Arrange
      task_hash = {
        task: {
          name: "new task",
          description: "new task description",
          completed: nil,
        },
      }

      # Act-Assert
      expect {
        post tasks_path, params: task_hash
      }.must_change "Task.count", 1

      new_task = Task.find_by(name: task_hash[:task][:name])
      expect(new_task.description).must_equal task_hash[:task][:description]
      expect(new_task.completed).must_equal task_hash[:task][:completed]

      must_respond_with :redirect
      must_redirect_to task_path(new_task.id)
    end
  end

  # Unskip and complete these tests for Wave 3
  describe "edit" do
    it "can get the edit page for an existing task" do
      # skip

      # Your code here
      get edit_task_path(task.id)

      must_respond_with :success
    end

    it "will respond with redirect when attempting to edit a nonexistant task" do
      # skip
      # Your code here
      get edit_task_path(-1)

      # Assert
      must_respond_with :redirect
    end
  end

  # Uncomment and complete these tests for Wave 3
  describe "update" do
    # Note:  If there was a way to fail to save the changes to a task, that would be a great
    #        thing to test.
    it "can update an existing task" do
      # Your code here
      # Instead of Task.first, do Task.create
      existing_task = Task.create
      update_task_from_date = {
        task:{
          name: "Watch TV",
          description: "Descripton for tv",
          completed: ""
        }
      }
      # Act
      patch task_update_path(existing_task.id)
      # must_redirect_to root_path

      # Assert
      expect( Task.find_by(id: existing_task.id).name ).must_equal "Watch TV"
    end

    it "will redirect to the root page if given an invalid id" do
      # Your code here
      # patch task_update_path, params: {id: -1}

      # Assert
      # must_respond_with :redirect
    end
  end

  # Complete these tests for Wave 4
  describe "destroy" do
    # Your tests go here
    it "Deleting is successful!" do
      # Arrange:
      # Create a Book... then find the newly created book's id
      new_task = Task.new(
        name: 'New task',
        description: 'Test'
      )
      id = new_task.id

      # expect {
      #   delete task_delete_path, params[id: id]
      # }.must_change "Task.count", 1

    # Act-Assert:
      # Expect Differ: The book count goes 
      # down by one after we do "delete book_path( the newly created book's id )
    # Assert:
      # Must redirect to the root page

    end

  end

  # Complete for Wave 4
  describe "toggle_complete" do
    # Your tests go here
  end
end
