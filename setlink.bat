rem �V���{���b�N�����N���쐬����
mklink %HOMEPATH%\_vimrc %HOMEPATH%\dotfiles\_vimrc
mklink %HOMEPATH%\_gvimrc %HOMEPATH%\dotfiles\_gvimrc

rem PowerShell�֘A
mklink %HOMEPATH%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 %HOMEPATH%\dotfiles\Microsoft.PowerShell_profile.ps1

rem bash�֘A
mklink %HOMEPATH%\.bash_profile %HOMEPATH%\dotfiles\.bash_profile
mklink %HOMEPATH%\.bashrc %HOMEPATH%\dotfiles\.bashrc

rem bash�V�F���̏ꍇ
rem ln -sf ~/dotfiles/_vimrc ~/_vimrc


pause
exit /b

