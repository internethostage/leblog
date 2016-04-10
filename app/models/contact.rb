class Contact < ActiveRecord::Base

#These 2 validations ensure that there is a value for email, name, subject and message, and that the email has valid format

VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
validates :email, format: VALID_EMAIL_REGEX

validates :email, :name, :subject, :message, presence: true

end
