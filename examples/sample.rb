lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "easy_threadpool"
require "open-uri"
require "logger"

@logger = Logger.new(STDOUT)

def download(url)
  open(url).read
  @logger.info "Url #{url} fetched by worker ##{Thread.current[:id]}"
end

pool = Thread.pool(10)
urls = []
open("https://rubygems.org/gems?letter=A").read.scan(/a href="(\/gems\/.*)"/) { |match| urls << "https://rubygems.org#{match.first}"}
urls.each do |u|
  pool.process u do |url|
    download url
  end
end
pool.shutdown
@logger.info "Consumed #{pool.task_consumed} tasks by #{pool.size} workers"
