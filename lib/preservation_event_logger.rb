class PreservationEventLogger

  def self.log_preservation_event(opts={})
    pe = PreservationEvent.new.tap do |pe|
      pe.premis_event_type += [PreservationEvent.premis_event_types[opts[:premis_event_type].to_sym]]
      pe.premis_event_related_object += [opts[:file_set]]
    end
    pe.save!
  end
end
