#!/usr/bin/env bash
. ./scripts/functions.sh

ask "What is your name?" name
askYN "So your name is ${name}" check

if [[ ${check} = "y" ]]
	then
		success "You answered Yes: ${check}"
	else
		error "You answered No: ${check}"
fi
