#!/usr/bin/env bash
# Live driver for the captain's one-time agy turn-end hook opt-in.
#
# Every call below points HOME at a scratch directory, so the operator's real
# ~/.gemini is never read or written. FM_HOME/FM_CONFIG_OVERRIDE point at a
# scratch firstmate home, so the worktree's own config/ is never touched.
#
# Usage: drive-agy-consent.sh <repo-root> <evidence-dir>
set -u

ROOT=$1
EVID=$2
LAB=$(mktemp -d "${TMPDIR:-/tmp}/agy-consent-lab.XXXXXX") || exit 1
HOOK="$ROOT/bin/fm-agy-turnend-hook.sh"
BOOTSTRAP="$ROOT/bin/fm-bootstrap.sh"
FAILURES=0

say() { printf '\n=== %s ===\n' "$*"; }
step() { printf '\n--- %s\n' "$*"; }
verdict() {  # <ok|no> <label>
  if [ "$1" = ok ]; then
    printf 'PASS  %s\n' "$2"
  else
    printf 'FAIL  %s\n' "$2"
    FAILURES=$((FAILURES + 1))
  fi
}
check() {  # <condition-result> <label>
  if [ "$1" -eq 0 ]; then verdict ok "$2"; else verdict no "$2"; fi
}

# Parse the captain's store the way agy would: as JSON, not as text.
store_keys() { node -e 'const j=JSON.parse(require("node:fs").readFileSync(process.argv[1],"utf8"));console.log(Object.keys(j).sort().join(","))' "$1" 2>/dev/null; }
store_value() { node -e 'const j=JSON.parse(require("node:fs").readFileSync(process.argv[1],"utf8"));console.log(JSON.stringify(j[process.argv[2]]))' "$1" "$2" 2>/dev/null; }

FOREIGN='{"someone-elses-hook":{"Stop":[{"type":"command","command":"echo hi"}]}}'

# A scratch machine: an agy home holding the captain's own files, and a
# firstmate home holding the consent record.
new_lab() {  # <name>
  local d="$LAB/$1"
  rm -rf "$d"
  mkdir -p "$d/agyhome/.gemini/config" "$d/agyhome/.gemini/antigravity-cli/brain" "$d/fmhome/config" "$d/fmhome/state" "$d/fmhome/data"
  printf '%s\n' "$FOREIGN" >"$d/agyhome/.gemini/config/hooks.json"
  # agy's own settings, the file bin/fm-agy-trust.sh writes, living in the same
  # directory firstmate puts its hook script in.
  printf '%s\n' '{"trustedWorkspaces":["/some/project"]}' >"$d/agyhome/.gemini/antigravity-cli/settings.json"
  printf '%s\n' 'agy memory' >"$d/agyhome/.gemini/antigravity-cli/brain/notes.md"
  printf '%s' "$d"
}

install_as() {  # <lab-dir>  -> runs the real installer
  HOME="$1/agyhome" FM_HOME="$1/fmhome" FM_CONFIG_OVERRIDE="$1/fmhome/config" \
    "$HOOK" install 2>&1
}
remove_as() {  # <lab-dir>
  HOME="$1/agyhome" FM_HOME="$1/fmhome" FM_CONFIG_OVERRIDE="$1/fmhome/config" \
    "$HOOK" remove 2>&1
}

printf 'firstmate agy turn-end hook - captain opt-in, driven live\n'
printf 'date: %s\n' "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
printf 'repo: %s\n' "$ROOT"
printf 'head: %s\n' "$(git -C "$ROOT" rev-parse --short HEAD)"
printf 'scratch machine: %s\n' "$LAB"
printf 'real ~/.gemini/config/hooks.json present: %s\n' "$([ -e "$HOME/.gemini/config/hooks.json" ] && echo yes || echo no)"

