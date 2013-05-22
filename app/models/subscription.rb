class Subscription < ActiveRecord::Base
  validates_presence_of :device_registration_id
  validates_uniqueness_of :device_registration_id, scope: [:model_id, :model_type]
  
  belongs_to :model, :polymorphic => true
  belongs_to :device, :class_name => "Gcm::Device", :foreign_key => "gcm_devices_registration_id"
  attr_accessible :model_id, :model_type, :device_registration_id

end
