## Floating Window Workflow Example

Courtesy of https://www.reddit.com/r/tmux/comments/itonec/comment/g5jxke4/

```bash
bind M-f if-shell -F '#{==:#{session_name},floating}' {
    detach-client
} {
    set -gF '@last_session_name' '#S'
    popup -d '#{pane_current_path}' -xC -yC -w70% -h70% -KER 'tmux new -A -s floating'
}

bind ! if-shell -F '#{!=:#{session_name},floating}' {
    break-pane
} {
    run-shell 'bash -c "tmux break-pane -s floating -t \"$(tmux show -gvq '@last_session_name'):\""'
}

bind @ if-shell -F '#{!=:#{session_name},floating}' {
    break-pane -d
} {
    run-shell 'bash -c "tmux break-pane -d -s floating -t \"$(tmux show -gvq '@last_session_name'):\""'
}
```

## Cool Tools
https://dev.to/lissy93/cli-tools-you-cant-live-without-57f6
