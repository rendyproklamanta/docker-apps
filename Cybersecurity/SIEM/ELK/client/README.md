# HOWTO

```sh
curl -u elastic:your_elastic_password -X POST "http://<ELK_SERVER_IP>:9200/_security/api_key" -H "Content-Type: application/json" -d '{
  "name": "filebeat_usr",
  "role_descriptors": {
    "filebeat_writer": {
      "cluster": ["monitor"],
      "index": [
        {
          "names": ["filebeat-*"],
          "privileges": ["create", "write", "view_index_metadata"]
        }
      ]
    }
  }
}'
```
