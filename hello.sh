sudo apt-get install \
      build-essential pkg-config libc6-dev m4 g++-multilib \
      autoconf libtool ncurses-dev unzip git python \
      zlib1g-dev wget bsdmainutils automake

git clone https://github.com/zcash/zcash.git
cd zcash/
git checkout v1.0.3
sudo ./zcutil/fetch-params.sh
sudo ./zcutil/build.sh -j$(nproc)
mkdir ~/.zcash/
cd ~/.zcash
touch zcash.conf
printf 'addnode=mainnet.z.cash\n rpcuser=ZCASHRPC\n rpcpassword=`head -c 32 /dev/urandom | base64`\n gen=1\n genproclimit=$(nproc)\n equihashsolver=tromp' >> zcash.conf

