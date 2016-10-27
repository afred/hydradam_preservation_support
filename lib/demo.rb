require_relative 'preservation_event_logger'

class Demo
  def self.clean_slate!
    delete_all_file_sets!
    delete_all_preservation_events!
    delete_all_hydra_access_controls!
  end

  def self.delete_all_file_sets!
    FileSet.all.each { |fs| fs.delete }
  end

  def self.delete_all_preservation_events!
    PreservationEvent.all.each { |pe| pe.delete }
  end

  def self.delete_all_hydra_access_controls!
    ::Hydra::AccessControl.all.each { |ac| ac.delete }
  end

  def self.new_file_set
    FileSet.new.tap do |fs|
      fs.apply_depositor_metadata(User.first)
      fs.save!
    end
  end

  def self.run!
    PreservationEventLogger.log_preservation_event(file_set: new_file_set, premis_event_type: 'fix')
  end
end
