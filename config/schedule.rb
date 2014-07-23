module Clockwork

  # run the report:email_stats rake task
  #everyday at 2am and email me stats
  every 1.day, at: '02.00' do
    rake 'report:email_stats'
  end

end
