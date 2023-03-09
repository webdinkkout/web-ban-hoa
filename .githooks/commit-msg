#!/bin/sh

commit_msg_file=$1
commit_msg=$(cat $commit_msg_file)

if ! echo "$commit_msg" | grep -E "^(update|add|fix):.*$" >/dev/null 2>&1; then
  echo "ERROR: Commit message phai bat dau bang 'update:', 'add:' or 'fix:'" >&2
  exit 1
fi
