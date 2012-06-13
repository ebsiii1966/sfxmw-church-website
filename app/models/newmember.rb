class Newmember

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :familyName, :phone, :unlisted, 
                :street, :pobox, :city, :state, :zip,
                :maritalStatus,
                :dateOfMarriage, :placeOfMarriage,
                
                :contactName, :contactPhone, :contactRelationship,
                
                :p1fname, :p1mname, :p1maiden,
                :p1cell, :p1unlisted, :p1email,
                :p1dob, :p1religion, 
                :p1baptizedDate, :p1baptizedChurch, :p1baptizedCity,
                :p1confirmedDate, :p1confirmedChurch, :p1confirmedCity,
                :p1occupation, :p1placeOfEmployment, :p1workPhone,
                
                :p2fname, :p2mname, :p2maiden,
                :p2cell, :p2unlisted, :p2email,
                :p2dob, :p2religion, 
                :p2baptizedDate, :p2baptizedChurch, :p2baptizedCity,
                :p2confirmedDate, :p2confirmedChurch, :p2confirmedCity,
                :p2occupation, :p2placeOfEmployment, :p2workPhone,
                
                :c1name, :c1gender, :c1dob, 
                :c1baptizedDate, :c1baptizedChurch, :c1baptizedCity,
                :c1confirmedDate, :c1confirmedChurch, :c1confirmedCity,

                :c2name, :c2gender, :c2dob, 
                :c2baptizedDate, :c2baptizedChurch, :c2baptizedCity,
                :c2confirmedDate, :c2confirmedChurch, :c2confirmedCity,

                :c3name, :c3gender, :c3dob, 
                :c3baptizedDate, :c3baptizedChurch, :c3baptizedCity,
                :c3confirmedDate, :c3confirmedChurch, :c3confirmedCity,

                :c4name, :c4gender, :c4dob, 
                :c4baptizedDate, :c4baptizedChurch, :c4baptizedCity,
                :c4confirmedDate, :c4confirmedChurch, :c4confirmedCity

  validates :familyName, :presence => true
  validates :p1email, :p2email, :format => { :with => %r{.+@.+\..+} }, :allow_blank => true
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
  
  def get_to_address
    APP_CONFIG[:email_config][:newmember_address]
  end
    
end