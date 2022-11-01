# Personal dotfiles for Windows

![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/IshiKakesuFun/dotfiles-win)

## Prerekvizity

### Scoop CLI installer

CLI installer [Scoop](https://scoop.sh/) instaluje známé oblíbené aplikace (včetně linuxových) jako *partable* do separatních podsložek s pokud možno minimálními nároky na uživatele.

- potlačuje vyskakovací okna oprávnění
- potlačuje gui instalační wizardy
- zabraňuje nadměrnému množství položek v PATH 
- zabraňuje neočekávaným nechtěným vedlejším efektům spojšeným s instalací resp. odinstalací programů
- vyhledává a automaticky instaluje závislosti
- provádí všechna dodatečná nastavení tak, aby programu mohl ihned běžet

[Scoop](https://github.com/ScoopInstaller/Install#readme) nainstaluj z konzole PowerShellu, dle uvedeného postupu. 

- [ ] Využij postup s nastavením práva na volání vzdáleného scriptu.

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```
- [ ] **Scoop** se defaultně nainstaluje do uživaltelské složky `C:\Users\<YOUR USERNAME>\scoop` následujícím scriptem.

```powershell
irm get.scoop.sh | iex
```