# How to

Initialize and Unseal Vault: After starting the Vault service, you’ll need to initialize and unseal it. You can do this using the Vault CLI:

- docker ps
- docker exec -t [container-id-vault] sh

```bash
# Initialize Vault
vault operator init

# Unseal Vault (using the unseal keys provided in the initialization output)
vault operator unseal <unseal_key_1>
vault operator unseal <unseal_key_2>
vault operator unseal <unseal_key_3>

# Authenticate with the root token
vault login root
```
