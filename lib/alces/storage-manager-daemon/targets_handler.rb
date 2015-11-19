require 'yaml'

module Alces
  module StorageManagerDaemon
    class TargetsHandler < BlankSlate

      def self.global_targets
        globaldir = "/etc/xdg/clusterware/storage/"
        @global_targets ||= TargetsHandler::load_from_directory(globaldir)
      end

      def user_targets(username)
        userdir = ::Dir.home + "/.config/clusterware/storage/"
        TargetsHandler::load_from_directory(userdir)
      end

      def targets_for(username)
        user_targets(username).merge(TargetsHandler::global_targets)
      end
      
      private
      
      def self.load_from_directory(directory)
        targets = {}
        if ::Dir.exist?(directory)
          ::DaemonKit.logger.debug("Looking for targets in " + directory)
          ::Dir.glob(directory + "*.target.yml") { |targetFile| 
            ::DaemonKit.logger.debug("Found " + targetFile)
            target = ::YAML.load_file(targetFile)
            targets[target.delete("name")] = target
          }
          ::DaemonKit.logger.debug("Found targets: " + targets.inspect)
        end
        targets
      end
      
    end
  end
end

Alces::StorageManagerDaemon::TargetsHandler.global_targets() # Initialise on startup (as root)
