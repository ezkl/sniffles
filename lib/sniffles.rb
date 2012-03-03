require 'nokogiri'

require 'sniffles/version'
require 'sniffles/sniffers'
require 'sniffles/utils'
require 'sniffles/html'
require 'sniffles/text'

module Sniffles  
  def self.sniff(response_body, *sniffers_or_groups)
    output = {}
    
    if sniffers_or_groups.empty?
      list_all.each do |sniffer|
        output[sniffer] = Sniffers.use(response_body, sniffer)
      end 
    else    
      sniffers_or_groups.each do |sniffer_or_group|
        if list_all.include?(sniffer_or_group)
          output[sniffer_or_group] = Sniffers.use(response_body, sniffer_or_group)
        elsif list_groups.include?(sniffer_or_group)
          list_all_by_group[sniffer_or_group].each do |sniffer|
            output[sniffer] = Sniffers.use(response_body, sniffer)
          end
        else
          raise UnknownSniffer, "#{sniffer_or_group} not found!"
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
  
  class UnknownSniffer < Exception;end
end
