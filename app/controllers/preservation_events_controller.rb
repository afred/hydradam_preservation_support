class PreservationEventsController < ApplicationController
  include Hydra::Catalog

  # Override rails path for the views by appending 'catalog' as a
  # place to look for views. This allows using default blacklight
  # views if you don't want to override each one.
  def _prefixes
    @_prefixes ||= super + ['catalog']
  end

 configure_blacklight do |config|
    config.search_builder_class = PreservationEventsSearchBuilder

    config.index.document_presenter_class = PreservationEventPresenter

    # TODO: Do not rely on dynamic suffixes here. Use Solrizer?
    config.index.title_field = :premis_event_type_tesim
  end
end
