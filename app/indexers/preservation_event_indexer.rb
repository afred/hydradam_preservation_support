class PreservationEventIndexer < ActiveFedora::IndexingService
  def generate_solr_document
    super.tap do |solr_doc|
      Solrizer.set_field(solr_doc,
                         'premis_event_type',
                         object.premis_event_type.first.id,
                         :stored_searchable)

      Solrizer.set_field(solr_doc,
                         'premis_event_related_object',
                         object.premis_event_related_object.first.id,
                         :stored_searchable)

      Solrizer.set_field(solr_doc,
                         'premis_agent',
                         object.premis_agent.first.id,
                         :stored_searchable)
    end
  end
end