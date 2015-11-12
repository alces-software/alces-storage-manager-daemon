# Moving this file to local_config.yml results in gems which are annotated as
# :local => true, being loaded from a git checkout at $ROOT/../ if such a
# checkout exists. Where $ROOT is either $RAILS_ROOT or $DAEMON_ROOT.
#
# It also has the standard effect of having the daemon run in development
# mode.
development: true

# Setting 'remote' to true will cause 'local' gems to be fetched from
# git.  Otherwise a local path for each gem will need to be configured
# within the bundler configuration with:
#
#    bundle config local.<gem name> <path to gem>
#
#  eg. bundle config local.devise_pam_authenticable $HOME/src/devise_pam_authenticable

remote: false
git_root: http://grover.alces-software.com/git
