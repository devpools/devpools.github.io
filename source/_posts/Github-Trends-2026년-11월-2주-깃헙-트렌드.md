---
title: '[Github Trends] 2026년 11월 2주 깃헙 트렌드'
date: 2026-11-11 18:00:00
categories:
  - GitHub-trend
tags:
  - github
  - trend
  - ai-agent
---

# GitHub Trends (11월 2주)

마지막으로 깃헙 트렌드 글을 올린 게 2018년 6월이었습니다. 그때 1위가 막 공개된 deno였고, 한 주에 8,792개의 스타를 받았다고 적어두었네요. 8년 만에 다시 트렌드 페이지를 열어봤습니다.

결론부터 말씀드리면, 14개 리파지토리 중에 AI 에이전트와 상관없는 것을 찾는 게 더 빨랐습니다. ( 두 개 정도 됩니다. ) 예전에는 JavaScript 프레임워크와 알고리즘 학습 자료가 번갈아 올라왔는데, 이번 주는 "에이전트에게 무엇을 쥐여줄 것인가"로 거의 통일되어 있습니다. 눈에 들어온 것 위주로 살펴보겠습니다.

![2026년 11월 2주 GitHub 주간 트렌딩 상위 4개 리파지토리](/images/2026/11/github-trends-w2-top4.png)

<!-- more -->

### [1. NVIDIA / auto-ontology](https://github.com/NVIDIA/auto-ontology)

이번 주 9,621개의 스타를 받은 Python 리파지토리입니다. 에이전트가 데이터베이스에 질의를 던지는 건 이제 흔한 일인데, 문제는 그 숫자가 맞느냐는 것입니다. README의 첫 문장이 인상적인데, 매출 지표를 빨리 답해줘도 숫자가 틀리면 아무 가치가 없다고 합니다.

그래서 데이터가 어디에 있고 무엇을 의미하는지를 온톨로지로 만들어두고, 에이전트가 만든 쿼리를 그 정의에 맞춰 검증한 뒤 근거와 함께 답을 돌려주는 구조입니다. 자연어를 SQL로 바꾸는 부분은 NVIDIA NIM을 사용합니다. Apache 2.0 라이선스이지만 외부 기여는 아직 받지 않는다고 적혀 있습니다. 올해 4월에 만들어진 리파지토리입니다.

### [2. vercel-labs / agent-desktop](https://github.com/vercel-labs/agent-desktop)

에이전트가 데스크톱 앱을 조작하게 해주는 Rust로 작성된 CLI입니다. 9,502개의 스타를 받았습니다. 보통 이런 도구는 화면을 캡처해서 좌표를 찍는 방식을 떠올리게 되는데, 이 도구는 스크린샷을 쓰지 않습니다. 운영체제의 접근성 트리를 읽어서 JSON으로 돌려주고, 화면의 각 요소마다 참조 ID를 붙여줍니다. 에이전트는 그 ID에 대고 클릭하거나 입력하고, 다시 화면을 읽어 결과를 확인합니다.

