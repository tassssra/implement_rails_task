class User < ApplicationRecord

  # インポート処理
  def self.import(path)

    # headers: true によって一行目にどんなデータがあるかのヘッダーがあることを教える
    CSV.foreach(path, headers: true) do |row|
      User.create(
              name: row["name"],
              age: row["age"],
              address: row["address"]
      )
    end
  end
end
