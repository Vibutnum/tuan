class ActiveRecord::Base
  class_attribute :manage_fields, :json_example

  # scope :active, -> { where(active: true) }
  # scope :published, -> { where(published: true) }

  def updated(options={})
    self.updatings.create(options)
  end

  def updated!(options={})
    self.updatings.create!(options)
  end
  
  def self.f(id)
    record = where(id: id)
    record = record.where(active: true) if record.first.try(:has_attribute?, :active?)
    record.first
  end

  def self.acquire(id)
    f(id)
  end
end