# The Fuck settings file
#
# The rules are defined as in the example bellow:
#
# rules = ['cd_parent', 'git_push', 'python_command', 'sudo']
#
# The default values are as follows. Uncomment and change to fit your needs.
# See https://github.com/nvbn/thefuck#settings for more information.
#

# rules = [<const: All rules enabled>]
# exclude_rules = []
wait_command = 10
require_confirmation = True
no_colors = False
debug = False
priority = {'sudo': 100, 'no_command': 9999}
history_limit = 1000
alter_history = True
# wait_slow_command = 15
# slow_commands = ['lein', 'react-native', 'gradle', './gradlew', 'vagrant']
# repeat = False
# instant_mode = False
num_close_matches = 5
# env = {'LC_ALL': 'C', 'LANG': 'C', 'GIT_TRACE': '1'}
# excluded_search_path_prefixes = []
