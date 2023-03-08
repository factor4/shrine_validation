class PictureUploader < Shrine
  plugin :determine_mime_type, analyzer: :marcel
  Attacher.validate do
    # debugger
    #
    # New or existing record, by_admin: checked or not
    # In Rails 6.0 and 6.1 / Ruby 2.7 and 3.0
    # record -> #<Gallery:0x00007feb53a27628 id: [nil|1], name: "Test updated", file_data: "{\"id\":\"3ca4e2a220a631d8c0a0147dcdbadf32.svg\",...}", ...>
    # record.by_admin -> false # always false on new record.
    # record.by_admin -> true or false # at existing records depending on the attribute in the DB and not the assigned one through the form params.
    # I belive the params are not fully set at this point. :name is updated here but :by_admin not!???
    # Maybe it has to do with the order of the model attributes!?
    # Gallery.new.attributes => {"id"=>nil, "name"=>nil, "file_data"=>nil, "created_at"=>nil, "updated_at"=>nil, "by_admin"=>false}
    if record.by_admin?
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
