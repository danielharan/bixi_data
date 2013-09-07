require 'test/unit'
require '../snapshot_file'

class SnapshotFileTest < Test::Unit::TestCase
  def setup
    @sf = SnapshotFile.new("../../BixiData2012August/01/2012_08_01__00_00_02.xml")
  end
  
  def test_retrieves_station_information
    s1 = @sf.stations["1"]
    assert_equal 0, s1["nb_bikes"]
    assert_equal 31, s1["nb_empty_docks"]
    
    s2 = @sf.stations["2"]
    assert_equal 10, s2["nb_bikes"]
    assert_equal 5, s2["nb_empty_docks"]
  end
end