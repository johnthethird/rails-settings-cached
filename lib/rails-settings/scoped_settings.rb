module RailsSettings
  class ScopedSettings < Settings
    def self.for_thing(object)
      @object = object
      self
    end

    def self.thing_scoped
      Settings.where(["(thing_type = ? AND thing_id = ?) OR (thing_type is null AND thing_id is null)", @object.class.base_class.to_s, @object.id]).order("thing_type asc")
    end

    def self.scoped_for_new
      self.scoped_by_thing_type_and_thing_id(@object.class.base_class.to_s, @object.id)
    end

  end
end
