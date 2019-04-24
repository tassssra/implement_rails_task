class User < ApplicationRecord

  # インポート処理
  def self.import(path)
    list = []
    # headers: true によって一行目にどんなデータがあるかのヘッダーがあることを教える
    CSV.foreach(path, headers: true) do |row|
      list << {
        name: row["name"],
        age: row["age"],
        address: row["address"]
      }
    end
    puts "インポート開始"
    User.create!(list) # !をつけることによりimportが失敗したらエラーが出る(つけないとimport失敗に気づけない)
    puts "インポートに成功しました"
  rescue ActiveModel::UnknownAttributeError => invalid # 上のself.importメソッドを対象に例外処理をする
    puts "インポートに失敗しました: #{invalid}"
  end
end
