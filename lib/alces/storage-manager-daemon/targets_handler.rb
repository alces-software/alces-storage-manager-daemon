module Alces
  module StorageManagerDaemon
    class TargetsHandler < BlankSlate

      def self.global_targets
        @global_targets ||= {"STUB" => {    
          type: :remote,
          dir_spec: :home,
          address: "127.0.0.3:25268",
          ssl: true
        }
      }
      end

      def user_targets(username)
        {}
      end

      def targets_for(username)
        user_targets(username).merge(TargetsHandler::global_targets)
      end
    end
  end
end

Alces::StorageManagerDaemon::TargetsHandler.global_targets() # Initialise on startup (as root)