module RailsSettings
  class ScopedSettings < Settings
    def self.for_thing(object)
      @object = object
      self
    end

    def self.thing_scoped
      Setting.unscoped.where(["(thing_type = ? AND thing_id = ?) OR (thing_type is null AND thing_id is null)", @object.class.base_class.to_s, @object.id]).order("thing_type asc")
    end

    def self.scoped_for_new
      Setting.unscoped.where(:thing_type => @object.class.base_class.to_s, :thing_id => @object.id)
    end

  end
end
