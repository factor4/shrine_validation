class Gallery < ApplicationRecord

  validates :name, presence: true
  validates :name, length: { minimum: 5 }, unless: :is_admin

  include PictureUploader::Attachment(:file)

  private

  def is_admin
    # debugger
    #
    # In Rails 6.0 and 6.1
    # Existing and/or new record:
    # self -> #<Gallery:0x00007fcf57877840 id: 1, name: "Test", ...>
    # self.by_admin -> true or false depending on checkbox params

    by_admin?
  end

end
