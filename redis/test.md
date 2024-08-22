# Test Redis Sentinel

To test Redis Sentinel using the command-line interface (CLI), you can follow these steps to ensure that your Sentinel setup is working correctly and managing your Redis instances properly. Here’s a guide to perform basic tests:

## 1. **Connect to Redis Sentinel**

First, connect to the Redis Sentinel instance using the `redis-cli` tool:

```bash
redis-cli -p 26379
```

Replace `26379` with the port where your Redis Sentinel is running, if different.

## 2. **Check Sentinel Status**

To verify that Sentinel is monitoring your master and slave correctly, run the following command:

```bash
SENTINEL masters
```

This command will return information about the master nodes that the Sentinel is monitoring, including their status, IP, port, and more.

You should see something like:

```plaintext
1) "name"
2) "mymaster"
3) "ip"
4) "192.168.x.x"
5) "port"
6) "6379"
7) "runid"
8) "someid"
9) "flags"
10) "master"
...
```

## 3. **Check Slave Information**

You can also check the status of the slaves associated with a specific master:

```bash
SENTINEL slaves mymaster
```

This will return a list of all slave instances that are replicating data from the master. You'll see details such as IP, port, status (`online` or `offline`), and lag.

## 4. **Force a Failover**

To test failover, you can manually trigger a failover process, where Sentinel promotes a slave to be the master. This is a good way to ensure that Sentinel handles the failover correctly.

**Note:** Do this in a test environment as it will promote a slave to master and possibly demote the current master.

```bash
SENTINEL failover mymaster
```

This command will initiate the failover process for the `mymaster` group. The Sentinel will elect a slave as the new master.

## 5. **Verify the New Master**

After forcing the failover, you can check which node is the new master by running:

```bash
SENTINEL get-master-addr-by-name mymaster
```

This command will return the IP and port of the current master. You should see that the previous slave has been promoted.

## 6. **Check Sentinel Status Again**

After the failover, check the status of the master and slaves again to ensure that the system is functioning correctly:

```bash
SENTINEL masters
SENTINEL slaves mymaster
```

## 7. **Monitor Sentinel Logs**

If you want to see real-time logs from Sentinel, you can access the logs in the Sentinel container or the system running Sentinel. This can help in debugging and understanding the failover process:

```bash
docker logs -f <sentinel_container_id>
```

Or, if running Sentinel directly on a server, view the logs using:

```bash
tail -f /var/log/redis/sentinel.log
```

## 8. **Cleanup after Testing**

If you manually triggered a failover in a production environment, make sure to reset the setup back to its normal state by reconfiguring the original master as a slave, if necessary.

```bash
redis-cli -h <new-master-ip> -p 6379
```

Run this command:

```bash
SLAVEOF NO ONE
```

This will ensure that the newly promoted master no longer replicates from any other instance.

By performing these tests, you can verify that your Redis Sentinel setup is working as expected and can handle failovers correctly.
