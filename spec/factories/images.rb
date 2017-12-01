FactoryBot.define do
  factory :image do
    photo(File.new(Rails.root + 'spec/fixtures/images/rails.png'))
    title('Logo')
    description('A beutiful Rails Logo')
    user_id(1)
  end
end
