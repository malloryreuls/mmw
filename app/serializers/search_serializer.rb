class SearchSerializer < ActiveModel::Serializer
  attributes :id, :query, :created_at

  has_many :terms
end
