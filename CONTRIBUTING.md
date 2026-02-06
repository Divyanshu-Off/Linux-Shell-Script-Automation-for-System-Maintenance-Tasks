# Contributing to Linux Shell Script Automation for System Maintenance Tasks

Thank you for your interest in contributing to this project! We welcome contributions from the community to help improve and expand our collection of system maintenance automation scripts.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Getting Started](#getting-started)
- [Development Guidelines](#development-guidelines)
- [Submitting Changes](#submitting-changes)
- [Coding Standards](#coding-standards)
- [Testing](#testing)

## Code of Conduct

This project adheres to a code of conduct that all contributors are expected to follow. Please be respectful and constructive in all interactions.

## How Can I Contribute?

There are many ways to contribute to this project:

### Reporting Bugs

- Check if the bug has already been reported in the [Issues](https://github.com/Divyanshu-Off/Linux-Shell-Script-Automation-for-System-Maintenance-Tasks/issues) section
- If not, create a new issue with a clear title and description
- Include steps to reproduce the bug
- Provide information about your environment (OS version, bash version, etc.)
- Include relevant log outputs or error messages

### Suggesting Enhancements

- Check existing issues to see if the enhancement has been suggested
- Create a new issue describing the enhancement
- Explain why this enhancement would be useful
- Provide examples of how it would work

### Contributing Code

- Fix bugs or implement new features
- Improve existing scripts
- Add new automation scripts
- Improve documentation
- Write tests

## Getting Started

1. **Fork the repository** on GitHub

2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/YOUR-USERNAME/Linux-Shell-Script-Automation-for-System-Maintenance-Tasks.git
   cd Linux-Shell-Script-Automation-for-System-Maintenance-Tasks
   ```

3. **Create a new branch** for your changes:
   ```bash
   git checkout -b feature/your-feature-name
   # or
   git checkout -b fix/your-bug-fix
   ```

4. **Make your changes** following our coding standards

5. **Test your changes** thoroughly

6. **Commit your changes** with clear commit messages:
   ```bash
   git add .
   git commit -m "Add feature: description of your changes"
   ```

7. **Push to your fork**:
   ```bash
   git push origin feature/your-feature-name
   ```

8. **Create a Pull Request** on GitHub

## Development Guidelines

### Script Structure

All scripts should follow this basic structure:

```bash
#!/bin/bash

# Script Name: script_name.sh
# Description: Brief description of what the script does
# Author: Your Name
# Date: YYYY-MM-DD
# Version: 1.0

# Exit on error
set -e

# Function definitions
function function_name() {
    # Function code
}

# Main script logic
main() {
    # Main code
}

# Call main function
main "$@"
```

### File Naming Conventions

- Use lowercase with underscores: `script_name.sh`
- Use descriptive names that indicate the script's purpose
- Always use `.sh` extension for bash scripts

### Directory Structure

- Place all scripts in the `maintenance-scripts/` directory
- Add any configuration files to a `config/` directory if needed
- Place test scripts in a `tests/` directory

## Coding Standards

### Shell Script Best Practices

1. **Use shellcheck**: Run your scripts through [shellcheck](https://www.shellcheck.net/) before submitting
   ```bash
   shellcheck maintenance-scripts/your_script.sh
   ```

2. **Error Handling**: Always check return codes and handle errors gracefully
   ```bash
   if ! command; then
       echo "Error: command failed" >&2
       exit 1
   fi
   ```

3. **Variables**: Use uppercase for environment variables, lowercase for local variables
   ```bash
   LOG_FILE="/var/log/script.log"  # Environment/Global
   local_var="value"               # Local
   ```

4. **Quoting**: Always quote variables to prevent word splitting
   ```bash
   echo "${variable}"  # Good
   echo $variable      # Bad
   ```

5. **Functions**: Use functions to organize code and improve reusability

6. **Comments**: Add clear comments explaining complex logic

7. **Exit Codes**: Use appropriate exit codes (0 for success, non-zero for errors)

### Documentation

- Add a header comment block to each script explaining its purpose
- Document all functions with comments
- Include usage examples in comments
- Update README.md if adding new scripts or features

## Submitting Changes

### Pull Request Guidelines

1. **Title**: Use a clear, descriptive title
2. **Description**: Provide a detailed description of your changes
3. **Testing**: Describe how you tested your changes
4. **Screenshots**: Include screenshots if applicable (for output changes)
5. **Documentation**: Update documentation if needed
6. **Linked Issues**: Reference any related issues

### Pull Request Checklist

Before submitting, ensure:

- [ ] Code follows the project's coding standards
- [ ] Scripts pass shellcheck validation
- [ ] Changes have been tested on at least one Linux distribution
- [ ] Documentation has been updated
- [ ] Commit messages are clear and descriptive
- [ ] No unnecessary files are included
- [ ] All functions have proper error handling

## Testing

### Manual Testing

1. Test your script on a non-production system first
2. Test with different input scenarios
3. Verify error handling works correctly
4. Check for proper cleanup on exit
5. Test with different user permissions

### Test Environments

We recommend testing on:
- Ubuntu/Debian-based systems
- RHEL/CentOS-based systems
- Different versions of bash (4.0+)

## Questions?

If you have questions about contributing, please:
- Check existing issues and pull requests
- Open a new issue with your question
- Reach out through GitHub discussions

## Recognition

All contributors will be recognized in the project documentation. Thank you for helping improve this project!

---

**Note**: By contributing to this project, you agree that your contributions will be licensed under the MIT License.
