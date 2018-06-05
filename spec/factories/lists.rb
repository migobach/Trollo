FactoryBot.define do
  factory :list do
    sequence(:title) { |n| "Title#{n}"}
    priority 1
    board
  end
end

#how do I define how many? 
#how do I set a number range? (1..9)
