require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # config.generators.template_engine = :slim

    # アプリケーション、エンジン、レイルティに関するコンフィギュレーションはここにあります。
    #
    # これらの設定は特定の環境で上書きすることができます。
    # これらの設定は後で処理される config/environments にあるファイルを使って特定の環境で上書きすることができます。
    #
    # config.time_zone = "中部標準時(アメリカ・カナダ)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
