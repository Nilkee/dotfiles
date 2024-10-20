#!/bin/bash

USAGE=$(cat <<-END
Usage: tsesh <PATH>

Tmux session switcher, if a PATH argument is provided will either switch to or
start a new session named after the basename of that path and in that location.
If no PATH is provided a fzf window will be presented from common options.

OPTIONS:
    --popup [use if called from a tmux popup window, changes some fzf options]
END
)
POSITIONAL_ARGS=()
while (( "$#" )); do
    case "$1" in
        -h|--help)
            echo "$USAGE" && exit 1 ;;
        --popup)
            POPUP=true && shift ;;
        --) # end argument parsing
            shift && break ;;
        -*|--*=) # unsupported flags
            echo "Error: Unsupported flag $1" >&2 && exit 1 ;;
        *)
            POSITIONAL_ARGS+=("$1") # save positional arg
            shift ;;
    esac
done

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

# Selection using fzf ---
dir2name(){
    # Set of rules to transform directories into sesh_names
    name="$1"
    selected_name=$(basename "$name" | tr . _)
    echo "$selected_name"
}

selected=$1
sesh_name=$(basename $selected | tr . _)
if [[ -z $selected ]]; then
    exit 0
fi


# Session switching ---

# If tmux is not running at all
# if [[ -z $TMUX ]] && [[ -z $is_running ]]; then
#     tmux new-session -ds $sesh_name -c $selected
#     exit 0
# fi

# If tmux is running but does not have a session with that name
# create new session but dont attach
if ! tmux has-session -t=$sesh_name 2> /dev/null; then
    tmux new-session -ds $sesh_name -c $selected
fi

# if [[ $is_inside == true ]]; then
    # Switching from one session to another when already inside tmux
    tmux switch-client -t $sesh_name
# else
#     # If tmux is running, has a session with that name but we are not currently attached
#     tmux attach -t $sesh_name
# fi


