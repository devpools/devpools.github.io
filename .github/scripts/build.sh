#!/usr/bin/env bash
# CI 빌드: 배포 위치에 맞춰 Hexo 의 url/root 를 덮어쓴 뒤 public/ 을 만든다.
#
#   SITE_URL   정식 사이트 주소 (예: https://www.devpools.kr 또는 https://www.devpools.kr/blog-test)
#   SUBPATH    그 아래 하위 경로 (미리보기일 때만, 예: pr-preview/pr-12)
#   NOINDEX    "true" 면 검색엔진 차단 메타 태그를 넣고 Google Analytics 를 끈다
set -euo pipefail

if [[ -z "${SITE_URL:-}" ]]; then
  echo "::error::저장소 변수 SITE_URL 이 없습니다 (Settings > Secrets and variables > Actions > Variables)" >&2
  exit 1
fi

url="${SITE_URL%/}"
if [[ -n "${SUBPATH:-}" ]]; then
  subpath="${SUBPATH#/}"
  url="${url}/${subpath%/}"
fi

# https://host/a/b -> /a/b/ ,  https://host -> /
path="$(printf '%s' "$url" | sed -E 's#^[a-zA-Z]+://[^/]+##')"
root="${path%/}/"

{
  echo "url: ${url}"
  echo "root: ${root}"
  if [[ "${NOINDEX:-}" == "true" ]]; then
    echo "theme_config:"
    echo "  plugins:"
    echo "    google_analytics:"
  fi
} > _config.ci.yml

echo "url=${url} root=${root} noindex=${NOINDEX:-false}"

# 글 날짜는 한국 시간으로 쓰여 있다. UTC 로 빌드하면 자정 무렵 글의 주소 날짜가 하루 밀린다
export TZ=Asia/Seoul

HEXO_NOINDEX="${NOINDEX:-}" npx hexo generate --config _config.yml,_config.ci.yml

# GitHub Pages 가 결과물을 Jekyll 로 다시 처리하지 않게 한다
touch public/.nojekyll
