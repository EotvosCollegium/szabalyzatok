# Fordítás menete teljesen tiszta lapról

```bash
git clone -b cmake_support git@gitlab.com:luksan/ejc-szabalyzatok.git
cd ejc-szabalyzatok

mkdir build
cd build
cmake -G "MinGW Makefiles" ..
cmake --build .
```
