class LetterSerializer < ActiveModel::Serializer
  attributes :current_date

  def current_date
    date = Time.now.strftime("%Y-%m-%d")
  end
end