rem シンボリックリンクを作成する
mklink %HOMEPATH%\_vimrc %HOMEPATH%\dotfiles\_vimrc
mklink %HOMEPATH%\_gvimrc %HOMEPATH%\dotfiles\_gvimrc
mklink %HOMEPATH%\.bash_profile %HOMEPATH%\dotfiles\.bash_profile

rem bashシェルの場合
rem ln -sf ~/dotfiles/_vimrc ~/_vimrc


pause
exit /b

