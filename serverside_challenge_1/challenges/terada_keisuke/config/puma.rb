# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum; this matches the default thread size of Active Record.
#
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# Specifies the `worker_timeout` threshold that Puma will use to wait before
# terminating a worker in development environments.
#
worker_timeout 3600 if ENV.fetch("RAILS_ENV", "development") == "development"

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
#
port ENV.fetch("PORT") { 3000 }

# Specifies the `environment` that Puma will run in.
#
environment ENV.fetch("RAILS_ENV") { "development" }

# Specifies the `pidfile` that Puma will use.
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# クラスターモードで起動する `workers` の数を指定します。
# ワーカーはフォークされたウェブサーバプロセスです。スレッドとワーカーを一緒に使用する場合
# スレッドとワーカーを併用する場合、アプリケーションの並行処理は最大 `threads` * `workers` となる。
# Workers は JRuby や Windows では動作しません。
# ワーカーは JRuby や Windows では動作しません (どちらもプロセスをサポートしていません)。
#
# workers ENV.fetch("WEB_CONCURRENCY") { 2 }.

# `workers` の数を指定する場合は、`preload_app!` メソッドを使用します。
# このディレクティブは、アプリケーションをフォークする前に、まずアプリケーションを起動してコードを読み込むようにPumaに指示します。
# このディレクティブは、アプリケーションをフォークする前に、まずアプリケーションを起動してコードをロードするように Puma に指示します。これはコピーオンライトの利点を生かします。
# プロセスの挙動を利用するため、ワーカーが使用するメモリが少なくなります。
#
# preload_app!

# preload_app! # `bin/rails restart` コマンドで puma を再起動できるようにする。
plugin :tmp_restart
