class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @events = Event.all

    render json: @events
  end

  # GET /events/1
  def show
    render json: { error: "Couldn't find Event with 'id'=#{params[:id]}"}, status: "404" and return if @event.nil?
    render json: @event
  end

  # POST /events
  def create
    @event = Event.new(event_params)
    render json: { error: "Given event type is invalid"}, status: "400" and return if @event.event_type.present? && !@event.event_type.in?(Constant::EVENT_TYPES)

    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find_by(id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:event_type, :public, :repo_id, :actor_id)
    end
end
