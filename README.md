# Ejemplo de una aplicación OTP tolerante a fallos mediante multiples VMs usando Failover/Takeover

La aplicación define un [`PingPongServer`](https://github.com/arquitecturas-concurrentes/iasc-distribution-elixir/tree/master/ping_pong): un actor al cual si le envía el mensaje `ping` responde `pong`. 

Prestar atención a los siguientes elementos: 

* Aplicaciones
* Workers - GenServer en este caso
* Supervisores
* Alias locales y globales

## Levantando una sóla VM

```bash
iex -S mix
```

## Levantando múltiples VMs


```bash
iex --sname foo -S mix
```

Luego se pueden utilizar las siguientes herramientas para hacer comunicación entre VMs:

* `Node.spawn`
* `:rpc.call`

## Levantando solo un nodo

```bash
iex --sname pingpong -pa _build/dev/lib/ping_pong/ebin --app
```

## Levantando múltiples VMs

```bash
iex --sname a -pa _build/dev/lib/ping_pong/ebin/ --app ping_pong --erl "-config config/a"
iex --sname b -pa _build/dev/lib/ping_pong/ebin/ --app ping_pong --erl "-config config/b"
iex --sname c -pa _build/dev/lib/ping_pong/ebin/ --app ping_pong --erl "-config config/c"
```

Tener en cuenta que por lo definido en cada uno de los [archivos de configuración](https://github.com/arquitecturas-concurrentes/iasc-distribution-elixir/tree/master/ping_pong/config) y de la [documentacion de erlang](http://erlang.org/doc/design_principles/distributed_applications.html), la consola se va a quedar esperando hasta que las 3 VMs estén levantadas antes de empezar.

Probar matar una vm y ver que después el proceso renace en la siguiente de menor prioridad

---
**NOTA**

En los archivos de configuracion se va a describir donde estaran los distintos nodos que se describen de la siguiente manera <nombre de nodo>@<host>, donde el nombre del nodo en este ejemplo es el nodo a, b o c, y el host es nuestra maquina, identificado en linux con el nombre del equipo que tenemos. Podemos ver esto haciendo 

```
cat /etc/hostname
```

En windows se puede ver nuestro hostname por medio del comando del ipconfig

```
ipconfig /all
```
---

## Para levantar un nodo que solo observe a los otros que estan en esquema failover/takeover

```bash
iex --name observer@127.0.0.1 --cookie cookie
```

luego solo basta levantar el observer con :observer.start y vamos a poder ver todos los nodos