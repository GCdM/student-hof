class StudentSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :slug, :img_url, :github_username, :graduated
end
