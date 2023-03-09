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
source $HOME/.config/fish/alias_vars_private.fish

function pycscope
    find . -path './venv' -prune -o -name '*.py*' -print > cscope.files
    cscope -bR
end


function start_agent
    echo "Initializing new SSH agent ..."
    ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
    echo "succeeded"
    chmod 600 $SSH_ENV
    . $SSH_ENV > /dev/null
    ssh-add ~/.ssh/id_rsa
end

function test_identities
    # Check if we have any identities loaded
    ssh-add -l | grep "The agent has no identities"
    if [ $status -eq 0 ]
        # Try add one
        ssh-add
        if [ $status -eq 2 ]
            # Start the agent if we fail
            echo "2"
            start_agent
        end
    end
end

# Sometimes might need to reset this if an old agent is lingering
if [ -n "$SSH_AGENT_PID" ]
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    end
else
    if [ -f $SSH_ENV ]
        . $SSH_ENV > /dev/null
    end
    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    else
        start_agent
    end
end

# bass source /etc/profile.d/apps-bin-path.sh
#
# status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source 
status --is-interactive; and pyenv virtualenv-init - | source 

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval /home/fergal/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
