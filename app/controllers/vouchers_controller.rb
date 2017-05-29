class VouchersController < ApplicationController
  before_action :set_voucher, only: [:show, :edit, :update, :destroy]
  
  # GET /vouchers
  # GET /vouchers.json
  def index
    @vouchers = Voucher.all.order(created_at: :desc)
  end

  # GET /vouchers/1
  # GET /vouchers/1.json
  def show
    respond_to do |format|
      format.html
      format.json
      format.pdf {render template: 'vouchers/print', pdf:'print'}
    end
  end

  # GET /vouchers/new
  def new
    @voucher = Voucher.new
  end

  def generate_voucher
     calculate_voucher
  end

  # GET /vouchers/1/edit
  def edit
  end

  # POST /vouchers
  # POST /vouchers.json
  def create
    @voucher = Voucher.new(voucher_params)

    respond_to do |format|
      if @voucher.save
        format.html { redirect_to @voucher, notice: 'Voucher was successfully created.' }
        format.json { render :show, status: :created, location: @voucher }
      else
        format.html { render :new }
        format.json { render json: @voucher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vouchers/1
  # PATCH/PUT /vouchers/1.json
  def update
    respond_to do |format|
      if @voucher.update(voucher_params)
        format.html { redirect_to @voucher, notice: 'Voucher was successfully updated.' }
        format.json { render :show, status: :ok, location: @voucher }
      else
        format.html { render :edit }
        format.json { render json: @voucher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vouchers/1
  # DELETE /vouchers/1.json
  def destroy
    @voucher.destroy
    respond_to do |format|
      format.html { redirect_to vouchers_url, notice: 'Voucher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voucher
      @voucher = Voucher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def voucher_params
      params.require(:voucher).permit(:user_id, :salary, :description)
    end

     def calculate_voucher
      info = Assistance.all
      info.each do |one|
      Voucher.create(user_id: one.user_id, salary: one.calculate(one), description: "para este mes" )
      end
    end
   
end