# ---------------------------------------------------------------------------
say "S1  an unasked home refuses, asks once, and writes nothing"
D=$(new_lab unasked)
step "the captain's store before firstmate is asked"
cat "$D/agyhome/.gemini/config/hooks.json"
BEFORE=$(cat "$D/agyhome/.gemini/config/hooks.json")
step "fm-agy-turnend-hook.sh install   (no answer recorded)"
RC=0; OUT=$(install_as "$D") || RC=$?
printf '%s\n' "$OUT"
printf 'exit=%s\n' "$RC"
[ "$RC" -ne 0 ]; check $? "install refused rather than writing the captain's file"
case "$OUT" in *"ASK THE CAPTAIN ONCE"*) R=0 ;; *) R=1 ;; esac
check $R "the refusal carries the one-time ask"
case "$OUT" in *"$D/fmhome/config/agy-turnend-hook"*) R=0 ;; *) R=1 ;; esac
check $R "the refusal names where to record the answer"
case "$OUT" in *"hooks.json"*) R=0 ;; *) R=1 ;; esac
check $R "the refusal names the file that would be written"
step "the captain's store after the refusal"
cat "$D/agyhome/.gemini/config/hooks.json"
[ "$(cat "$D/agyhome/.gemini/config/hooks.json")" = "$BEFORE" ]; check $? "hooks.json is byte-identical"
[ ! -e "$D/agyhome/.gemini/antigravity-cli/fm-turn-end.sh" ]; check $? "no hook script was planted"
[ ! -e "$D/agyhome/.gemini/antigravity-cli/fm-turn-end.d" ]; check $? "no token registry was planted"

# ---------------------------------------------------------------------------
say "S2  the captain answers allow: one key added, everything else intact"
printf 'allow\n' >"$D/fmhome/config/agy-turnend-hook"
step "config/agy-turnend-hook now reads"
cat "$D/fmhome/config/agy-turnend-hook"
step "fm-agy-turnend-hook.sh install"
RC=0; OUT=$(install_as "$D") || RC=$?
printf '%s\n' "${OUT:-(no output)}"
printf 'exit=%s\n' "$RC"
[ "$RC" -eq 0 ]; check $? "the consented install succeeded"
case "$OUT" in *"ASK THE CAPTAIN ONCE"*) R=1 ;; *) R=0 ;; esac
check $R "a consented install does not ask"
step "the captain's store after the consented install"
node -e 'console.log(JSON.stringify(JSON.parse(require("node:fs").readFileSync(process.argv[1],"utf8")),null,2))' "$D/agyhome/.gemini/config/hooks.json"
[ "$(store_keys "$D/agyhome/.gemini/config/hooks.json")" = "firstmate-turn-end,someone-elses-hook" ]; check $? "exactly one key was added"
[ "$(store_value "$D/agyhome/.gemini/config/hooks.json" someone-elses-hook)" = '{"Stop":[{"type":"command","command":"echo hi"}]}' ]; check $? "the captain's own key is untouched"
step "what firstmate put beside it"
ls -la "$D/agyhome/.gemini/antigravity-cli/" | sed "s#$D#<lab>#g"
[ -x "$D/agyhome/.gemini/antigravity-cli/fm-turn-end.sh" ]; check $? "the hook script is installed and executable"
[ -d "$D/agyhome/.gemini/antigravity-cli/fm-turn-end.d" ]; check $? "the private token registry exists"

# ---------------------------------------------------------------------------
say "S3  a recorded answer is never asked about again"
step "a second spawn's install, same home"
RC=0; OUT=$(install_as "$D") || RC=$?
printf '%s\nexit=%s\n' "${OUT:-(silent)}" "$RC"
[ "$RC" -eq 0 ]; check $? "the repeat install is a quiet no-op"
case "$OUT" in *"ASK THE CAPTAIN ONCE"*) R=1 ;; *) R=0 ;; esac
check $R "the captain is not asked a second time"
D2=$(new_lab denied-quietly)
printf 'deny\n' >"$D2/fmhome/config/agy-turnend-hook"
step "a home whose captain already said deny"
RC=0; OUT=$(install_as "$D2") || RC=$?
printf '%s\nexit=%s\n' "$OUT" "$RC"
[ "$RC" -ne 0 ]; check $? "a recorded deny refuses the install"
case "$OUT" in *"ASK THE CAPTAIN ONCE"*) R=1 ;; *) R=0 ;; esac
check $R "a recorded deny is not re-asked either"
[ "$(store_keys "$D2/agyhome/.gemini/config/hooks.json")" = "someone-elses-hook" ]; check $? "a denied home's store is left alone"

