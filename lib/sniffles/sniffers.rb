module Sniffles
  module Sniffers
    def self.use(response_body, name)
      file = Dir.glob("lib/sniffles/sniffers/**/#{name.to_s}.rb").first      
      class_name = get_sniffer_class(name.to_s)
      require File.expand_path(File.dirname(__FILE__) + "/../../#{file}")
      eval("Sniffles::Sniffers::#{class_name}.new(response_body).output")
    end
        
    def self.list_all(group = "**")
      Dir.glob("lib/sniffles/sniffers/#{group}/*.rb").collect do |sniffer|
        sniffer.match(/sniffers\/[a-z]+\/(.*)\.rb$/)[1].to_sym
      end
    end
    
    def self.list_groups
      Dir.glob("lib/sniffles/sniffers/**").collect { |group| group.match(/sniffers\/(.*)$/)[1].to_sym }
    end
    
    def self.list_all_by_group
      output = {}
      list_groups.each { |group| output[group] = list_all(group).to_a }
      output
    end
    
    def self.get_sniffer_class(name)
      name.gsub(/\/(.?)/) { "::#{ $1.upcase }" }.gsub(/(?:^|[_-])(.)/) { $1.upcase }
    end
  end
end