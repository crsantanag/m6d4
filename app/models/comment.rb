class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :exhibition

  validates :user_id, presence: true
  validates :exhibition_id, presence: true

  validates :context,
  presence: { message: "No puede estar vacío" },
  length: { in: 1..1000, message: "debe tener entre 2 y 1000 caracteres" }
end
