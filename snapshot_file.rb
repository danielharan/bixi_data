require 'nokogiri'

class SnapshotFile
  attr_reader :stations
  
  def initialize(filename)
    @stations = Hash.new
    Nokogiri::XML(IO.read(filename)).xpath("//station").each do |s|
      @stations[s.xpath("id").text] = {"nb_bikes" => s.xpath("nbBikes").text.to_i, "nb_empty_docks" => s.xpath("nbEmptyDocks").text.to_i}
    end
  end
end