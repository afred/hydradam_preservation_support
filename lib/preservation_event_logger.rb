class PreservationEventLogger

  def self.log_preservation_event(opts={})
    PreservationEvent.new.tap do |pe|
      pe.premis_event_type += [PreservationEvent.premis_event_types[opts[:premis_event_type].to_sym]]
      pe.premis_event_related_object += [opts[:file_set]]
      # Assume opts[:premis_agent] is an email address, and make a 'mailto:' RDF::URI out of it.
      pe.premis_agent += [::RDF::URI.new("mailto:#{opts[:premis_agent]}")]
      pe.save!
    end
  end
end
