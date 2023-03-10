require "shrine"
require "shrine/storage/memory"
require "shrine/storage/file_system"

if Rails.env.test?
  Shrine.storages = {
    cache: Shrine::Storage::Memory.new,
    store: Shrine::Storage::Memory.new,
  }
else
  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new("public", prefix: "images/cache"), # temporary
    store: Shrine::Storage::FileSystem.new("public", prefix: "images"),       # permanent
  }
end

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file

Shrine.plugin :model

Shrine.plugin :validation
Shrine.plugin :validation_helpers
