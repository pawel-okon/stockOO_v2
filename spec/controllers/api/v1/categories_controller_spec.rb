require 'rails_helper'

describe Api::V1::CategoriesController, type: :controller do
  let(:category) { create(:category) }

  describe "GET index" do
    context "signed user" do
      before { sign_in_user }

      it_behaves_like "success http request", template: :index do
        let(:action) { get :index }
      end

      it "assigns categories" do
        expect(Category).to receive(:all).and_return(Category.none)
        get :index
      end
    end

    context "not signed in user" do
      it_behaves_like "unauthorized http request" do
        let(:action) { get :index }
      end
    end
  end

  describe "GET show" do
    context "signed user" do
      before { sign_in_user }

      it_behaves_like "success http request", template: :show do
        let(:action) { get :show, id: category.id }
      end

      context "json response" do
        #TODO move it into shared example
        it "returns valid content type" do
          get :show, id: category.id, format: :json
          expect(response.headers['Content-Type']).to eq("application/json; charset=utf-8")
        end

        it "returns a valid json" do
          get :show, id: category.id, format: :json
          expect(json_response).to eq(check_json_response(action: :show, object: category))
        end
      end

      it "assigns a category" do
        get :show, id: category.id
        expect(assigns[:category]).to eq(category)
      end
    end

    context "not signed in category" do
      it_behaves_like "unauthorized http request" do
        let(:action) { get :show, id: category.id }
      end
    end
  end

  describe "GET new" do
    context "signed user" do
      before { sign_in_user }

      it_behaves_like "success http request", template: :new do
        let(:action) { get :new }
      end

      it "assigns a category" do
        get :new
        expect(assigns[:category].new_record?).to eq(true)
      end
    end

    context "not signed in category" do
      it_behaves_like "unauthorized http request" do
        let(:action) { get :new }
      end
    end
  end

  describe "POST create" do
    context "signed user" do
      before { sign_in_user }

      context "validation success" do
        let(:name) { "Super Category" }

        it "creates a new category" do
          expect {
            do_post(name: name)
          }.to change { Category.count }.by(1)
          expect(Category.last.name).to eq(name)
        end

        it "renders a new view" do
          do_post
          expect(response).to redirect_to(api_v1_category_path(Category.last))
        end
      end

      context "validation failed" do
        it "doesn't create a new category" do
          expect {
            do_post(name: nil)
          }.not_to change { Category.count }
        end

        it "renders a new view" do
          do_post(name: nil)
          expect(response).to render_template(:new)
        end
      end
    end

    context "not signed in category" do
      it_behaves_like "unauthorized http request" do
        let(:action) { do_post }
      end
    end

    def do_post(attrs = {})
      attrs = attributes_for(:category).merge(attrs)
      post :create, category: attrs
    end
  end
end
