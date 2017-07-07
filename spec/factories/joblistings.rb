FactoryGirl.define do
  factory :joblisting do
    type ""
    description "MyText"
    fixture "MyString"
    num_fixture 1
    housing "MyString"
    job_address "MyText"
    user nil
    provider nil
    status 1
    date "MyString"
    time "MyString"
  end
end
