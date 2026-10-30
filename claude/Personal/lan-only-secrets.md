# Personal boxes only (from ~/dotfiles/claude/Personal; install links it when EMPLOYER=Personal)

- **LAN-only secrets** (DB passwords in compose files, services on 0.0.0.0 inside the LAN): file a bead and keep going; don't escalate or block. Devon: "this is my home network, I control it ... don't worry about postgres secrets for now, file a bead". Exception: the UDM forwards 80/443 to Traefik on hades, so anything with a Traefik route is internet-exposed, not LAN-only. Never print secret values.
