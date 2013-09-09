# encoding: utf-8

class ComprovanteUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  storage :file

  def default_url
    asset_path("fallback/" + [version_name, "pdf.png"].compact.join('_'))
  end

  def extension_white_list
    %w(doc docx pdf odt)
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
