#!/bin/bash
iex --sname a -pa _build/dev/lib/ping_pong/ebin/ --cookie cookie --app ping_pong --erl "-config config/a"
