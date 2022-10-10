class Api::V1::ValidationCodesController < ApplicationController
  def create
    if ValidationCode.exists?(email: params[:email],kind: 'sign_in', created_at: 60.seconds.ago..Time.now)
      render json: { message: "验证码发送过于频繁，请稍后再试" }, status: 429
      return
    end
    validation_code = ValidationCode.new email: params[:email], kind: "sign_in"
    if validation_code.save
      render json: { message: "验证码已发送" }, status: 201
    else
      render json: { message: validation_code.errors }, status: 422
    end
  end
end
