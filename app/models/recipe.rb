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
  validates_length_of :name, :within => 1..50
  validates_length_of :description, :within => 1..200


  def self.search(search)
    if search
      search_condition = "%" + search + "%"
      find(:all, :conditions => ['name ILIKE ? OR description ILIKE ? OR content ILIKE ?', search_condition, search_condition, search_condition], :order => "name")
    else
      scoped
    end
  end

  def self.cuisineSearch(search)
    if search
      find(:all, :conditions => {:cuisine_id => "#{search}"}, :order => "name")
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

