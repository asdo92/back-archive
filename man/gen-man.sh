#!/usr/bin/env zsh

setopt SH_WORD_SPLIT NO_NOMATCH BSD_ECHO

# Generate man files from markdown files
# Require: pandoc

# Variables
date_name="Aug 16, 2026"
date_number="2026-08-16"

# Generate man files
pandoc -s ../doc/back-archive.md -t man -o back-archive.1
sed -i "s/.TH \"\" \"\" \"\" \"\" \"\"/.TH \"back-archive\" \"1\" \"${date_name}\" \"${date_number}\" \"Create backup of files or directories\"/g" back-archive.1
sed -i "s/.TH \"\" \"\" \"\" \"\"/.TH \"back-archive\" \"1\" \"${date_name}\" \"Create backup of files or directories\"/g" back-archive.1
sed -i 's/Back to README.md/Manual/g' back-archive.1
sed -i 's/Go back/back-archive/g' back-archive.1
