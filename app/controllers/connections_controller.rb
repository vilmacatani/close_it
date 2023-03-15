class ConnectionsController < ApplicationController
  before_action :set_startup, only: %i[create]

  def create
    @connection = Connection.new(connection_params)
    @connection.receiver_id = @startup.user.id
    @connection.sender_id = current_user.id
    @connection.pending = true
    @connection.accepted = false

    if @connection.save
      redirect_to startup_path(@startup)
    else
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  def update
    @connection = Connection.find(params[:id])
    @connection.update(pending_params)
    @counter = params[:counter]

    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.text { render partial: "connections/confirmation", locals: { request: @connection, counter: @counter }, formats: [:html] }
    end
  end

  private

  def set_startup
    @startup = Startup.find(params[:startup_id])
  end

  def connection_params
    params.require(:connection).permit(:message)
  end

  def pending_params
    params.require(:connection).permit(:pending, :accepted, :counter)
  end
end