# ---------------------------------------------------------------------------
say "S4  the captain changes his mind: deny takes the earlier write back"
printf 'deny\n' >"$D/fmhome/config/agy-turnend-hook"
step "config/agy-turnend-hook now reads"
cat "$D/fmhome/config/agy-turnend-hook"
step "the next install after the withdrawal"
RC=0; OUT=$(install_as "$D") || RC=$?
printf '%s\nexit=%s\n' "$OUT" "$RC"
[ "$RC" -ne 0 ]; check $? "the withdrawn consent still refuses the install"
case "$OUT" in *"has been removed"*) R=0 ;; *) R=1 ;; esac
check $R "the refusal says the earlier key was taken back"
step "the captain's store after the retraction"
node -e 'console.log(JSON.stringify(JSON.parse(require("node:fs").readFileSync(process.argv[1],"utf8")),null,2))' "$D/agyhome/.gemini/config/hooks.json"
[ "$(store_keys "$D/agyhome/.gemini/config/hooks.json")" = "someone-elses-hook" ]; check $? "firstmate's key is gone"
[ "$(store_value "$D/agyhome/.gemini/config/hooks.json" someone-elses-hook)" = '{"Stop":[{"type":"command","command":"echo hi"}]}' ]; check $? "the captain's own key survived the retraction"
step "what is left in agy's directory"
ls -la "$D/agyhome/.gemini/antigravity-cli/" | sed "s#$D#<lab>#g"
[ ! -e "$D/agyhome/.gemini/antigravity-cli/fm-turn-end.sh" ]; check $? "the hook script was withdrawn too"
[ ! -e "$D/agyhome/.gemini/antigravity-cli/fm-turn-end.d" ]; check $? "the empty token registry was withdrawn too"
[ -f "$D/agyhome/.gemini/antigravity-cli/settings.json" ]; check $? "agy's own settings.json is untouched"
[ -f "$D/agyhome/.gemini/antigravity-cli/brain/notes.md" ]; check $? "agy's own brain/ is untouched"

# ---------------------------------------------------------------------------
say "S5  a withdrawal never takes a live task's token, and never blames agy's files"
D3=$(new_lab live-token)
printf 'allow\n' >"$D3/fmhome/config/agy-turnend-hook"
install_as "$D3" >/dev/null 2>&1
printf 'turnend=/tmp/x\n' >"$D3/agyhome/.gemini/antigravity-cli/fm-turn-end.d/fm.aaaaaaaaaaaa"
step "a live crewmate's token sitting in the registry"
ls "$D3/agyhome/.gemini/antigravity-cli/fm-turn-end.d/"
step "fm-agy-turnend-hook.sh remove"
RC=0; OUT=$(remove_as "$D3") || RC=$?
printf '%s\nexit=%s\n' "$OUT" "$RC"
[ "$RC" -eq 0 ]; check $? "the withdrawal completed"
case "$OUT" in *"still holds live per-task tokens"*) R=0 ;; *) R=1 ;; esac
check $R "the operator is told the registry was left for a live task"
case "$OUT" in *"files firstmate did not write"*) R=1 ;; *) R=0 ;; esac
check $R "the withdrawal no longer blames agy's own directory"
[ -f "$D3/agyhome/.gemini/antigravity-cli/fm-turn-end.d/fm.aaaaaaaaaaaa" ]; check $? "the live token survived"
[ ! -e "$D3/agyhome/.gemini/antigravity-cli/fm-turn-end.sh" ]; check $? "the hook script was still taken back"
[ -f "$D3/agyhome/.gemini/antigravity-cli/settings.json" ]; check $? "agy's own settings.json survived"
[ "$(store_keys "$D3/agyhome/.gemini/config/hooks.json")" = "someone-elses-hook" ]; check $? "the key was still removed"

# ---------------------------------------------------------------------------
say "S6  an answer firstmate cannot read is never treated as yes"
for BAD in 'sometimes' 'ALLOW' 'yes' ''; do
  D4=$(new_lab "bad-$(printf '%s' "${BAD:-empty}" | tr -cd 'a-zA-Z')")
  printf '%s\n' "$BAD" >"$D4/fmhome/config/agy-turnend-hook"
  step "config/agy-turnend-hook holds '$BAD'"
  RC=0; OUT=$(install_as "$D4") || RC=$?
  printf '%s\nexit=%s\n' "$OUT" "$RC"
  [ "$RC" -ne 0 ]; check $? "'$BAD' did not authorise a write"
  [ "$(store_keys "$D4/agyhome/.gemini/config/hooks.json")" = "someone-elses-hook" ]; check $? "'$BAD' left the store alone"
