#!/usr/bin/env bash
# Illustrative demo of the `debrief` skill — representative example output,
# rendered by assets/demo.tape via VHS. Not a transcript of a single live run.
set -u

ESC=$'\033'
RESET="${ESC}[0m"; BOLD="${ESC}[1m"; DIM="${ESC}[2m"
ORANGE="${ESC}[38;5;215m"; GREEN="${ESC}[38;5;150m"
GREY="${ESC}[38;5;245m"; WHITE="${ESC}[38;5;231m"

type_out() { local s="$1" i; for (( i=0; i<${#s}; i++ )); do printf '%s' "${s:$i:1}"; sleep 0.03; done; }
line() { printf '%b\n' "$1"; sleep 0.32; }

clear
sleep 0.4
printf "${GREY}~/payments-api · claude code${RESET}\n\n"
sleep 0.5

printf "${GREEN}>${RESET} ${WHITE}"
type_out "ok good session — what did we learn here?"
printf "${RESET}\n\n"
sleep 0.8

printf "${ORANGE}⏺ debrief${RESET}\n\n"
sleep 0.5

line "  One thing here is worth keeping. Forget the code we wrote"
line "  for a second — two goroutines were hitting that counter at"
line "  the same moment."
printf "\n"; sleep 0.2
line "  ${BOLD}Walk me through what actually goes wrong, step by step —${RESET}"
line "  ${BOLD}as if you were explaining it to someone who's never${RESET}"
line "  ${BOLD}seen a race condition.${RESET}"
printf "\n"; sleep 0.3
line "  ${DIM}(I'm not going to answer it for you yet. A rough attempt${RESET}"
line "  ${DIM} now beats a clean explanation handed to you — that's${RESET}"
line "  ${DIM} the part that actually sticks. I'll wait.)${RESET}"
sleep 1.3
printf "\n"
printf "  ${GREY}— debrief makes you reconstruct it, not read a recap.${RESET}\n"
sleep 2.2
