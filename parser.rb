# frozen_string_literal: true

require_relative 'lib/webserver_log_parser'

WebserverLogParser.new(ARGV[0]).call
