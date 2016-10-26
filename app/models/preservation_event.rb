require 'rdf/vocab'

class PreservationEvent < ActiveFedora::Base
  type ::RDF::Vocab::PREMIS.Event
  property :premis_event_type, predicate: ::RDF::Vocab::PREMIS.hasEventType
end