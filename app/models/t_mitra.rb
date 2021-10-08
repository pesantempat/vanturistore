class TMitra < ApplicationRecord
  belongs_to :user
  has_many :loyalty_programs, dependent: :destroy
  has_many :loyalty_points

  def to_param
    [id, nama_mitra.parameterize].join("-")
  end
end
