# nginx-proxy

### Simple entry-point nginx proxy

This is a simple nginx proxy (configured as http only at the moment) that lets you proxy multiple single domains to your internal network hosts.

The only thing you need to set is a `PROXY_RULES` environment variable and you will be good to go.

Here's an example:

```
PROXY_RULES="app.local > localhost:9292"
```

This will proxy everything from http://localhost:9292 to http://app.local

From the same environment variable you can specify multiple mappings like:

```
PROXY_RULES="app.local > localhost:9292 | app2.local > localhost:9393"
```

The syntax is easy it's `server_name > target_host:port | server_name > target_host:port | ...`, and you can specify as many rules as you want.

Note:
- The container always listens to port 80, it is meant to be used as an entry-point proxy but feel free to fork and change this.
- Make sure not to specify the same `server_name` multiple times as the Nginx configuration will fail.

---

Credits:

404 page by free404.com

---

Enjoy!

@makevoid
