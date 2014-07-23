desc "This is crap. Rake the leaves"
task leaves: :environment do
  puts "raking the leaves"
end

namespace :garden do

  desc 'Show our tools'
  task tools: :environments do
    puts ['rake', 'hoe', 'leaf blower']
  end

  desc 'Use a tool'
  task using: :environment do
    tool = ENV['TOOL'] || 'hose'
    puts "Using the #{tool}"
  end

end
