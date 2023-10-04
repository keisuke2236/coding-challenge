require "active_support/core_ext/integer/time"

Rails.application.configure do
  # ここで指定された設定は、config/application.rbで指定された設定よりも優先されます。

  # リクエスト間でコードが再読み込みされることはありません。
  config.cache_classes = true

  # 起動時にコードをイーガーにロードします。このイーガーローディングは、Rails の大部分と
  # アプリケーションをメモリ上にロードし、スレッド化されたウェブサーバと
  # スレッド化されたウェブサーバーとコピーオンライトに依存するウェブサーバーの両方がより良いパフォーマンスを発揮することができます。
  # Rakeタスクはパフォーマンスのためにこのオプションを自動的に無視します。
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # ENV["RAILS_MASTER_KEY"] のどちらかでマスターキーが利用可能になっていることを確認する。
  # または config/master.key でマスターキーが利用可能であることを確認します。この鍵はクレデンシャル(と他の暗号化されたファイル)を復号化するために利用されます。
  # config.require_master_key = true

  # デフォルトでは `/public` フォルダから静的ファイルを提供しないようにします。
  # ApacheまたはNGINXが既にこれを処理しているためです。
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?

  # プリプロセッサーを使ってCSSを圧縮する。
  # config.assets.css_compressor = :sass

  # プリコンパイルされたアセットがない場合、アセットパイプラインにフォールバックしない。
  config.assets.compile = true

  # アセットサーバから画像、スタイルシート、JavaScriptを提供できるようにする。
  # config.asset_host = "http://assets.example.com"

  # プリコンパイルされたアセットがない場合、アセットパイプラインにフォールバックしない。
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # Apacheの場合
  # config.action_dispatch.x_sendfile_header = "X-Accel-Redirect" # NGINXの場合

  # アップロードされたファイルをローカルファイルシステムに保存します(オプションは config/storage.yml を参照)。
  config.active_storage.service = :local

  # メインプロセスやドメインの外にアクションケーブルをマウントする。
  # config.action_cable.mount_path = nil
  # config.action_cable.url = "wss://example.com/cable"
  # config.action_cable.allowed_request_origins = [ "http://example.com", /http:\/example.*/ ]。

  # アプリへのアクセスをすべてSSLで強制し、Strict-Transport-Securityを使用し、安全なCookieを使用します。
  # config.force_ssl = true

  # システムの運用に関する一般的で有用な情報を含めるが、あまり多くの情報をログに記録しないようにする。
  config.log_level = :info

  # Prepend all log lines with the following tags.
  config.log_tags = [ :request_id ]

  # 本番では別のキャッシュストアを使用します。
  # config.cache_store = :mem_cache_store

  # Active Job のために本物のキューイングバックエンドを使う（そして環境ごとにキューを分ける）。
  # config.active_job.queue_adapter = :resque
  # config.active_job.queue_name_prefix = "myapp_production" # config.active_job.queue_adapter = :resque

  config.action_mailer.perform_caching = false

  # 不正なメールアドレスを無視し, メール配送のエラーを発生させない.
  # これを true に設定し、メールサーバーを即時配信するように設定すると、配信エラーが発生します。
  # config.action_mailer.raise_delivery_errors = false

  # I18nのロケールフォールバックを有効にする (どのロケールでもフォールバックされるようにする) # config.
  # I18n のロケールフォールバックを有効にする (翻訳が見つからない場合、I18n.default_locale にフォールバックする)。
  config.i18n.fallbacks = true

  # Don't log any deprecations.
  config.active_support.report_deprecations = false

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # 分散セットアップには別のロガーを使用します。
  # require "syslog/logger"
  # config.logger = ActiveSupport::TaggedLogging.new(Syslog::Logger.new "app-name")

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false
end
