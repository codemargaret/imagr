require 'rails_helper'

describe Image, 'validation' do
  it { should validate_presence_of :title }
  it { should validate_presence_of :user_id }
end

describe Image, 'association' do
  it { should belong_to :user }
  it { should have_many :comments }
  it { should have_many :favorites }
  it { should have_many :tags }
end

describe Image, 'column_specification' do
  it { should have_db_column(:title).of_type(:string) }
  it { should have_db_column(:description).of_type(:string) }
  it { should have_db_column(:user_id).of_type(:integer) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }
end