done
step "a whitespace-padded allow is still a yes"
D5=$(new_lab padded)
printf '  allow  \n' >"$D5/fmhome/config/agy-turnend-hook"
RC=0; install_as "$D5" >/dev/null 2>&1 || RC=$?
printf 'exit=%s keys=%s\n' "$RC" "$(store_keys "$D5/agyhome/.gemini/config/hooks.json")"
[ "$RC" -eq 0 ]; check $? "'  allow  ' installs"
step "a consent file that is a symlink"
D6=$(new_lab symlink-consent)
printf 'allow\n' >"$LAB/elsewhere-allow"
ln -s "$LAB/elsewhere-allow" "$D6/fmhome/config/agy-turnend-hook"
RC=0; OUT=$(install_as "$D6") || RC=$?
printf '%s\nexit=%s\n' "$OUT" "$RC"
printf 'store keys=%s\n' "$(store_keys "$D6/agyhome/.gemini/config/hooks.json")"
step "a consent file that is a directory"
D7=$(new_lab dir-consent)
mkdir -p "$D7/fmhome/config/agy-turnend-hook"
RC=0; OUT=$(install_as "$D7") || RC=$?
printf '%s\nexit=%s\n' "$OUT" "$RC"
[ "$RC" -ne 0 ]; check $? "a directory in place of the answer refuses"
[ "$(store_keys "$D7/agyhome/.gemini/config/hooks.json")" = "someone-elses-hook" ]; check $? "a directory in place of the answer writes nothing"

# ---------------------------------------------------------------------------
say "S7  consent does not override the store guards"
step "a symlinked hooks.json, with consent recorded"
D8=$(new_lab symlink-store)
printf 'allow\n' >"$D8/fmhome/config/agy-turnend-hook"
rm -f "$D8/agyhome/.gemini/config/hooks.json"
printf '%s\n' "$FOREIGN" >"$LAB/dotfiles-hooks.json"
ln -s "$LAB/dotfiles-hooks.json" "$D8/agyhome/.gemini/config/hooks.json"
RC=0; OUT=$(install_as "$D8") || RC=$?
printf '%s\nexit=%s\n' "$OUT" "$RC"
[ "$RC" -ne 0 ]; check $? "a symlinked store is still refused under allow"
[ "$(store_keys "$LAB/dotfiles-hooks.json")" = "someone-elses-hook" ]; check $? "the symlink target was not written"
[ ! -e "$D8/agyhome/.gemini/antigravity-cli/fm-turn-end.sh" ]; check $? "the refused run left no hook script behind"
step "a hooks.json holding an array, with consent recorded"
D9=$(new_lab array-store)
printf 'allow\n' >"$D9/fmhome/config/agy-turnend-hook"
printf '%s\n' '[]' >"$D9/agyhome/.gemini/config/hooks.json"
RC=0; OUT=$(install_as "$D9") || RC=$?
printf '%s\nexit=%s\n' "$OUT" "$RC"
[ "$RC" -ne 0 ]; check $? "a non-object store is still refused under allow"
[ "$(cat "$D9/agyhome/.gemini/config/hooks.json")" = '[]' ]; check $? "the non-object store is unchanged"
[ ! -e "$D9/agyhome/.gemini/antigravity-cli/fm-turn-end.sh" ]; check $? "the refused run left no hook script behind"

