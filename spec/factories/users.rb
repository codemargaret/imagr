FactoryBot.define do
  factory :user do
    username('user')
    email('user@user.com')
    password('password')
  end

  factory(:admin, class: User) do
    username('admin')
    email('admin@admin.com')
    password('password1')
    admin(true)
  end
end
