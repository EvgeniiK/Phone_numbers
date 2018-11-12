class PhoneNumbersController < ApplicationController
  def create
    n = CreatePhoneNumberService.new(number: params['number'])
    render json: n.perform ? n.result.to_s.insert(3,'-').insert(7, '-') : n.error_message, status: :ok
  end

  private

  def permitted_params
    params.permit(:number)
  end
end