# ---------------------------------------------------------------------------
say "S8  a recorded deny is honoured at session start, not only at the next spawn"
D10=$(new_lab bootstrap)
FAKEBIN="$LAB/fakebin"; mkdir -p "$FAKEBIN"
run_bootstrap() {
  PATH="$FAKEBIN:$PATH" HOME="$D10/agyhome" FM_HOME="$D10/fmhome" FM_ROOT_OVERRIDE="$D10/fmhome" \
    FM_BOOTSTRAP_NETWORK_PHASE=skip "$BOOTSTRAP" 2>&1
}
step "bootstrap with nothing recorded"
OUT=$(run_bootstrap)
printf '%s\n' "$OUT" | grep -i 'agy-turnend' || printf '(no agy-turnend line)\n'
case "$OUT" in *"agy-turnend-hook reads deny"*) R=1 ;; *) R=0 ;; esac
check $R "bootstrap says nothing about a consent nobody recorded"
step "the captain consents, the key goes in, then he withdraws"
printf 'allow\n' >"$D10/fmhome/config/agy-turnend-hook"
install_as "$D10" >/dev/null 2>&1
printf 'store keys after install=%s\n' "$(store_keys "$D10/agyhome/.gemini/config/hooks.json")"
printf 'allow\n' >"$D10/fmhome/config/agy-turnend-hook"
OUT=$(run_bootstrap)
case "$OUT" in *"agy-turnend-hook reads deny"*) R=1 ;; *) R=0 ;; esac
check $R "a standing allow is not retracted at session start"
printf 'deny\n' >"$D10/fmhome/config/agy-turnend-hook"
step "the next session start after the withdrawal"
OUT=$(run_bootstrap)
printf '%s\n' "$OUT" | grep -i 'agy-turnend' || printf '(no agy-turnend line)\n'
case "$OUT" in *"BOOTSTRAP_INFO: config/agy-turnend-hook reads deny - withdrew"*) R=0 ;; *) R=1 ;; esac
check $R "session start reports the completed withdrawal as a plain fact"
case "$OUT" in *"AGY_TURNEND_HOOK:"*) R=1 ;; *) R=0 ;; esac
check $R "a clean withdrawal does not travel under the actionable prefix"
printf 'store keys after session start=%s\n' "$(store_keys "$D10/agyhome/.gemini/config/hooks.json")"
[ "$(store_keys "$D10/agyhome/.gemini/config/hooks.json")" = "someone-elses-hook" ]; check $? "the key was withdrawn at session start"
[ ! -e "$D10/agyhome/.gemini/antigravity-cli/fm-turn-end.sh" ]; check $? "the hook script was withdrawn at session start"
step "the session start after that"
OUT=$(run_bootstrap)
case "$OUT" in *"agy-turnend-hook reads deny"*) R=1 ;; *) R=0 ;; esac
check $R "an already-clean store is not announced again"
step "a withdrawal that cannot complete (store replaced by a symlink)"
printf 'allow\n' >"$D10/fmhome/config/agy-turnend-hook"
install_as "$D10" >/dev/null 2>&1
printf 'deny\n' >"$D10/fmhome/config/agy-turnend-hook"
mv "$D10/agyhome/.gemini/config/hooks.json" "$LAB/moved-hooks.json"
ln -s "$LAB/moved-hooks.json" "$D10/agyhome/.gemini/config/hooks.json"
OUT=$(run_bootstrap)
printf '%s\n' "$OUT" | grep -i 'agy-turnend' || printf '(no agy-turnend line)\n'
case "$OUT" in *"AGY_TURNEND_HOOK: config/agy-turnend-hook reads deny but"*) R=0 ;; *) R=1 ;; esac
check $R "a failed withdrawal is raised under the actionable prefix"

# ---------------------------------------------------------------------------
say "S9  the answer stays on the machine it was given for"
step "the declared inheritable set vs the remote-transferable set"
ITEMS=$(cd "$ROOT" && bash -c '. bin/fm-config-inherit-lib.sh; printf "FM_INHERITABLE_CONFIG: %s\n" "$FM_INHERITABLE_CONFIG"; echo "--- fm_config_inherit_items (remote allowlist) ---"; fm_config_inherit_items')
printf '%s\n' "$ITEMS"
case "$ITEMS" in *"FM_INHERITABLE_CONFIG: "*agy-turnend-hook*) R=0 ;; *) R=1 ;; esac
check $R "the consent is declared inheritable for local convergence"
printf '%s\n' "$ITEMS" | sed -n '/remote allowlist/,$p' | grep -q 'agy-turnend-hook'; [ $? -ne 0 ]; check $? "the consent is excluded from the remote allowlist"
step "an unasked LOCAL secondmate is sent to the primary's file, not its own"
D11=$(new_lab secondmate)
mkdir -p "$D11/fmhome/mate/config"
printf '%s\n' 'alpha' >"$D11/fmhome/mate/.fm-secondmate-home"
printf 'schema=fm-secondmate-parent.v1\nroute=local\nparent_home=%s\n' "$D11/fmhome" >"$D11/fmhome/mate/.fm-secondmate-parent"
RC=0
OUT=$(HOME="$D11/agyhome" FM_HOME="$D11/fmhome/mate" FM_CONFIG_OVERRIDE="$D11/fmhome/mate/config" \
  "$HOOK" install 2>&1) || RC=$?
