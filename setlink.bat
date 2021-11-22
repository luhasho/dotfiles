rem シンボリックリンクを作成する
mklink %HOMEPATH%\_vimrc %HOMEPATH%\dotfiles\_vimrc
mklink %HOMEPATH%\_gvimrc %HOMEPATH%\dotfiles\_gvimrc

rem PowerShell関連
mklink %HOMEPATH%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 %HOMEPATH%\dotfiles\Microsoft.PowerShell_profile.ps1

rem bash関連
mklink %HOMEPATH%\.bash_profile %HOMEPATH%\dotfiles\.bash_profile
mklink %HOMEPATH%\.bashrc %HOMEPATH%\dotfiles\.bashrc

rem bashシェルの場合
rem ln -sf ~/dotfiles/_vimrc ~/_vimrc


pause
exit /b

