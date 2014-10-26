# require 'rails_helper'


# RSpec.describe AdoptionsController, :type => :controller do

#   # This should return the minimal set of attributes required to create a valid
#   # Adoption. As you add validations to Adoption, be sure to
#   # adjust the attributes here as well.
#   let(:valid_attributes) {
#     skip("Add a hash of attributes valid for your model")
#   }

#   let(:invalid_attributes) {
#     skip("Add a hash of attributes invalid for your model")
#   }

#   # This should return the minimal set of values that should be in the session
#   # in order to pass any filters (e.g. authentication) defined in
#   # AdoptionsController. Be sure to keep this updated too.
#   let(:valid_session) { {} }

#   describe "GET index" do
#     it "assigns all adoptions as @adoptions" do
#       adoption = Adoption.create! valid_attributes
#       get :index, {}, valid_session
#       expect(assigns(:adoptions)).to eq([adoption])
#     end
#   end

#   describe "GET show" do
#     it "assigns the requested adoption as @adoption" do
#       adoption = Adoption.create! valid_attributes
#       get :show, {:id => adoption.to_param}, valid_session
#       expect(assigns(:adoption)).to eq(adoption)
#     end
#   end

#   describe "GET new" do
#     it "assigns a new adoption as @adoption" do
#       get :new, {}, valid_session
#       expect(assigns(:adoption)).to be_a_new(Adoption)
#     end
#   end

#   describe "GET edit" do
#     it "assigns the requested adoption as @adoption" do
#       adoption = Adoption.create! valid_attributes
#       get :edit, {:id => adoption.to_param}, valid_session
#       expect(assigns(:adoption)).to eq(adoption)
#     end
#   end

#   describe "POST create" do
#     describe "with valid params" do
#       it "creates a new Adoption" do
#         expect {
#           post :create, {:adoption => valid_attributes}, valid_session
#         }.to change(Adoption, :count).by(1)
#       end

#       it "assigns a newly created adoption as @adoption" do
#         post :create, {:adoption => valid_attributes}, valid_session
#         expect(assigns(:adoption)).to be_a(Adoption)
#         expect(assigns(:adoption)).to be_persisted
#       end

#       it "redirects to the created adoption" do
#         post :create, {:adoption => valid_attributes}, valid_session
#         expect(response).to redirect_to(Adoption.last)
#       end
#     end

#     describe "with invalid params" do
#       it "assigns a newly created but unsaved adoption as @adoption" do
#         post :create, {:adoption => invalid_attributes}, valid_session
#         expect(assigns(:adoption)).to be_a_new(Adoption)
#       end

#       it "re-renders the 'new' template" do
#         post :create, {:adoption => invalid_attributes}, valid_session
#         expect(response).to render_template("new")
#       end
#     end
#   end

#   describe "PUT update" do
#     describe "with valid params" do
#       let(:new_attributes) {
#         skip("Add a hash of attributes valid for your model")
#       }

#       it "updates the requested adoption" do
#         adoption = Adoption.create! valid_attributes
#         put :update, {:id => adoption.to_param, :adoption => new_attributes}, valid_session
#         adoption.reload
#         skip("Add assertions for updated state")
#       end

#       it "assigns the requested adoption as @adoption" do
#         adoption = Adoption.create! valid_attributes
#         put :update, {:id => adoption.to_param, :adoption => valid_attributes}, valid_session
#         expect(assigns(:adoption)).to eq(adoption)
#       end

#       it "redirects to the adoption" do
#         adoption = Adoption.create! valid_attributes
#         put :update, {:id => adoption.to_param, :adoption => valid_attributes}, valid_session
#         expect(response).to redirect_to(adoption)
#       end
#     end

#     describe "with invalid params" do
#       it "assigns the adoption as @adoption" do
#         adoption = Adoption.create! valid_attributes
#         put :update, {:id => adoption.to_param, :adoption => invalid_attributes}, valid_session
#         expect(assigns(:adoption)).to eq(adoption)
#       end

#       it "re-renders the 'edit' template" do
#         adoption = Adoption.create! valid_attributes
#         put :update, {:id => adoption.to_param, :adoption => invalid_attributes}, valid_session
#         expect(response).to render_template("edit")
#       end
#     end
#   end

#   describe "DELETE destroy" do
#     it "destroys the requested adoption" do
#       adoption = Adoption.create! valid_attributes
#       expect {
#         delete :destroy, {:id => adoption.to_param}, valid_session
#       }.to change(Adoption, :count).by(-1)
#     end

#     it "redirects to the adoptions list" do
#       adoption = Adoption.create! valid_attributes
#       delete :destroy, {:id => adoption.to_param}, valid_session
#       expect(response).to redirect_to(adoptions_url)
#     end
#   end

# end
