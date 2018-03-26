# dumbf

Advance BruteForce Tools (Untested Version)

## Installation

`curl https://dist.crystal-lang.org/apt/setup.sh | sudo bash`

```
sudo apt-get install crystal
sudo apt-get install \
  libbsd-dev \
  libedit-dev \
  libevent-core-2.0-5 \
  libevent-dev \
  libevent-extra-2.0-5 \
  libevent-openssl-2.0-5 \
  libevent-pthreads-2.0-5 \
  libgmp-dev \
  libgmpxx4ldbl \
  libssl-dev \
  libxml2-dev \
  libyaml-dev \
  libreadline-dev \
  automake \
  libtool \
  git \
  llvm \
  libpcre3-dev \
  libgc-dev \
  zlib1g-dev \
  build-essential -y
git clone https://github.com/codenoid/dumbf.git
cd dumbf
crystal build --release --no-debug src/dumbf.cr
sudo mv dumbf config.yml wordlist.txt /usr/bin/
```

## Usage

```
dumbf --type http_form --fork 5
```

## Development

* Fuck The Writer

## Contributing

1. Fork it ( https://github.com/codenoid/dumbf/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [codenoid](https://github.com/codenoid) Rubi Jihantoro - creator, maintainer
