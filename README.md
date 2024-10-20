# 📜 Scripts (may be needed) for you

This is the GUIDE for

* 🔵🪟 Using the bash script on Windows
*  <img src="https://upload.wikimedia.org/wikipedia/commons/9/93/Amazon_Web_Services_Logo.svg" width=20> <img src="https://upload.wikimedia.org/wikipedia/commons/9/9a/Visual_Studio_Code_1.35_icon.svg" width=20> Integrating popular tools with bash scripts
* ⚙️ Reducing repetitive tasks

## [<img src="https://git-scm.com/images/logos/downloads/Git-Icon-1788C.svg" width=16> Git](https://git-scm.com/)

Git integrates easily with bash, allowing efficient control of its resources. However, many developers are unfamiliar with Git’s internal structure, such as branch statuses, .git objects, and its limitations, making it hard to create effective scripts.

The scripts below remove local branches and tags that are not present on the remote. Before running, push your work or back it up using the git archive command.

Too many branches or tags can make switching or checking out cumbersome:

* `prune-local-branches.sh` - Removes local branches.
* `prune-merged-branches.sh` - Removes local branches that have been merged.
* `prune-tags-except-latest.sh` - Removes all local tags except the latest.

## <img src="https://upload.wikimedia.org/wikipedia/commons/9/93/Amazon_Web_Services_Logo.svg" width=20> AWS CLI Tools

AWS offers tools for building infrastructure, though they come with limited examples. Fortunately, AWS provides command-line tools that can easily integrate with IDEs and terminals.

### <img src="https://upload.wikimedia.org/wikipedia/commons/9/93/Amazon_Web_Services_Logo.svg" width=20> AWS CLI


### <img src="https://upload.wikimedia.org/wikipedia/commons/9/93/Amazon_Web_Services_Logo.svg" width=20> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Amazon_Lambda_architecture_logo.svg/422px-Amazon_Lambda_architecture_logo.svg.png?20211111143003" width=20> AWS SAM

## Appendix

### WSL2 and Git Bash

Today, setting up WSL2 makes development on Windows quite comfortable. However, situations can arise where:

You need to connect with PowerShell scripts for a project
Local development is essential
IDE settings are difficult to manage in WSL2
For such cases, running scripts directly on Windows may be unavoidable. Windows Terminal and tools like choco have improved the development environment, but Linux is still superior for development tasks. A compromise is using Git Bash, which brings Linux-like command capabilities to Windows with minimal setup.
