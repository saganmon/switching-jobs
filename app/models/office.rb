class Office < ApplicationRecord

  has_many :users
  has_many :conditions

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      office = find_by(id: row["id"]) || new
      # # CSVからデータを取得し、設定する
      office.attributes = row.to_hash.slice(*updatable_attributes)
      office.save
    end
  end

  private
  # 更新を許可するカラムを定義
  def self.updatable_attributes
    ["company_name", "overview", "ceo", "foundation", "poople", "area", "revenue", "address", "url"]
  end

end