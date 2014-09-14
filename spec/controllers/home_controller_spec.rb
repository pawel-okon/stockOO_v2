require 'rails_helper'

describe HomeController, type: :controller do
  describe "GET index" do
    context "signed user" do
      before { sign_in_user }

      it_behaves_like "success http request", template: :index do
        let(:action) { get :index }
      end

      context "variables assigment" do
        context "products" do
          let(:collection) { Product.none }
          it "assigns a products collections into the view" do
            expect(Product).to receive(:from_current_day).
              and_return(collection)
            expect(collection).to receive(:ordered)
            get :index
          end
        end

        context "categories" do
          let(:collection) { Category.none }
          it "assigns a categories collections into the view" do
            expect(Category).to receive(:from_current_day).
              and_return(collection)
            expect(collection).to receive(:ordered)
            get :index
          end
        end

        context "manufacturers" do
          let(:collection) { Manufacturer.none }
          it "assigns a manufacturers collections into the view" do
            expect(Manufacturer).to receive(:from_current_day).
              and_return(collection)
            expect(collection).to receive(:ordered)
            get :index
          end
        end
      end
    end

    context "not signed in user" do
      it_behaves_like "unauthorized http request" do
        let(:action) { get :index }
      end
    end
  end
end
