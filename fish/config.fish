# Non-interactive users (sshy, sync)
if not status --is-interactive
    exit # Skips the rest of this file, not exiting the shell
end

if test -z "$SSH_ENV"
    set -gx SSH_ENV "$HOME/.ssh/environment"
end

# Start ssh agent
# if not __ssh_agent_is_started
    # __ssh_agent_start
# end

# Some agnoster settings -> display user@host
set -g theme_display_user yes
set -g theme_hide_hostname no

# Some aliases/environment variables
eval (dircolors $HOME/.dir_colors/dircolors | head -n 1 | sed 's/^LS_COLORS=/set -x LS_COLORS /;s/;$//')
source $HOME/.config/fish/alias_vars.fish

function pycscope
    find . -path './venv' -prune -o -name '*.py*' -print > cscope.files
    cscope -bR
end

# bass source /etc/profile.d/apps-bin-path.sh
