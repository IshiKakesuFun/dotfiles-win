# Personal dotfiles for Windows

![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/IshiKakesuFun/dotfiles-win)

[[_toc_]]

# Prerekvizity

## Scoop CLI installer

CLI installer [Scoop](https://scoop.sh/) instaluje známé oblíbené aplikace 
(včetně linuxových) jako *partable* do separatních podsložek s pokud možno 
minimálními nároky na uživatele.

- potlačuje vyskakovací okna oprávnění
- potlačuje gui instalační wizardy
- zabraňuje nadměrnému množství položek v PATH 
- zabraňuje neočekávaným nechtěným vedlejším efektům spojeným s instalací 
  resp. odinstalací programů
- vyhledává a automaticky instaluje závislosti
- provádí všechna dodatečná nastavení tak, aby programu mohl ihned běžet


- [x] [Scoop](https://github.com/ScoopInstaller/Install#readme) nainstaluj 
  z konzole PowerShellu, dle uvedeného postupu s nastavením práva na volání 
  vzdáleného scriptu.

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

- [x] **Scoop** se defaultně nainstaluje do uživaltelské složky 
  `C:\Users\<YOUR USERNAME>\scoop` následujícím scriptem.

```powershell
irm get.scoop.sh | iex
```

- [x] Přidej další *buckets*, které budeš později používat.

```powershell
scoop bucket add extras versions nerd-fonts
```

- [x] Po instalaci a přidání *buckets* zkontroluj a případně zaktualizuj nové 
  verze 

```powershell
scoop status
scoop update
```

- [x] Zavři PowerShell konzoli, aby se projevily změny.

> **Prevence přetečení limitu 260 znaků pro** `PATH` **proměnnou**
> 
> Instalace zavádí do `PATH` cesty budoucích aplikací, které jsou relativně 
> dlouhé. Je pravděpodobné, že by mohlo dojít k problémům s přetečením limitu 
> 260 znaků. Proveď opatření povolující dlouhé cesty.
> 
> - [x] Otevři PowerShell jako administrátor. Nastav podporu dlouhých cest 
> v registrech.
>
> ```powershell
> Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem\" -Name "LongPathsEnabled" -Value 1
> ```
>
> - [x] Otevři *Local Group Policy Editor* a nastav níže uvedenou proměnnou na 
> `Enabled`
>
> ``` 
> Local Computer Policy 
> └───Computer Configuration 
>     └───Administrative templates
>         └───System  
>             └───Filesystem  
>                 └───Enable Win32 long paths
> ```

## Instalace nástrojů pro vývoj

Obecně lze říci, že většina aplikací pro vývoj bude vyžadovat instalci pod
administrátorským účtem, proto pro další postup použij vždy **PowerShell konzoli
spuštěnou pod administrátorským účtem**, pokud explicitně neuvedu jinak.

## Git

- [x] [Git](https://git-scm.com/) nainstaluj uvedeným příkazem. Zkontroluj verzi
  a nastav doporučenou konfiguraci.

```cmd
scoop install git
git -v

git config --global credential.helper manager-core
```

## NVM manažer verzí node.js a npm

- [x] Otevři konzoli a nainstaluj *scoopem* 
  [nvm](https://github.com/coreybutler/nvm-windows).

```cmd
scoop install nvm
```

- [x] Zavři a znovu otevři konzoli, aby se projevilo nastavení proměnných 
  `%NVM_HOME%` a `%NVM_SYMLINK%` a jejich doplnění do `%PATH%`.

## Node.js a npm

- [x] Nainstaluj LTS verzi [node.js](https://nodejs.org) a nastav ji jako 
  aktálně používanou. Vše ověříš vylistováním nainstalovaných verzí a kontrolou 
  nalinkované verze

```cmd
nvm install lts

nvm use lts

nvm list
node -v
npm -v
```

## Nerd fonty

- [x] [Nerd-fonts](https://www.nerdfonts.com) tvoří smostatný 
  [bucket](https://github.com/matthewjberger/scoop-nerd-fonts), který byl již 
  přidán, ale musíš pro něj ještě vygenerovat resp. přegenerovat *manifest*.

```powershel
cd $home\scoop\buckets\nerd-fonts
.\bin\generate-manifests.ps1 -OverwriteExisting
```

- [x] Nainstaluj vybraný font
  
```powershell
scoop install JetBrainsMono-NF
scoop install JetBrainsMono-NF-Mono
```

Zavři a znovu otevři konzoli

## CMake, gcc, VC redist

Některé aplikace, resp. jejich pluginy, nedistribuují buildy pro cílový OS či
architekturu a v rámci instalačního postup se musí zkompilovat a sestavit ze
zdrojových kódů. K tomu je zapotřebí nainstalovat příslušné nástroje, aby byl
tzv. *build/toolchain* připraven.

- [x] Nainstaluj *CMake*

```powershell
scoop install cmake
```

- [x] Nainstaluj gcc

```powershell
scoop install gcc
```

- [x] Nainstaluj VC redist 2022

```powershell
scoop install vcredist2022
```

Zavři a znovu otevři konzoli

## Docker

- [x] Nainstaluj Docker 

```powershell
scoop install docker
```

Zavři a znovu otevři konzoli

- [x] Zaveď službu *Docker Engine*

```powershell
dockerd --register-service
```

- [x] Otevři *Services* a službu *Docker Engine* nastartuj

Zavři a znovu otevři konzoli a ověř funkčnost vypsáním seznamu kontainerů

```powershell
docker ps
```

## Lua

- [x] Nainstaluj nástroje pro vývoj v jazyce Lua

```powershell
scoop install lua
lua -v
```

## Rust

- [x] Nainstaluj nástroje pro vývoj v jazyce Rust

```powershell
scoop install rustup
```

Zavři a znovu otevři konzoli a ověř verze nástrojů

```powershell
rustup -V
cargo -V
```

## Deno

- [x] Nainstaluj vývojové nástroje pro platformu Deno

```powershell
scoop install deno
```

Zavři a znovu otevři konzoli a ověř verze nástrojů

```powershell
deno --version
```

## Neofetch - systémové informace pro CLI

```cmd
scoop install neofetch
```

# Instalace [neovim](https://neovim.io/)

Pokud chci používat nejnovější verzi 
[neovim](https://github.com/neovim/neovim) musím zvolit 
[neovim-nightly](https://github.com/neovim/neovim/releases/tag/nightly) 
z *bucketu* [versions](https://github.com/ScoopInstaller/Versions).

## Prerekvizity

### Ripgrep

- [x] Kromě již nainstalovaných [build/toolchain](#cmake-gcc-vc-redist) 
  nástrojů nainstaluj ještě vyhledávací nástroj 
  [ripgrep](https://github.com/BurntSushi/ripgrep).

```powershell
scoop install ripgrep
rg --version
```
### Tree Sitter CLI

- [x] Některé parsery se pro neovim musí vygerenerovat přímo aplikací
  [TreeSitter](https://tree-sitter.github.io/tree-sitter).

```powershell
scoop install tree-sitter
tree-sitter -V
```

### fd - souborový vyhledavač

- [x] Pluginy neovimu mohou s výhodou použít účinný souborový vyhledavač
  [fd](https://github.com/sharkdp/fd) (náhrada *find*).

```powershell
scoop install fd
fd -V
```

### Symlinky do konfiguračních adresářů

- [x] Kofigurční adresáře jsou součástí repozitáře. V prostředí windows není 
  možné využít `XDG` proměnné prostředí, tak využiji *symlinky*.

```powershell
$repo = "$home\repos\github.com\IshiKakesuFun\dotfiles-win";

$lnvim = "$env:LOCALAPPDATA\nvim";
$lnvimData = $lnvim + "-data";

$nvim = $repo + "\.config\nvim";
$nvimData = $nvim + "-data";

if (Test-Path "$lnvim") {
    (Get-Item "$lnvim").Delete();
}
New-Item -ItemType SymbolicLink -Path "$lnvim" -Target "$nvim";

if (Test-Path "$lnvimData") {
    (Get-Item "$lnvimData").Delete();
}
New-Item -ItemType SymbolicLink -Path "$lnvimData" -Target "$nvimData";
```

## Instalace 

- [x] Nainstaluj nigthly build

```powershell
scoop install neovim-nightly
```

### Provider nodejs pro neovim

- [x] Nainstaluje nodejs provider pro neovim jako globální balíček 

```powershell
npm install -g neovim
npm -g list
```

### TODO Provider python pro neovim
### TODO Provider ruby pro neovim
### TODO Provider perl pro neovim

```
nvim-qt
```
