# PingPong

Para correr el código, primero de levantar las [3 VMs necesarias](https://github.com/arquitecturas-concurrentes/iasc-distribution-elixir#levantando-múltiples-vms-1), luego podemos probar que efectivamente funciona corriendo el siguiente código desde cualquiera de las VMs:

```
iex(me@computer-name)2> PingPong.ping
:pong
```

para más información visitar [elixir - Distributed tasks](https://elixir-lang.org/getting-started/mix-otp/distributed-tasks.html) [and configuration](https://hexdocs.pm/elixir/Application.html#module-the-application-environment).
