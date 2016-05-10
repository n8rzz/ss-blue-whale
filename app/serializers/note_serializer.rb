class NoteSerializer < ActiveModel::Serializer
  attributes :id, :content, :notable_id, :created_at
end
