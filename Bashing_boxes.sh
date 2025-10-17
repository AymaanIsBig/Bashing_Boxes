#!/usr/bin/env bash
# bashing_boxes.sh
# Menu-driven script managing a list of items

# Initialize array with 10 items
items=(
Pipe
Bubbles
Seatbelt
Bubble bath
Razor
Weeds
Peas
globe 
Crown
Watch
)

# Functions for menu options
print_list() {
  echo "Current list:"
  for i in "${!items[@]}"; do
    echo "$((i+1))) ${items[$i]}"
  done
}

print_item_at() {
  read -rp "Enter position: " pos
  if (( pos >= 1 && pos <= ${#items[@]} )); then
    echo "Item $pos: ${items[$((pos-1))]}"
  else
    echo "Invalid position."
  fi
}

add_item() {
  read -rp "Enter new item: " new
  items+=("$new")
  echo "Item added."
}

remove_last_item() {
  unset 'items[-1]'
  echo "Last item removed."
}

remove_item_at() {
  read -rp "Enter position to remove: " pos
  if (( pos >= 1 && pos <= ${#items[@]} )); then
    unset 'items[$((pos-1))]'
    items=("${items[@]}")
    echo "Item $pos removed."
  else
    echo "Invalid position."
  fi
}

exit_script() {
  echo "Goodbye!"
  exit 0
}

# Menu loop
while true; do
  echo "============================"
  echo "  BASHING BOXES MENU"
  echo "============================"
  echo "1) Print list"
  echo "2) Print item at position"
  echo "3) Add item"
  echo "4) Remove last item"
  echo "5) Remove item at position"
  echo "6) Exit"
  read -rp "Enter choice: " choice
  case $choice in
    1) print_list ;;
    2) print_item_at ;;
    3) add_item ;;
    4) remove_last_item ;;
    5) remove_item_at ;;
    6) exit_script ;;
    *) echo "Invalid choice." ;;
  esac
done
