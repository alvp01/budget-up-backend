# frozen_string_literal: true

puts 'Seeding the budget to the database ...'

Budget.create!(budget_date: Date.today, planned_amount: 100, remaining_amount: 100)

puts 'Budget created.'

puts 'Seeding the categories to the database ...'

budget = Budget.first

["income", "fixed bills", "savings", "variable bills", "debt"].each do |category_string|
  category = Category.create!(category_type: category_string, budget_id: budget.id)
  budget.categories << category
  puts "created category #{category_string}"
end

puts "categories created"

