class Gallery < ApplicationRecord

  validates :name, presence: true
  validates :name, length: { minimum: 5 }, unless: :is_admin

  include PictureUploader::Attachment(:file)

  # def file=(attachment)
  #   # This sets the context[:by_admin] but is always false.
  #   # Looks like the params are also not fully set here.
  #   file_attacher.context[:by_admin] = is_admin
  #   super(attachment)
  # end

  private

  def is_admin
    # debugger
    #
    # In Rails 6.0 and 6.1 / Ruby 2.7 and 3.0
    # Existing or new record:
    # self -> #<Gallery:0x00007fcf57877840 id: [1|nil], name: "Test", ...>
    # self.by_admin -> true or false depending on checkbox params = expected behavior

    by_admin?
  end

end
