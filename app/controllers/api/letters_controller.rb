class Api::LettersController < ApplicationController

  def  index
    @letter = params[:query]
    render json: @letter , serializer: LetterSerializer
  end
end