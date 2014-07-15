class MenuItem < ActiveRecord::Base
  mount_uploader :picture, MenuItemPictureUploader
  has_many :ingredients

  # We need this for nested forms. This saves ingredients when we save a menu item.
  accepts_nested_attributes_for :ingredients

  after_initialize do
    if ingredients.empty?
      ingredients.build
    end
  end


  def to_param
    "#{id}-#{name.parameterize}"
  end

  def self.vegetarian
    where(vegetarian: true)
  end
end
