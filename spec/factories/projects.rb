FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    description "A test project"
    due_on 1.week.from_now
    association :owner
    
    # note付き コールバックはtraitのみで使おう
    trait :with_note do
      after(:create) { |project| create_list(:note, 5, project: project) }
    end
    
    # 期限
    trait :due_yesterday do
      due_on 1.day.ago
    end
    trait :due_today do
      due_on Date.current.in_time_zone
    end
    trait :due_tomorrow do
      due_on 1.day.from_now
    end
  #factory :project_due_yesterday, class: Project do
  #  sequence(:name) { |n| "Project #{n}" }
  #  description "A test project"
  #  due_on 1.day.ago
  #  association :owner
  #end
  end
end
