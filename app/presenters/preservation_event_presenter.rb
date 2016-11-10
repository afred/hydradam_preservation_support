class PreservationEventPresenter < Blacklight::IndexPresenter
  def label(field, opts = {})
    PreservationEventPresenter.premis_event_type_label(document.first(field))
  end

  def self.premis_event_type_label(premis_event_type_uri)
    shortened_field_val = URI(premis_event_type_uri).path.split('/').last
    # TODO: complete the list of premis event types: http://id.loc.gov/vocabulary/preservation/eventType.html
    labels = {
      'cap' => 'PREMIS Capture',
      'fix' => 'PREMIS Fixity Check',
      'ing' => 'PREMIS Ingest',
      'val' => 'PREMIS Validation'
    }
    labels[shortened_field_val] || 'unknown premis event type'
  end
end