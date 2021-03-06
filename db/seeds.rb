# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'csv'

puts "-------------------- start --------------------"
Spot.delete_all
CSV.foreach('jta_free_wifi.csv', :headers => true) do |row|
  Spot.create({name:       row['スポット名（日本語）'],
               en_name:    row['スポット名（英語）'],
               status:     row['スポットステータス'],
               category:   row['カテゴリー'],
               place:      row['利用可能場所'],
               postalcode: row['郵便番号'],
               prefecture: row['都道府県'],
               address:    row['住所（日本語）'],
               en_address: row['住所（英語）'],
               phone:      row['施設電話番号'],
               time:       row['施設営業時間'],
               ssid:       row['SSID名称'],
               limit:      row['利用時間・回数等'],
               procedure:  row['利用手続き'],
               language:   row['対応言語'],
               url:        row['ウェブサイトのURL'],
               latitude:   row['緯度'],
               longitude:  row['経度'],
               placecode:  row['場所情報コード']})
end
puts "-------------------- end --------------------"
