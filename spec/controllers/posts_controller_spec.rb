require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "#new" do
    it "renders the new template"
    it "assigns a new post object"
  end

  describe "#create" do
    describe "with valid attributes" do
      it "saves a record to the database"
      it "redirects to the product's show page"
      it "sets a success flash message"
    end

    describe "with invalid attributes" do
      it "doesn't save a record to the database"
      it "renders the new template again"
      it "sets an alert message"
    end

  end

  describe "#show" do
    it "renders the specific post page"
    it "sets a product instance variable"

  end

  describe "#index" do
    it "renders the index template"
    it "assigns an instance variable to all campaignss in the DB"

  end

  describe "#edit" do
    it "renders the edit template"
    it "sets an instance variable with the passed id"

  end

  describe "#update" do
    describe "with valid params" do
      it "updates the record whose id is passed"
      it "redirects to the show page"
      it "sets a flash notice message"
    end

    describe "with invalid params" do
      it "doesn't update the record"
      it "renders the edit template"
    end

  end

  describe "destroy" do
    it "removes the post from the database"
    it "renders the index page"
    it "sets a flash message"

  end

end
