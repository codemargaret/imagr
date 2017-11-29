require 'rails_helper'

describe Favorite, 'validation' do
  it { should validate_presence_of :image_id }
  it { should validate_presence_of :user_id }
end

describe Favorite, 'association' do
  it { should belong_to :user }
  it { should belong_to :image }
end

describe Favorite, 'column_specification' do
  it { should have_db_column(:image_id).of_type(:integer) }
  it { should have_db_column(:user_id).of_type(:integer) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }
end
