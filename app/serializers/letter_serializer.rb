class LetterSerializer < ActiveModel::Serializer
  attributes :current_date, :letter_count

  def current_date
    date = Time.now.strftime("%Y-%m-%d")
  end

  def letter_count
    if (@instance_options[:queryy]).length==1
      "".count(@instance_options[:queryy])
    else
      "pass a  single letter"
    end
  end
end