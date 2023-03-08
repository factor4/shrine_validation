class Gallery < ApplicationRecord

  validates :name, presence: true
  validates :name, length: { minimum: 5 }, unless: :is_admin

  attr_accessor :by_admin

  include PictureUploader::Attachment(:file)

  private

  def is_admin
    # debugger
    #
    # In Rails 6.0 and 6.1
    # Existing and/or new record:
    # self -> #<Gallery:0x00007fcf57877840 id: 1, name: "Test", ...>
    # self.by_admin -> "0" or "1" depending on checkbox

    by_admin == '1'
  end

end
