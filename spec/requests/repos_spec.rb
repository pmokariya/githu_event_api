require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/repos", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Repo. As you add validations to Repo, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {name: "repo 1", link: "github.com"}}
  let(:invalid_attributes) { {name: "repo 1",link: ""}}

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # ReposController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }
  before(:each) do
    @repo = FactoryBot.create(:repo)
  end

  describe "GET /index" do
    it "renders a successful response" do
      get repos_url, headers: valid_headers, as: :json
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get repo_url(@repo), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Repo" do
        expect {
          post repos_url,
               params: { repo: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Repo, :count).by(1)
      end

      it "renders a JSON response with the new repo" do
        post repos_url,
             params: { repo: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Repo" do
        expect {
          post repos_url,
               params: { repo: invalid_attributes }, as: :json
        }.to change(Repo, :count).by(0)
      end

      it "renders a JSON response with errors for the new repo" do
        post repos_url,
             params: { repo: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates the requested repo" do
        patch repo_url(@repo),
              params: { repo: { link: "google.com" } }, headers: valid_headers, as: :json
        @repo.reload
      end

      it "renders a JSON response with the repo" do
        patch repo_url(@repo),
              params: { repo: { link: "google.com" } }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the repo" do
        patch repo_url(@repo),
              params: { repo: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested repo" do
      expect {
        delete repo_url(@repo), headers: valid_headers, as: :json
      }.to change(Repo, :count).by(-1)
    end
  end
end