printf '%s\nexit=%s\n' "$OUT" "$RC"
case "$OUT" in *"$D11/fmhome/config/agy-turnend-hook"*) R=0 ;; *) R=1 ;; esac
check $R "the secondmate's refusal names the primary home's file"
case "$OUT" in *"primary firstmate home"*) R=0 ;; *) R=1 ;; esac
check $R "the refusal says which home that is"

# ---------------------------------------------------------------------------
say "S10  what the captain was told he was consenting to, run for real"
D12=$(new_lab firing)
printf 'allow\n' >"$D12/fmhome/config/agy-turnend-hook"
install_as "$D12" >/dev/null 2>&1
REG="$D12/agyhome/.gemini/antigravity-cli/fm-turn-end.d"
SCRIPT="$D12/agyhome/.gemini/antigravity-cli/fm-turn-end.sh"
step "the command agy will run, as registered in the captain's store"
store_value "$D12/agyhome/.gemini/config/hooks.json" firstmate-turn-end | sed "s#$D12#<lab>#g"
step "an agy session firstmate did NOT launch (no token in the environment)"
OUT=$(printf '{"event":"stop"}' | sh -c "'$SCRIPT' stop")
printf 'stdout=%s\n' "$OUT"
[ "$OUT" = '{"decision":"stop"}' ]; check $? "the hook answers agy and does nothing else"
step "a forged token naming a file outside the registry"
OUT=$(printf '{}' | FM_AGY_TURNEND_TOKEN='../../../../etc/passwd' sh -c "'$SCRIPT' stop")
printf 'stdout=%s\n' "$OUT"
[ "$OUT" = '{"decision":"stop"}' ]; check $? "a forged token cannot escape the registry"
step "a real firstmate crewmate's turn ending"
mkdir -p "$D12/fmhome/state"
TOKEN=fm.bbbbbbbbbbbb
{
  printf 'turnend=%s\n' "$D12/fmhome/state/task-1.turn-ended"
  printf 'busy_event=%s\n' "$ROOT/bin/fm-busy-event.sh"
  printf 'state=%s\n' "$D12/fmhome/state"
  printf 'id=%s\n' "task-1"
  printf 'gen=%s\n' "$("$ROOT/bin/fm-busy-event.sh" arm "$D12/fmhome/state" task-1)"
} >"$REG/$TOKEN"
printf 'turn-end marker before: %s\n' "$([ -e "$D12/fmhome/state/task-1.turn-ended" ] && echo present || echo absent)"
OUT=$(printf '{}' | FM_AGY_TURNEND_TOKEN="$TOKEN" sh -c "'$SCRIPT' stop")
printf 'stdout=%s\n' "$OUT"
printf 'turn-end marker after: %s\n' "$([ -e "$D12/fmhome/state/task-1.turn-ended" ] && echo present || echo absent)"
[ -e "$D12/fmhome/state/task-1.turn-ended" ]; check $? "firstmate's own turn-end marker was touched"
step "everything the firing wrote, and where"
find "$D12/fmhome/state" -newer "$REG/$TOKEN" -type f 2>/dev/null | sed "s#$D12#<lab>#g" | sort
find "$D12/agyhome" -name 'fm-*' -newermt '-1 minute' 2>/dev/null | sed "s#$D12#<lab>#g" | sort

# ---------------------------------------------------------------------------
say "RESULT"
printf 'real ~/.gemini/config/hooks.json present at end: %s\n' "$([ -e "$HOME/.gemini/config/hooks.json" ] && echo yes || echo no)"
printf 'real ~/.gemini/antigravity-cli/fm-turn-end.sh present at end: %s\n' "$([ -e "$HOME/.gemini/antigravity-cli/fm-turn-end.sh" ] && echo yes || echo no)"
printf 'checks failed: %s\n' "$FAILURES"
cp -R "$D/agyhome/.gemini/config/hooks.json" "$EVID/hooks-json-after-withdrawal.json" 2>/dev/null
rm -rf "$LAB"
[ "$FAILURES" -eq 0 ]
