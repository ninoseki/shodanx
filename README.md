# shodanx

[![Gem Version](https://badge.fury.io/rb/shodanx.svg)](https://badge.fury.io/rb/shodanx)
[![Build Status](https://travis-ci.org/ninoseki/shodanx.svg?branch=master)](https://travis-ci.org/ninoseki/shodanx)
[![Coverage Status](https://coveralls.io/repos/github/ninoseki/shodanx/badge.svg?branch=master)](https://coveralls.io/github/ninoseki/shodanx?branch=master)

Yet another Shodan API wrapper for Ruby.

**Note:** This is a fork version of [shodanz](https://github.com/picatz/shodanz).

## Why I forked

I need a Shodan API wrapper which:

- works on Ruby 2.6.
- only needs minimum dependencies. (This gem needs no dependencies to run)
- is well tested.

## Installation

```bash
gem install shodanx
```

## Usage

```ruby
require "shodan"

# when given nothing, it tries to load your API key from ENV["SHODAN_API_KEY"]
api = Shodan::API.new
# or you can set it manually
api = Shodan::API.new(key: "YOUR_API_KEY")

# Shodan Search Methods
api.host.get_by_ip("104.25.89.97")
api.host.count("nginx")
api.host.count("nginx", facets: { country: 10 })
api.host.search("nginx")
api.host.search("ftp", port: 21, facets: { country: 10 })
api.host.tokens("nginx")
api.ports

# Shodan On-Demand Scanning
api.protocols
api.scan.crawl("1.1.1.1")
api.scan.get_by_id("SCAN_ID")

# Shodan Network Alerts
api.alert.get_by_id("ALERT_ID")
api.alert.info
api.alert.triggers
api.alert.create(name: "Test alert", ip: "198.20.88.0/24")
api.alert.delete_by_id("ALERT_ID")

# Shodan Directory Methods
api.query.list
api.query.search("nginx")
api.query.tags

# Account Methods
api.account.profile

# DNS Methods
api.dns.resolve("google.com")
api.dns.reverse("1.1.1.1")

# Utility Methods
api.tools.http_headers
api.tools.my_ip

# API Status Methods
api.info

# Experimental Methods
api.labs.honeyscore("1.1.1.1")

# Shodan Exploits Methods
api.exploits.search("python")
api.exploits.count("python")
```

See `/spec` for more.

## Supported API endpoints

### [REST API](https://developer.shodan.io/api)

| Method | URI                                                   | API method                                                                 |
|--------|-------------------------------------------------------|----------------------------------------------------------------------------|
| GET    | /shodan/host/{ip}                                     | `api.host.get_by_ip(ip, **params)`                                         |
| GET    | /shodan/host/count                                    | `api.host.count(query = "", facets: {}, **params)`                         |
| GET    | /shodan/host/search                                   | `api.host.search(query = "", facets: {}, page: 1, minify: true, **params)` |
| GET    | /shodan/host/search/tokens                            | `api.host.tokens(query = "", **params)`                                    |
| GET    | /shodan/ports                                         | `api.ports`                                                                |
| GET    | /shodan/protocols                                     | `api.protocols`                                                            |
| POST   | /shodan/scan                                          | `api.scan.crawl(*ips)`                                                     |
| POST   | /shodan/scan/internet                                 | `api.scan.crawl_for(**params)`                                             |
| GET    | /shodan/scan/{id}                                     | `api.scan.get_by_id(id)`                                                   |
| POST   | /shodan/alert                                         | `api.alert.create(name:, ip:)`                                             |
| GET    | /shodan/alert/{id}/info                               | `api.alert.get_by_id(id)`                                                  |
| DELETE | /shodan/alert/{id}                                    | `api.alert.delete_by_id(id)`                                               |
| GET    | /shodan/alert/info                                    | `api.alert.info`                                                           |
| GET    | /shodan/alert/triggers                                | `api.alert.triggers`                                                       |
| PUT    | /shodan/alert/{id}/trigger/{trigger}                  | N/A                                                                        |
| DELETE | /shodan/alert/{id}/trigger/{trigger}                  | N/A                                                                        |
| PUT    | /shodan/alert/{id}/trigger/{trigger}/ignore/{service} | N/A                                                                        |
| DELETE | /shodan/alert/{id}/trigger/{trigger}/ignore/{service} | N/A                                                                        |
| GET    | /shodan/query                                         | `api.query.list(**params)`                                                 |
| GET    | /shodan/query/search                                  | `api.query.search(query, **params)`                                        |
| GET    | /shodan/query/tags                                    | `api.query.tags(size = 10)`                                                |
| GET    | /shodan/data                                          | N/A                                                                        |
| GET    | /shodan/data/{dataset}                                | N/A                                                                        |
| GET    | /org                                                  | N/A                                                                        |
| PUT    | /org/member/{user}                                    | N/A                                                                        |
| DELETE | /org/member/{user}                                    | N/A                                                                        |
| GET    | /account/profile                                      | `api.account.profile`                                                      |
| GET    | /dns/resolve                                          | `api.dns.resolve(**hostnames)`                                             |
| GET    | /dns/reverse                                          | `api.dns.reverse(**ips)`                                                   |
| GET    | /tools/httpheaders                                    | `api.tools.http_headers`                                                   |
| GET    | /tools/myip                                           | `api.tools.my_ip`                                                          |
| GET    | /api-info                                             | `api.info`                                                                 |
| GET    | /labs/honeyscore/{ip}                                 | `api.labs.honeyscore(ip)`                                                  |

### [Exploits API](https://developer.shodan.io/api/exploits/rest)

| Method | URI     | API method                                                       |
|--------|---------|------------------------------------------------------------------|
| GET    | /search | `api.exploits.search(query = "", facets: {}, page: 1, **params)` |
| GET    | /count  | `api.exploits.count(query = "", facets: {}, page: 1, **params)`  |

### [Streaming API](https://developer.shodan.io/api/stream)

N/A

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
