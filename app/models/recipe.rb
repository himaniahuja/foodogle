class Recipe < ActiveRecord::Base


  belongs_to :cuisine
  has_many :ingredients, :dependent => :destroy
  accepts_nested_attributes_for :ingredients, :reject_if => lambda{|a| a[:ing_name].blank?}, :allow_destroy => true

  validates_associated :cuisine

  validates_presence_of :name
  validates_presence_of :cuisine_id
  validates_presence_of :description
  validates_presence_of :content

  validates_uniqueness_of :name, :message => "Already exists please use another name "
  validates_length_of :name, :within => 1..20
  validates_length_of :description, :within => 1..70




  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end

# == Schema Information
#
# Table name: recipes
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  image_url   :string(255)
#  cuisine_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#  content     :text
#

