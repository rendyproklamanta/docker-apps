<?php

// Composer install
// $ composer require open-telemetry/opentelemetry

// Autoload dependencies using Composer
require_once __DIR__ . '/vendor/autoload.php';

use OpenTelemetry\SDK\Trace\TracerProvider;
use OpenTelemetry\SDK\Trace\SimpleSpanProcessor;
use OpenTelemetry\SDK\Trace\Exporters\OtlpHttpExporter;
use OpenTelemetry\API\Trace\Tracer;
use OpenTelemetry\API\Trace\Span;

if (CI_ENV == 'production') {
   // Setup the OTLP Exporter (HTTP or gRPC)
   $otlpExporter = new OtlpHttpExporter('http://otel-collector:4317');  // OTLP endpoint, adjust as needed

   // Set up a span processor (simple span processor)
   $spanProcessor = new SimpleSpanProcessor($otlpExporter);

   // Initialize the TracerProvider with the OTLP exporter
   $tracerProvider = new TracerProvider();
   $tracerProvider->addSpanProcessor($spanProcessor);

   // Set the global tracer provider
   \OpenTelemetry\API\Trace\TracerProvider::setTracerProvider($tracerProvider);

   // Obtain a tracer for your application
   $tracer = $tracerProvider->getTracer('codeigniter3-app');

   // Optionally, start a span for the incoming request
   $span = $tracer->startSpan('main-request');

   // Add attributes to the span here (e.g., route, method, user agent, etc.)
   $span->setAttribute('route', $_SERVER['REQUEST_URI']);
   $span->setAttribute('method', $_SERVER['REQUEST_METHOD']);
   $span->setAttribute('user-agent', $_SERVER['HTTP_USER_AGENT']);

   // End the span when the request is completed
   register_shutdown_function(function () use ($span) {
      // Ensure the span ends after request processing
      $span->end();
   });
}