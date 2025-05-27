#!/bin/bash

TODO_FILE="$HOME/.todo.txt"

# Make sure the todo file exists
touch "$TODO_FILE"

show_help() {
  echo "Usage:"
  echo "  $0 add \"task description\""
  echo "  $0 list"
  echo "  $0 done <task number>"
  echo "  $0 remove <task number>"
}

add_task() {
  echo "[ ] $1" >> "$TODO_FILE"
  echo "Added: $1"
}

list_tasks() {
  echo "Your TODOs:"
  nl -w2 -s'. ' "$TODO_FILE"
}

mark_done() {
  sed -i "${1}s/\[ \]/[x]/" "$TODO_FILE"
  echo "Marked task $1 as done."
}

remove_task() {
  sed -i "${1}d" "$TODO_FILE"
  echo "Removed task $1."
}

# Main logic
case "$1" in
  add)
    shift
    add_task "$*"
    ;;
  list)
    list_tasks
    ;;
  done)
    mark_done "$2"
    ;;
  remove)
    remove_task "$2"
    ;;
  *)
    show_help
    ;;
esac
