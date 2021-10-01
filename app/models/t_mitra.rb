class TMitra < ApplicationRecord
  belongs_to :user
  has_many :loyalty_programs, dependent: :destroy

  def to_param
    [id, nama_mitra.parameterize].join("-")
  end
end
