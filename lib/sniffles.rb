require 'nokogiri'

require 'sniffles/version'
require 'sniffles/html'
require 'sniffles/text'
require 'sniffles/sniffers'

module Sniffles  
  def self.sniff(response_body, *args)
    output = {}
    
    if args.empty?
      list_all.each do |sniffer|
        output[sniffer] = Sniffers.use(response_body, sniffer)
      end 
    else    
      args.each do |arg|
        if sniffer?(arg)
          output[arg] = Sniffers.use(response_body, arg)
        elsif group?(arg)
          list_all_by_group[arg].each do |sniffer|
            output[sniffer] = Sniffers.use(response_body, sniffer)
          end
        else
          raise UnknownSniffer, "#{arg} not found!"
        end
      end
    end
    output
  end
  
  def self.list_all
    Sniffers.list_all
  end

  def self.list_groups
    Sniffers.list_groups
  end
  
  def self.list_all_by_group
    Sniffers.list_all_by_group
  end
  
  def self.group?(name)
    list_groups.include?(name)
  end
  
  def self.sniffer?(name)
    list_all.include?(name)
  end
  
  class UnknownSniffer < StandardError; end
end
