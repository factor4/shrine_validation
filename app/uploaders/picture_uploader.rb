class PictureUploader < Shrine
  plugin :determine_mime_type, analyzer: :marcel
  Attacher.validate do
    # debugger
    #
    # New or existing record, by_admin: checked or not
    # In Rails 6.0 and 6.1 / Ruby 2.7 and 3.0
    # record -> #<Gallery:0x00007feb53a27628 id: [nil|1], name: "Test", file_data: "{\"id\":\"3ca4e2a220a631d8c0a0147dcdbadf32.svg\",...}", ...>
    # record.by_admin -> nil # always
    # I belive the params are not fully set at this point. :name is but :by_admin not!???
    if record.by_admin == '1'
      validate_extension ['jpg','jpeg','svg']
      validate_mime_type ['image/jpeg','image/svg+xml']
    else
      validate_extension ['jpg','jpeg']
      validate_mime_type ['image/jpeg']
    end
  end

  require "image_processing/mini_magick"
  plugin :store_dimensions, analyzer: :mini_magick
end

