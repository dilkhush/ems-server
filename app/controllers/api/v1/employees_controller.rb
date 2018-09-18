class API::V1::EmployeesController < API::V1::ApiV1Controller

  before_action :custom_authenticate_user!
  before_action :set_employee, only: [:show, :update, :destroy]
  # GET /users
  def index
    @employees = @current_user.employees
  end

  # GET /users/1
  def show
  end

  # POST /users
  def create
    @employee = Employee.new(employee_params)
    @employee.user_id = @current_user.id
    if @employee.save
      render json: :null, status: :created
    else
      render json: { errors: @employee.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /employees/1
  def update
    if @employee.update(employee_params)
      render json: :null
    else
      render json: { errors: @employee.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy
  end

  private
    def employee_params
      params.require(:employee).permit(:name, :email)
    end

    def set_employee
      @employee = Employee.find_by(id: params[:id])
      render json: { errors: ['Employee not found'] }, status: :not_found and return unless @employee
    end
end
