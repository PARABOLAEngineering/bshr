 # bshr - Smart Script Runner

A bash utility that runs commands through configurable environments while maintaining a searchable cache of executed commands.

## Features

- **Named cache files**: Scripts are saved with descriptive names based on their content
- **Multi-interpreter support**: Python, Bash, and any custom interpreters you configure
- **Python environment management**: Automatic venv creation with system package control
- **Cache management**: List or clean up saved scripts
- **Configurable behavior**: Control script retention and interpreter settings

## Installation

1. Save the script to `~/bin/bshr`:
   ```bash
   mkdir -p ~/bin
   curl -o ~/bin/bshr https://gist.githubusercontent.com/raw/parabolaengineering/bshr.sh
   chmod +x ~/bin/bshr

Ensure ~/bin is in your PATH:
       bash
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc


Usage: 
bshr [OPTIONS] <command>
bshr <interpreter> <code>
bshr dump
bshr list

Options:
  --help, -h       Show help message
  --interpreter, -i Specify interpreter directly
  dump             Clean the cache directory
  list             Show saved scripts

Examples:
  bshr "echo 'Hello Bash!'"
  bshr python "import sys; print(sys.version)"
  bshr --interpreter=zsh "echo 'Running in Zsh'"
  bshr dump
  bshr list

Configuration
Edit ~/.config/bshr/config.toml to:
    • Toggle script saving (save_scripts)
    • Configure Python venv location (python_venv_path)
    • Control system package behavior (python_allow_break_system)
    • Add custom interpreters:
toml
[interpreters]
zsh = "/bin/zsh"
node = "/usr/bin/node"
ruby = "/usr/bin/ruby"
Cache Management
Scripts are saved in ~/.cache/bshr/ with names like:
python_import_sys_print_sys.version_123456789.sh
bash_echo_Hello_Bash_987654321.sh
Use bshr list to view saved scripts and bshr dump to clean the cache.
### Key Improvements:

1. **Named Cache Files**:
   - Files now include a sanitized version of the command (first 50 alphanumeric chars)
   - Format: `{interpreter}_{command_part}_{timestamp}.ext`
   - Example: `python_import_sys_print_sys.version_123456789.py`

2. **New `list` Command**:
   - Shows all saved scripts with their sizes
   - Helps identify which ones to keep or delete

3. **Better Sanitization**:
   - Removes special characters from filenames while keeping them readable
   - Preserves the essence of the command for identification

4. **Complete Documentation**:
   - Proper README with installation, usage, and configuration instructions
   - Clear examples for all major features

