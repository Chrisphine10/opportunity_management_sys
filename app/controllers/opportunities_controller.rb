class OpportunitiesController < ApplicationController
  skip_before_action :authorize, only: %i[ show index all]
  before_action :get_account, except: %i[ all ]
  before_action :set_opportunity, only: %i[ show edit update destroy ]
  before_action :check_current_account, only: %i[ edit update destroy]
  #before_action :set_stage, only: %i[ show index ]
  # GET /opportunities or /opportunities.json
  def index
    @opportunities = @account.opportunities
  end
  def all
    @opportunities = Opportunity.all
  end
  # GET /opportunities/1 or /opportunities/1.json
  def show
  end

  # GET /opportunities/new
  def new
    @opportunity = @account.opportunities.build
  end

  # GET /opportunities/1/edit
  def edit
  end

  # POST /opportunities or /opportunities.json
  def create
    @opportunity = @account.opportunities.build(opportunity_params)

    respond_to do |format|
      if @opportunity.save
        format.html { redirect_to account_path(@account), notice: "Opportunity was successfully created." }
        format.json { render :show, status: :created, location: @opportunity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opportunities/1 or /opportunities/1.json
  def update
    respond_to do |format|
      if @opportunity.update(opportunity_params)
        format.html { redirect_to account_path(@account), notice: "Opportunity was successfully updated." }
        format.json { render :show, status: :ok, location: @opportunity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opportunities/1 or /opportunities/1.json
  def destroy
    @opportunity.destroy
    respond_to do |format|
      format.html { redirect_to account_path(@account), notice: "Opportunity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def get_account
      @account = Account.find(params[:account_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_opportunity
      @opportunity = @account.opportunities.find(params[:id])
    end
    def check_current_account
      if session[:user_id] != @account.user_id && User.find(session[:user_id]).role != "Admin"
        redirect_to account_path(@account), notice: "You are unauthorized to perform this action!"
      end
    end
    # Only allow a list of trusted parameters through.
    def opportunity_params
      params.require(:opportunity).permit(:name, :amount, :stage, :account_id)
    end
end
