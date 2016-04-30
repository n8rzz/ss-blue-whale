class ClientContactsController < ApplicationController
  before_action :set_client_contact, only: [:show, :update, :destroy]

  # GET /client_contacts
  def index
    @client_contacts = ClientContact.all

    render json: @client_contacts
  end

  # GET /client_contacts/1
  def show
    render json: @client_contact
  end

  # POST /client_contacts
  def create
    @client_contact = ClientContact.new(client_contact_params)

    if @client_contact.save
      render json: @client_contact, status: :created, location: @client_contact
    else
      render json: @client_contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /client_contacts/1
  def update
    if @client_contact.update(client_contact_params)
      render json: @client_contact
    else
      render json: @client_contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /client_contacts/1
  def destroy
    @client_contact.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_client_contact
    @client_contact = ClientContact.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def client_contact_params
    params.require(:client_contact).permit(:position, :name, :businessPhone, :mobilePhone, :email, :client_id)
  end
end
