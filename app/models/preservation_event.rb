require 'rdf/vocab'

class PreservationEvent < ActiveFedora::Base
  type ::RDF::Vocab::PREMIS.Event
  property :premis_event_type, predicate: ::RDF::Vocab::PREMIS.hasEventType
  property :premis_event_related_object, predicate: ::RDF::Vocab::PREMIS.hasEventRelatedObject

  def self.premis_event_types
    @premis_event_types ||= begin
      {}.tap do |premis_event_types|
        [:cap, :com, :cre, :dea, :dec, :del, :der, :dig, :fix, :ing, :mes,
          :mig, :nor, :rep, :val, :vir].each do |type|
          premis_event_types[type] = ::RDF::Vocab::PremisEventType.send(type)
        end
      end
    end
  end
end
