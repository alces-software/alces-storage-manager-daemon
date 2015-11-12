#==============================================================================
# Copyright (C) 2007-2015 Stephen F. Norledge and Alces Software Ltd.
#
# This file/package is part of Alces Storage Manager Daemon.
#
# Alces Storage Manager is free software: you can redistribute it and/or
# modify it under the terms of the GNU Affero General Public License
# as published by the Free Software Foundation, either version 3 of
# the License, or (at your option) any later version.
#
# Alces Storage Manager is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this package.  If not, see <http://www.gnu.org/licenses/>.
#
# For more information on the Alces Storage Manager Daemon, please visit:
# https://github.com/alces-software/alces-storage-manager-daemon
#==============================================================================
$: << File.expand_path("../vendor/alces/lib", __FILE__)
require 'alces/ext/bundler/dsl_extensions'
extend Alces::Ext::Bundler::DslExtensions

source "http://rubygems.org"
ruby ENV['ALCES_RUBY_VERSION'] || '2.2.1'

##################################
# Application server
##################################
gem                   'daemon-kit'

##################################
# Alces utility gems
##################################
gem                  'alces-tools', '~> 0.10.3.a', :local => '0.10.3', source: 'http://gems.alces-software.com'

##################################
# Alces Stack
##################################
source 'http://gems.alces-software.com' do
  gem                       'arriba', '~>  0.5.0.a', :local => 'master'
end

##################################
# PAM
##################################
gem 				'rpam-ruby19'

##################################
# Testing
##################################
group :test do
  gem                  'simplecov'
end

##################################
# Development
##################################
group :development do
end

##################################
# Development and Testing
##################################
group :development, :test do
  gem                      'rspec'
  gem                       'rake'
end
