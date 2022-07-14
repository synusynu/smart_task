# frozen_string_literal: true

class LogReader
  attr_reader :logfile_path

  def initialize(logfile_path)
    @logfile_path = logfile_path
  end

  def each_entry(&block)
    File.readlines(logfile_path).lazy.each do |line|
      url, ip_address = line.split
      block.call(url, ip_address)
    end
  end
end
