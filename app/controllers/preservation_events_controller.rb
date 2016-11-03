class PreservationEventsController < ApplicationController
  include Hydra::Catalog


  # Override rails path for the views so that we can use
  # regular blacklight views from app/views/catalog
  def _prefixes
    @_prefixes ||= super + ['catalog']
  end
end
