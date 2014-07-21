class FakeWorker
  include Sidekiq::Worker

  def perform  #the name of the method will always be called perform.
    puts "\n\nRunning a long task"
    sleep 30    #sleep is a ruby method, and puts app to sleep.
    puts "Almost done!!!"
    sleep 2
    puts "DONE!! ZOMG!\n\n"
  end
end
