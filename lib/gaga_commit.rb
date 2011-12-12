class GagaCommit
  
  def initialize(data)
    @data = data
  end
  
  def [](key)
    @data[key.to_s]
  end
  
  def committed_date
    @committed_date ||= Time.parse(@data['committed_date'])
  end
  
  def authored_date
    @authored_date ||= Time.parse(@data['authored_date'])
  end
  
  def to_hash
    @data
  end
  
  def method_missing(mthd, *args)
    @data[mthd.to_s]
  end
end