# Tiszta telepítés *Windows 10*-re

## Felhasználandó / szükséges alkalmazások
> *Windows 10, 64 bit*

  - [git](https://github.com/git-for-windows/git/releases/download/v2.18.0.windows.1/Git-2.18.0-64-bit.exe)
  - [ninja](https://github.com/ninja-build/ninja/releases/download/v1.8.2/ninja-win.zip)
  - [cmake](https://cmake.org/files/v3.12/cmake-3.12.0-rc2-win64-x64.zip)
  - [TexLive](http://mirror.ctan.org/systems/texlive/tlnet/install-tl-windows.exe)


## Telepítés
1. Feltelepíted a `git`-et. *next, next, next...*
2. Feltelepíted a `cmake`-et, ügyelve hogy hozzáadódjon a `PATH`-hoz, akár rendszer vagy felhasználói szinten. *next, next, next...*
3. Bemásolod a `ninja.exe`-ét a `C:\Program Files\ninja\` mappába, majd ezt a [mappád hozzá adod a `PATH` környezeti változóhoz](https://superuser.com/a/985947), akár rendszer akár felhasználói szinten.
4. Feltelepíted a `TexLive`-ot (simple, big opcióval). *next, next, next...*
5. Kész, yaay.

> *next, next, next...* : A telepítés menetére utal.


## Előkészítés
> *Azaz, hogyan is lesz a `tex` fájlokból `pdf`.*

> **TODO: privát ssh kulcs generálása, mert a GitLab csak ilyen authentikációt fogad el => útmutató készítése hozzá...**

1. [**Készítünk egy `SSH Key`-t**](https://gitlab.com/profile/keys), hogy hozzáférhessünk a repository-hoz *(mappához)*. [Segítség.](https://docs.gitlab.com/ee/gitlab-basics/create-your-ssh-keys.html)

2. **Lemásoljuk *(klónozzuk)* a repository-t** *(mappát)*: a kívánt mappába (ahová tenni szeretnénk) [nyitunk egy konzolt](https://lifehacker.com/5989434/quickly-open-a-command-prompt-from-the-windows-explorer-address-bar), majd beírjuk:
```bash
git clone git@gitlab.com:luksan/ejc-szabalyzatok.git
```

> ***Amennyiben nincs `imgs` mappa** a leklónozott almappák között, úgy hozzuk létre azt.
> -- ez azért van, mert az üres mappákat nem hozza létre, viszont később szükségünk lehet rá.*

3. **Csinálunk egy mappát**, amibe generálni fogjuk az eredményeket, részeredményeket. Legyen ez a `build` mappa. Konzolból is megcsinálhatjuk:
```bash
mkdir build
```
4. **Navigáljunk a megkonstruált mappába**, vagy nyissunk oda konzolt:
```bash
cd build
```

5. **Konfiguráljuk a build rendszert**, azaz utasítjuk a `cmake`-et, hogy generáljon le egy *receptet* a `ninja` *build tool*-hoz az egyel kiljebb lévő mappában található `CMakeLists.txt` projekthez:
```bash
cmake -G Ninja ..
```
6. **Végrehajtjuk az első *build*-et**:
```bash
ninja
```
7. **Jó esetben** csak `warning`-ok lesznek, és **minden generált `pdf` a `release` nevű mappában lesz.** Ugyanakkor minden almappában is ott marad minden részeredmény, hogy változások esetén csak a szükséges fájlokat kelljen a rendszernek újra buildelnie.


> *Ha valamelyik konzolos utasítás nem működik, mert `'xyz' is not recognized as an internal or external command...`, akkor az adott alkalmazás nem elérhető a `PATH` környezetei változódon keresztül, azaz a mappáját hozzá hell fűzni ahhoz a listához...*


## Egyéb segítség
<details>
  <summary>Hasznos weboldalak, ha **nem** a beégetett verzókat szeretnéd telepíteni, hanem az elérhető legfrissebbet.</summary>
  - [git](https://git-scm.com/download/win)
  - [ninja](https://github.com/ninja-build/ninja/releases)
  - [cmake](https://cmake.org/download/)
  - [texlive](https://www.tug.org/texlive/acquire-netinstall.html)

> Mindenből az x86-64-es változatot, azaz a 64 biteset válasszátok ki [ha nem tudod mit csinálsz](http://www.winability.com/how-to-tell-if-my-windows-is-32-or-64-bit/).
Ne a forráskódot (source), hanem a futtatható állományt töltsétek le (binary).

> Ha fordítás közben azt mondja a `pdflatex`, hogy nem találja a megadott `tex` fájlt, noha az a megfelelő mappában van, akkor előfordulhat, hogy a `TEXINPUTS` környezeti változó definiálva van, és ki kéne törölni.
</details>
