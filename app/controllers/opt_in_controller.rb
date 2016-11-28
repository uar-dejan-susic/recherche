class OptInController < ApplicationController
  before_action :set_public
  before_action :check_link_and_load_option, only: [:index, :create]

  def index
  end

  def you_are_in
  end

  def expired
  end

  def create
    respond_to do |format|
      if @prospect.i_want!
        format.html { render :you_are_in, notice: 'You are successfully assigned.' }
        format.json { render :you_are_in, status: :ok, location: @prospect }
      else
        format.html { render :index }
        format.json { render json: @prospect.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_public
    @public = true;
  end

  def check_link_and_load_option
    @prospect = Prospect.find_by(access_token: params[:access_token])
    @option = @prospect.present? ? @prospect.option : nil
    raise ActionController::RoutingError.new('Not Found') if @prospect.nil?
    @prospect.i_might! unless @prospect.opted_in?
    redirect_to action: 'expired' if @prospect.opted_in? || @option.is_expired?
  end

  def person_params
    params.require(:person).permit(:access_token)
  end
end
