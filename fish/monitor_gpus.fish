function monitor_gpus
    tmux new-session -d -s gpus
    # The panes are 0 2 4 6
    #               1 3 5 7 
    # Create 4 horizontal panes
    tmux split-pane -h
    tmux split-pane -h
    tmux split-pane -h
    tmux select-layout even-horizontal
    tmux split-pane -v -t gpus:0.0
    tmux split-pane -v -t gpus:0.2
    tmux split-pane -v -t gpus:0.4
    tmux split-pane -v -t gpus:0.6

    tmux send-keys -t "gpus:0.0" 'ssh denali' Enter
    tmux send-keys -t "gpus:0.0" 'exec fish' Enter
    tmux send-keys -t "gpus:0.0" 'watch -n 5 py3smi' Enter

    tmux send-keys -t "gpus:0.2" 'ssh helicon' Enter
    tmux send-keys -t "gpus:0.2" 'exec fish' Enter
    tmux send-keys -t "gpus:0.2" 'watch -n 5 py3smi' Enter

    tmux send-keys -t "gpus:0.4" 'ssh etna' Enter
    tmux send-keys -t "gpus:0.4" 'exec fish' Enter
    tmux send-keys -t "gpus:0.4" 'watch -n 5 py3smi' Enter

    tmux send-keys -t "gpus:0.6" 'ssh ida' Enter
    tmux send-keys -t "gpus:0.6" 'exec fish' Enter
    tmux send-keys -t "gpus:0.6" 'watch -n 5 py3smi' Enter

    tmux send-keys -t "gpus:0.1" 'ssh kosie' Enter
    tmux send-keys -t "gpus:0.1" 'exec fish' Enter
    tmux send-keys -t "gpus:0.1" 'watch -n 5 py3smi' Enter

    tmux send-keys -t "gpus:0.3" 'ssh sugarloaf' Enter
    tmux send-keys -t "gpus:0.3" 'exec fish' Enter
    tmux send-keys -t "gpus:0.3" 'watch -n 5 py3smi' Enter
end
