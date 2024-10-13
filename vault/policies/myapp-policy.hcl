# Read-only access to the secrets in the "xxx" path
path "secret/myapp/*" {
  capabilities = ["read", "list"]
}