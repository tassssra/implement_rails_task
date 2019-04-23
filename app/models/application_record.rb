class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  require 'csv' # csvファイルを使えるようにする
end
