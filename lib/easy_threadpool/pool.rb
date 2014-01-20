require "thread"
module EasyThreadpool
  class Pool
    
    # Creating a new ThreadPool of size equal to @size
    # It defines how many threads we will have
    # spawned internally.
    def initialize(size = 10)
      # Pool size
      @size  = size
      # Queue holds tasks
      @queue = Queue.new
      # Threads are created
      @pool = Array.new(size) { |i| worker i}

      @consumed = 0
    end

    # It schedules a job.
    # The block of code will be executed once a thread is available
    def process(*args, &block)
      @queue << [block, args]
    end

    # Graceful shutdown
    # Always call pool.shutdow to ensure all of your enqueud
    # task are executed
    def shutdown
      1.upto(@size) {|i| @queue << [:EXIT]}
      @pool.map(&:join)
    end

    # Force shutdown
    def shutdown!
      @pool.map(&:exit)
    end

    def task_consumed
      @consumed
    end

    def size
      @size
    end

    private
      # It creates a task consumer
      # :EXIT is a special internal message to handle Graceful shutdown
      def worker id
        Thread.new do
          Thread.current[:id] = id
          while true do
            code, args = @queue.pop
            break if code == :EXIT
            @consumed += 1
            code.call(*args)
          end
        end
      end
  end
end