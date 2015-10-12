ALIASFILE=${ALIASFILE:=~/.aliases}

# Create aliases file if not present
if ! [ -f "$ALIASFILE" ]
then
    # Create default aliases for saving and loading aliases
    alias sa="alias > \"$ALIASFILE\""
    alias la="source \"$ALIASFILE\""

    # Save all existing aliases
    alias > "$ALIASFILE"
fi

source "$ALIASFILE"
