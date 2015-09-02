require_relative "deferred"

module Administrate
  module Field
    class Base
      def self.with_options(options = {})
        Deferred.new(self, options)
      end

      def initialize(attribute, data, page, options = {})
        @attribute = attribute
        @data = data
        @page = page
        @options = options
      end

      def self.permitted_attribute(attr)
        attr
      end

      def html_class
        field_name.dasherize
      end

      def name
        attribute.to_s
      end

      def to_partial_path
        "/fields/#{field_name}/#{page}"
      end

      attr_reader :attribute, :data, :page

      protected

      attr_reader :options

      def field_name
        self.class.to_s.split("::").last.underscore
      end
    end
  end
end