macOS, Windows, Linux를 모두 지원하고 `npm install -g agent-desktop`으로 설치합니다. 6위에 올라온 [agent-browser](https://github.com/vercel-labs/agent-browser)가 같은 곳에서 만든 브라우저 버전인데, 한 팀의 도구 두 개가 같은 주에 올라와 있네요.

### [5. max-sixty / worktrunk](https://github.com/max-sixty/worktrunk)

Git worktree를 관리해주는 CLI이고, 이것도 Rust입니다. 이번 주 2,093개의 스타를 받았습니다. 에이전트를 5개, 10개씩 동시에 돌리려면 각자 작업 디렉터리가 따로 있어야 서로의 변경을 밟지 않는데, git이 원래 제공하는 worktree가 딱 그 용도입니다.

다만 worktree 하나를 만들려면 브랜치 이름을 세 번 입력해야 한다는 것이 README의 불만입니다. ( `git worktree add -b feat ../repo.feat` 하고 `cd ../repo.feat` ) 이걸 `wt switch feat` 한 줄로 줄여줍니다. README에 있는 비교표를 보면 한번에 이해가 됩니다.

![worktrunk 명령과 기본 git 명령 비교표](/images/2026/11/github-trends-w2-worktrunk.png)

에이전트 때문에 만들어진 도구이지만, 에이전트를 쓰지 않아도 worktree를 자주 쓰는 분이라면 반가울 것 같습니다.

### [9. cloudflare / security-audit-skill](https://github.com/cloudflare/security-audit-skill)

10,967개의 스타를 받았습니다. 코딩 에이전트를 보안 감사자로 만들어주는 스킬인데, Cloudflare가 자사 취약점 탐지 시스템의 출발점이 된 스킬을 공개한 것이라고 합니다.

감사는 여섯 단계로 진행됩니다. 구조를 파악하고, 영역을 나눠 취약점을 찾고, 찾은 후보를 새 에이전트에게 넘겨 반박하게 합니다. 그 다음 결과를 정해진 형식으로 기록하고, 또 다른 에이전트가 기록을 검증한 뒤 보고서를 만듭니다. 찾는 에이전트와 검증하는 에이전트를 분리해둔 것이 눈에 띕니다. 에이전트가 "취약점을 찾았습니다"라고 자신 있게 말하는 것을 그대로 믿을 수 없다는 경험이 담겨 있는 것 같네요.

### [14. pingdotgg / t3code](https://github.com/pingdotgg/t3code)

순위는 맨 아래인데 이번 주에 받은 스타는 11,979개로 가장 많습니다. 리파지토리 설명란은 비어 있고, README에는 "에이전트 하네스 컨트롤 서피스"라고 적혀 있습니다. 설명만 봐서는 잘 이해가 안 됐는데, 내 컴퓨터에 설치된 Claude Code, Codex, Cursor 같은 에이전트들을 한 화면에서, 그리고 모바일 앱에서 조작하게 해주는 도구입니다.

README에 "그래서 뭘 팔려는 건데?"라는 항목이 있고 답이 "Nothing"인 것이 재미있습니다. MIT 라이선스입니다.

### 스킬, 스킬, 스킬

나머지를 훑어보면 유독 skills라는 단어가 자주 보입니다. [anthropics/skills](https://github.com/anthropics/skills)( 3위, 전체 스타 19만 개 )와 [mattpocock/skills](https://github.com/mattpocock/skills)( 8위, 전체 스타 32만 개 )가 나란히 올라와 있고, 7위 [Claude-Code-Game-Studios](https://github.com/Donchitos/Claude-Code-Game-Studios)는 에이전트 49개와 스킬 72개로 게임 스튜디오를 흉내 낸다고 합니다.

스킬이라는 게 대단한 것은 아니고, `SKILL.md` 파일 하나와 스크립트 몇 개가 들어 있는 폴더입니다. 예전에는 잘 만든 dotfiles를 공유했다면, 이제는 에이전트에게 일 시키는 방법을 폴더째로 공유하는 셈입니다. 개인이 올린 스킬 모음이 Anthropic 공식 리파지토리보다 스타가 많다는 것도 흥미롭네요.

### 에이전트가 아닌 것들

[D4Vinci/Scrapling](https://github.com/D4Vinci/Scrapling)은 Python 웹 스크래핑 프레임워크이고 7,291개의 스타를 받았습니다. [anomalyco/hex](https://github.com/anomalyco/hex)는 로컬에서 동작하는 음성 받아쓰기 도구이고 1,839개를 받았습니다. 이번 주 목록에서 에이전트라는 단어 없이 설명되는 건 이 둘 정도입니다.

### 8년 전과 비교해보면

이번 주에 받은 스타 수만 따로 모아서 그려봤습니다. 세로 선이 2018년 6월의 1위였던 deno입니다.

![이번 주 트렌딩 리파지토리별 주간 스타 수와 2018년 6월 1위 deno 비교](/images/2026/11/github-trends-w2-stars.png)

2018년에는 한 주에 8천 개를 받으면 압도적인 1위였는데, 이번 주는 그 선을 넘은 리파지토리가 여섯 개이고, 9천 개 이상만 세어도 다섯 개입니다. 깃헙을 쓰는 사람이 늘어난 것인지, 스타를 누르는 게 가벼워진 것인지는 잘 모르겠습니다. 다음 주에도 같은 얼굴들이 남아 있는지 확인해보면 조금 알 수 있을 것 같습니다.

끝.
