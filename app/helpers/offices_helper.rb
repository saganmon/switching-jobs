module OfficesHelper

  def converting_to_people(people)
    if people == 0
      "非公開"
    else
      "#{people.to_s(:delimited, delimiter: ',')}名"
    end
  end

  def converting_to_year(year)
    if year == 0
      "非公開"
    else
      "#{year.to_s}年"
    end
  end

  def converting_to_jpy(money)
    if money == 0
      "非公開"
    else
      "#{money.to_s(:delimited, delimiter: ',')}万円"
    end
  end

end
