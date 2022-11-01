# Personal dotfiles for Windows

![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/IshiKakesuFun/dotfiles-win)

- [Personal dotfiles for Windows](#personal-dotfiles-for-windows)
- [Prerekvizity](#prerekvizity)
  - [Scoop CLI installer](#scoop-cli-installer)
  - [Git](#git)
  - [NVM manažer verzí node.js a npm](#nvm-manažer-verzí-nodejs-a-npm)
  - [Node.js a npm](#nodejs-a-npm)
  - [Nerd fonty](#nerd-fonty)
  - [Neofetch - systémové informace pro CLI](#neofetch---systémové-informace-pro-cli)
- [Instalace neovim](#instalace-neovim)
  - [Prerekvizity](#prerekvizity-1)
  - [Symlinky do konfiguračních adresářů](#symlinky-do-konfiguračních-adresářů)
  - [Instalace](#instalace)
    - [Provider nodejs pro neovim](#provider-nodejs-pro-neovim)
    - [TODO Provider python pro neovim](#todo-provider-python-pro-neovim)
    - [TODO Provider ruby pro neovim](#todo-provider-ruby-pro-neovim)
    - [TODO Provider perl pro neovim](#todo-provider-perl-pro-neovim)

# Prerekvizity

## Scoop CLI installer

CLI installer [Scoop](https://scoop.sh/) instaluje známé oblíbené aplikace (včetně linuxových) jako *partable* do separatních podsložek s pokud možno minimálními nároky na uživatele.

- potlačuje vyskakovací okna oprávnění
- potlačuje gui instalační wizardy
- zabraňuje nadměrnému množství položek v PATH 
- zabraňuje neočekávaným nechtěným vedlejším efektům spojšeným s instalací resp. odinstalací programů
- vyhledává a automaticky instaluje závislosti
- provádí všechna dodatečná nastavení tak, aby programu mohl ihned běžet


- [x] [Scoop](https://github.com/ScoopInstaller/Install#readme) nainstaluj z konzole PowerShellu, dle uvedeného postupu s nastavením práva na volání vzdáleného scriptu.

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

- [x] **Scoop** se defaultně nainstaluje do uživaltelské složky `C:\Users\<YOUR USERNAME>\scoop` následujícím scriptem.

```powershell
irm get.scoop.sh | iex
```

- [x] Po instalaci zkontroluj nové verze 

```powershell
scoop status
```

- [x] Aktualizuj zastaralé *buckets*

```powershell
scoop update
```

- [x] Zavři PowerShell konzoli, aby se projevily změny.

## Git

- [x] [Git](https://git-scm.com/) nainstaluj uvedeným příkazem. Zkontroluj verzi a nastav doporučenou konfiguraci.

```cmd
scoop install git
git -v

git config --global credential.helper manager-core
```

## NVM manažer verzí node.js a npm

[Nvm](https://github.com/coreybutler/nvm-windows) funguje na principu vytváření symlinků, a to i do systémových složek, takže instalace musí proběhnout pod administrátorským účtem. 

> **Prevence přetečení limitu 260 znaků pro** `PATH` **proměnnou**
> 
> Instalace zavede do `PATH` nejen níže uvedené cesty, které jsou relativně dlouhé, ale také budoucí *symlinky* na nainstalované verze *node.js*. Je pravděpodobné, že by mohlo dojít k problémům s přetečením limitu 260 znaků. Proveď opatření povolující dlouhé cesty.
> 
> - [x] Otevři PowerShell jako administrátor. Nastav podporu dlouhých cest v registrech.
>
> ```powershell
> Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem\" -Name "LongPathsEnabled" -Value 1
> ```
> - [x] Otevři *Local Group Policy Editor* a nastav níže uvedenou proměnnou na `Enabled`
> ``` 
> Local Computer Policy 
> └───Computer Configuration 
>     └───Administrative templates
>         └───System  
>             └───Filesystem  
>                 └───Enable Win32 long paths
> ```

- [x] Otevři Command Prompt jako administrátor a nainstaluj *scoopem* NVM.

```cmd
scoop install nvm
```
- [x] Zavři a znovu otevři Command Prompt jako administrátor, aby se projevilo nastavení proměnných `%NVM_HOME%` a `%NVM_SYMLINK%` a jejich doplnění do `%PATH%`.
## Node.js a npm
- [x] Nainstaluj LTS verzi [node.js](https://nodejs.org) a nastav ji jako aktálně používanou. Vše ověříš vylistováním nainstalovaných verzí a kontrolou nalinkované verze

```cmd
nvm install lts

nvm use lts

nvm list
node -v
npm -v
```

## Nerd fonty

- [x] [Nerd-fonts](https://www.nerdfonts.com) tvoří smostatný [bucket](https://github.com/matthewjberger/scoop-nerd-fonts), který musíme nejprve přidata a vygenerovat pro nej *manifest*. Fonty se instaluji u starších verzí windows s jen s administrátorským oprávněním, a proto otevři PowerShell jako admnistrátor, přidej *bucket* a přegeneruj *manifest*.

```powershel
scoop bucket add nerd-fonts
cd $home\scoop\buckets\nerd-fonts
.\bin\generate-manifests.ps1 -OverwriteExisting
```

- [x] Nainstaluj vybraný font
  
```powershell
scoop install JetBrainsMono-NF
scoop install JetBrainsMono-NF-Mono
```

Ukonči PowerShell konzoli.

## Neofetch - systémové informace pro CLI

```cmd
scoop install neofetch
```

# Instalace [neovim](https://neovim.io/)

## Prerekvizity

- [x] Pokud chci používat nejnovější verzi [neovim](https://github.com/neovim/neovim) musím přidat *bucket* [versions](https://github.com/ScoopInstaller/Versions), kde je manifest [neovim-nightly](https://github.com/neovim/neovim/releases/tag/nightly). Protože se bude linkovat umístění konfigurace do repozitáře, prováděj scripty v powershellu spuštěném jako administrátor

```powershell
scoop bucket add versions
```

- [x] Dalším vhodným doplňkem je *vcredist2022*, který se nachází v *bucketu* [extras](https://github.com/ScoopInstaller/Extras)
```powershell
scoop bucket add extras
scoop install vcredist2022
```

## Symlinky do konfiguračních adresářů

- [x] Kofigurční adresáře jsou součástí repozitáře. V prostředí windows není možné využít `XDG` proměnné prostředí, tak využiji *symlinky*.

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
scool list
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