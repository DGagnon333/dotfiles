# Ensure ~/.zshenv is sourced
if [ -f ~/.zshenv ]; then
  source ~/.zshenv
fi

# Homebrew environment (only if needed for login shells)
eval "$(/opt/homebrew/bin/brew shellenv)"

# Toolbox
export PATH="$PATH:/Users/derickgagnon/Library/Application Support/JetBrains/Toolbox/scripts"

# .NET Core SDK tools
export PATH="$PATH:/Users/derickgagnon/.dotnet/tools"

