# Personal dotfiles for Windows

![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/IshiKakesuFun/dotfiles-win)

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
