#!/bin/bash
iex --sname c -pa _build/dev/lib/ping_pong/ebin/ --cookie cookie --app ping_pong --erl "-config config/c"
