require "easy_threadpool/version"
require "easy_threadpool/pool"

# It adds a shortcut to the Thread class
# pool = Thread.pool(10)
class Thread
  def self.pool(size)
    EasyThreadpool::Pool.new size
  end
end