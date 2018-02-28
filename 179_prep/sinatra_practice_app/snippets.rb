require 'bcrypt'

class PasswordDigester
  def self.encrypt(password)
    BCrypt::Password.create(password)
  end

  def self.check?(password, encrypted_password)
    BCrypt::Password.new(encrypted_password) == password
  end
end

encrypted = PasswordDigester.encrypt('secret')
# $2a$10$s.iTSdgsakxGo7cJgWFMweYPR9Z0ejH6wGAWFR/ghSeHkSn/EzYu2

p PasswordDigester.check?('secret', encrypted)

p PasswordDigester.encrypt('benspassword')


=begin

- Validate supported file extension of document (.txt or .md).
- Add a "duplicate" button that creates a new document based on an old one.
- Extend the project with a user signup form.
- Add the ability to upload images to the CMS (which could be referenced within markdown files).
- Modify the CMS so that each *version* of a document is preserved as changes are made to it.

=end
