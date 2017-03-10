# Swagger settings
# baseのcontrollerの指定、変換パスの設定
class Swagger::Docs::Config
  def self.base_api_controller; ActionController::Base end
  def self.transform_path(path, api_version); "apidocs/#{path}" end
end

# 出力JSON設定
Swagger::Docs::Config.register_apis({
  "v1" => {
    :api_extension_type => nil,
    :api_file_path => "public/apidocs/", # JSONが置かれるPATH
    :base_path => "/",
    :clean_directory => true,
    :formatting => :pretty,
    :camelize_model_properties => false,
    :controller_base_path => "",
    :attributes => {
      :info => {
        "title"       => "Free WiFi API",
        "description" => "FreeWiFi スポットを探すためのAPIです<br>
                          このアプリケーションは以下のサイト、コンテンツを利用して作られています。<br>
                          ・行者移動支援サービスに関するデータサイト( https://www.hokoukukan.go.jp/free_wifi.html )<br>
                          ・無料公衆無線ＬＡＮスポット( https://www.hokoukukan.go.jp/free_wifi.html )のデータを加工して利用",
        "license"     => "Apache 2.0",
        "licenseUrl"  => "http://www.apache.org/licenses/LICENSE-2.0.html"
      }
    }
  }
})

GrapeSwaggerRails.options.app_name    = "Free WiFi API"
# 基盤となるJSON
GrapeSwaggerRails.options.url         = "/apidocs/api-docs.json"
# こっちの`/`は置換されないのでこれでOK
GrapeSwaggerRails.options.app_url     = "/"
