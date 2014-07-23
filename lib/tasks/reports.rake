namespace :report do

  desc 'Counts the number of Vegetarian Items'
  task vegetarian_count: :environment do
    count = MenuItem.where(vegetarian: true).count
    puts "We have #{count} vegetarian items"
  end

  desc 'Emails us stats on menu items'
  task email_stats: :environment do
    total = MenuItem.count
    veggie = MenuItem.where(vegetarian: true).count
    stats = {total: total, vegetarian: veggie}
    ContactMailer.send_report(stats).deliver
  end
end
