#!/bin/bash
iex --sname b -pa _build/dev/lib/ping_pong/ebin/ --cookie cookie --app ping_pong --erl "-config config/b"
