# class EmailValidator < ActiveModel::EachValidator
#   def validate_each(record, attribute, value)
#     record.errors[attribute] << (options[:message] || "is not an email") unless
#           value =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
#   end
# end
# 
# class FirstNameValidator < ActiveModel::EachValidator
#   def validate_each(record, attribute, value)
#     record.errors[attribute] << "Cannot be 'First Name'" unless value.downcase != "first name"
#   end
# end
# 
# class LastNameValidator < ActiveModel::EachValidator
#   def validate_each(record, attribute, value)
#     record.errors[attribute] << "Cannot be 'Last Name'" unless value.downcase != "last name"
#   end
# end


class Contact
  # include ActiveModel::Validations
  
  include MongoMapper::Document
    
  attr_accessor :email, :first_name, :last_name

  key :email, String
  # key :first_name, String
  # key :last_name, String
  
  
  validates_presence_of   :email
  validates_format_of     :email,
    :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
    :message => 'Check your email format?'
  validates_uniqueness_of :email, 
    :message => "is already on the list",
    :case_sensitive => false
    
  # validates :email, :presence => true, :email => true 
  # validates :first_name, :presence => true, :first_name => true 
  # validates :last_name, :presence => true, :last_name => true 
end



