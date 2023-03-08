class PictureUploader < Shrine
  plugin :determine_mime_type, analyzer: :marcel
  Attacher.validate do
    debugger
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

# Neuer Datensatz, by_admin: checked or not
# record -> #<Gallery:0x00007feb53a27628 id: nil, name: "Test New", file_data: "{\"id\":\"3ca4e2a220a631d8c0a0147dcdbadf32.svg\",\"storage\":\"cache\",\"metadata\":{\"filename\":\"test.svg\",\"size\":3124,\"mime_type\":\"image/svg+xml\",\"width\":72,\"height\":48}}", ...>
# record.by_admin -> nil # always
