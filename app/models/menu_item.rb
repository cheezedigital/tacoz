class MenuItem < ActiveRecord::Base
  mount_uploader :picture, MenuItemPictureUploader

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def self.vegetarian
    where(vegetarian: true)
  end
end
