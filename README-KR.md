# 📜 Scripts (may be needed) for you

이 스크립트 가이드는 아래 목적으로 작성되었습니다.

* 🔵🪟 윈도우즈에서의 bash script 사용
*  <img src="https://upload.wikimedia.org/wikipedia/commons/9/93/Amazon_Web_Services_Logo.svg" width=20> <img src="https://upload.wikimedia.org/wikipedia/commons/9/9a/Visual_Studio_Code_1.35_icon.svg" width=20> 주요 유명한 툴들과의 연계 사용
* ⚙️ 반복되는 작업들 줄이기


## [<img src="https://git-scm.com/images/logos/downloads/Git-Icon-1788C.svg" width=16> Git](https://git-scm.com/)

git 은 POSIX 기반 tool 이라서인지 Bash script 와 Linux command 들과 통합해서 쓰기 참 좋습니다.

그리고 git 은 자신의 리소스를 스스로 검증/변형/탐색 등이 자유롭습니다.

문제는 개발자가 Linux 에 친숙하다는 것은 차치해도 git 운용에 있어서 자주 직면하는 문제들을 콕 집어 활용할 script 를 짜기 힘들다는 점입니다.

git 의 수많은 Command 들, .git object 들의 특징들과 여러 운용 한계점들을 고려하여 bash 와 연계가 이루기 쉽지 않습니다.

예시가 많이 없다는 것도, git 의 정수를 활용할 줄 아는 사람이 적다는 것도 큰 원인이죠.

아래 Script 들은 Remote 에 없는 local branch / tags 들을 정리합니다.

***실행하기 전에 필요하다면 `git push` 혹은 `git archive` 로 저장하세요***

When we would switch or checkout the branch, too many branches or tags are very annoying for selection.

* `prune-local-branches.sh` - It would remove the local branches.
* `prune-merged-branches.sh` - It would remove the local branches that status is gone.
* `prune-tags-except-latest.sh` - It would remove the local tags.

## <img src="https://upload.wikimedia.org/wikipedia/commons/9/93/Amazon_Web_Services_Logo.svg" width=20> AWS CLI Tools

Nowdays AWS has provided for constructing the infrastructure with unlocky no examples.

Fortunately AWS provided the command line tools to control their infra, it allows to integrate easily to IDE, including terminal.

### <img src="https://upload.wikimedia.org/wikipedia/commons/9/93/Amazon_Web_Services_Logo.svg" width=20> AWS CLI


### <img src="https://upload.wikimedia.org/wikipedia/commons/9/93/Amazon_Web_Services_Logo.svg" width=20> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Amazon_Lambda_architecture_logo.svg/422px-Amazon_Lambda_architecture_logo.svg.png?20211111143003" width=20> AWS SAM

## Appendix

### WSL2 와 Git Bash

오늘날에는 WSL2 를 설정해서 Windows 에서도 행복 개발이 어느정도 가능합니다.

하지만 하필

* Project 를 위해 Powershell script 연계를 해야만 한다던가
* local 개발이 주효해야만 한다던가
* IDE Setting 이 WSL2 에서 운용하기 까다로운 등

상기를 비롯한 수많은 이유로 WSL2 대신 Windows 에서 어쩔 수 없이 script 를 구동해야하는 비극이 일어나기도 합니다.

물론 Windows Terminal 도 Windows 계의 sugar, [choco](https://chocolatey.org/) 같은 빛이자 소금인 툴들의 등장으로 개발환경이 나아졌습니다.

그래도 개발이란 면에 있어선 죽었다 깨어나도 Linux 를 따라잡기엔 요원해서 타협점이 필요한데, 그게 바로 git bash 입니다.

Cygwin 같은 건 성능이 끔찍하고..

그렇다고 Powershell 을 이용하자니 생소하거나 배우는 게 귀찮고,

그래도 배우자니 장황한 Command 와 Option 들은 1200 page 를 가뿐히 넘기는 Windows API 를 방불케 해서 엄두도 못 냅니다.

이런 상황에서 msys2 기반의 git bash 는 설치할 떄 Next 버튼만 연타하면 linux command 를 그대로 사용할 수 있으니 그저 빛이라 할 수 있습니다.
