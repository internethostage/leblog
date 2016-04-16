require 'rails_helper'

RSpec.describe Post, type: :model do
  # - Validation of the presence of Post's title
  # - Validation of the minimum length of Post's title (7 characters)
  # - Validation of the presence of Post's body
  # - Test drive a method `body_snippet` method that returns a maximum of a 100 characters with "..." of the body if it's more than a 100 characters long.

  describe "valid posts" do
    it "requires the presence of Post's title" do
      p = Post.new
      validation_outcome = p.valid?
      expect(p.errors[:title]).to include("can't be blank!")
    end

    it "requires that the minimum length of a post title is 7 characters" do
      p = Post.new title: "Welco"
      validation_outcome = p.valid?
      expect(p.errors[:title]).to include("is too short (minimum is 7 characters)")
    end

    it "requires that the post has a body" do
      p = Post.new
      validation_outcome = p.valid?
      expect(p.errors[:body]).to include("can't be blank!")
    end
  end

  describe ".body_snippet working" do
    it "returns a maximum of 100 characters with ... of the body if more than 100 characters" do
      p = Post.new title: "Welcome to the blog", body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
      expect(p.body_snippet).to eql("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore ...")
    end

    it "returns the body if its 100 characters or less" do
      p = Post.new title: "Welcome" body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"
      expect(p.body_snippet).to eql("Lorem ipsum dolor sit amet, consectetur adipisicing elit")
    end

  end

end
