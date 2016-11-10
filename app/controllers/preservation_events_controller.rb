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
    config.add_index_field :premis_event_related_object_tesim
    config.add_index_field :system_create_dtsi
    config.add_index_field :premis_agent_tesim

    # config.add_facet_field :system_create_dtsi, date: true

    config.add_facet_field 'system_create_facetable_ltsi', label: 'Date', range: { segments: false }

    config.add_facet_fields_to_solr_request!
  end
end
