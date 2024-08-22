<?php 
// Additional configuration based on environment
if (env('APP_ENV') === 'production') {
    $redisConfig = [
        'client' => 'phpredis',
        'options' => [
            'cluster' => 'redis',
            'prefix' => env('REDIS_PREFIX', Str::slug(env('APP_NAME', 'laravel'), '_').'_database_'),
        ],
        'default' => [
            'url' => env('REDIS_URL', null),
            'host' => env('REDIS_SENTINEL_HOST', '127.0.0.1'),
            'password' => env('REDIS_PASSWORD', null),
            'port' => env('REDIS_SENTINEL_PORT', 26379),
            'database' => env('REDIS_DB', 0),
            'options' => [
                'replication' => 'sentinel',
                'service' => env('REDIS_SENTINEL_SERVICE', 'mymaster'),
                'parameters' => [
                    'password' => env('REDIS_PASSWORD', null),
                    'database' => env('REDIS_DB', 0),
                ],
            ],
        ],
        'cache' => [
            'url' => env('REDIS_URL', null),
            'host' => env('REDIS_SENTINEL_HOST', '127.0.0.1'),
            'password' => env('REDIS_PASSWORD', null),
            'port' => env('REDIS_SENTINEL_PORT', 26379),
            'database' => env('REDIS_CACHE_DB', 1),
            'options' => [
                'replication' => 'sentinel',
                'service' => env('REDIS_SENTINEL_SERVICE', 'mymaster'),
                'parameters' => [
                    'password' => env('REDIS_PASSWORD', null),
                    'database' => env('REDIS_CACHE_DB', 1),
                ],
            ],
        ],
    ];

    config(['database.redis' => $redisConfig]);
}