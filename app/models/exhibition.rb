class Exhibition < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :pictures

  validates :title,
  presence: { message: "No puede estar vacío" },
  length: { in: 1..100, message: "debe tener entre 2 y 100caracteres" }
  validates :description,
  presence: { message: "No puede estar vacío" },
  length: { in: 1..1000, message: "debe tener entre 2 y 1000 caracteres" }
end
