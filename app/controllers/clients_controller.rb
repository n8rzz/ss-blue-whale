class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :update, :destroy]

  # GET /clients
  def index
    @clients = Client.all.order(name: :asc)

    render json: @clients, each_serializer: ClientPreviewSerializer
  end

  # GET /clients/1
  def show
    # using include here in order to include nested relationships via :project
    render json: @client, include: ['client_contacts',
                                    'projects',
                                    'projects.project_type',
                                    'projects.project_type.task_items',
                                    'notes']
  end

  # POST /clients
  def create
    @client = Client.new(client_params)

    if @client.save
      render json: @client, status: :created, location: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      render json: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def client_params
    params.require(:client).permit(:name, :address_1, :address_2,
                                   :city, :state, :zip, :fax, :phone,
                                   :email, :emailPrimary, :emailSecondary,
                                   :dbaName, :spouseName, :website, :entity,
                                   :joinDate, :status)
  end
end
