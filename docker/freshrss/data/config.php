<?php
return array (
  'environment' => 'production',
  'log_level' => '',
  'salt' => '41ae5c11f90483b9b0a7a9bc053d4ba3285a30230ad2e0252bef85d8b4206920',
  'base_url' => 'http://localhost:8080',
  'auto_update_url' => 'https://update.freshrss.org',
  'language' => 'en',
  'title' => 'FreshRSS',
  'meta_description' => '',
  'logo_html' => '',
  'default_user' => 'zkh',
  'force_email_validation' => false,
  'allow_anonymous' => false,
  'allow_anonymous_refresh' => false,
  'auth_type' => 'form',
  'reauth_required' => true,
  'reauth_time' => 1200,
  'http_auth_auto_register' => true,
  'http_auth_auto_register_email_field' => '',
  'api_enabled' => false,
  'suppress_csp_warning' => false,
  'csp.frame-ancestors' => '\'none\'',
  'simplepie_syslog_enabled' => true,
  'pubsubhubbub_enabled' => false,
  'allow_robots' => false,
  'allow_referrer' => false,
  'nb_parallel_refresh' => 10,
  'limits' => 
  array (
    'cookie_duration' => 7776000,
    'cache_duration' => 800,
    'cache_duration_min' => 60,
    'cache_duration_max' => 86400,
    'retry_after_default' => 1500,
    'retry_after_max' => 172800,
    'timeout' => 20,
    'max_inactivity' => 9223372036854775807,
    'max_feeds' => 131072,
    'max_categories' => 16384,
    'max_registrations' => 1,
    'max_favicon_upload_size' => 1048576,
    'regex_backtrack_limit' => 10000,
    'regex_recursion_limit' => 100,
  ),
  'curl_options' => 
  array (
  ),
  'db' => 
  array (
    'type' => 'sqlite',
    'host' => '',
    'user' => '',
    'password' => '',
    'base' => '',
    'prefix' => '',
    'connection_uri_params' => '',
    'pdo_options' => 
    array (
    ),
  ),
  'mailer' => 'mail',
  'smtp' => 
  array (
    'hostname' => '',
    'host' => 'localhost',
    'port' => 25,
    'auth' => false,
    'auth_type' => '',
    'username' => '',
    'password' => '',
    'secure' => '',
    'auto_tls' => true,
    'from' => 'root@localhost',
  ),
  'auto_sqlite_export' => 
  array (
    'enabled' => false,
    'retention' => 7,
  ),
  'extensions_enabled' => 
  array (
  ),
  'extensions' => 
  array (
  ),
  'disable_update' => true,
  'trusted_sources' => 
  array (
    0 => '127.0.0.0/8',
    1 => '::1/128',
  ),
  'internal_host_allowlist' => 
  array (
  ),
);