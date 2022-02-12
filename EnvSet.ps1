# ################################################################################
# Windows環境設定
# ################################################################################
# Todo PowerSehll のバージョンアップ
# バージョンアップしないと シンボリックリンク作成できないかも

# Todo winget のインストール


# --------------------------------------------------
# winget 
# --------------------------------------------------
winget install vim.vim
winget install git.git

# --------------------------------------------------
# git の path追加
# --------------------------------------------------
$ENV:Path+=";C:\Program Files\Git\cmd\"

# --------------------------------------------------
# 変数設定
# --------------------------------------------------
$dotfilesDir = Join-Path $HOME dotfiles
$profileDir = Split-Path $PROFILE
$deinInstallDir = Join-Path $HOME .cache\dein

# --------------------------------------------------
# フォルダ作成
# --------------------------------------------------
# $PROFILE のフォルダが無い場合にフォルダ作成
if ( -not (test-path $profileDir)) {new-item -path $profileDir -itemtype directory -force}
# deinインストール用のフォルダ作成
if ( -not (test-path $deinInstallDir)) {new-item -path $deinInstallDir -itemtype directory -force}
# dotfiles フォルダの作成
if ( -not (test-path $dotfilesDir)) {new-item -path $dotfilesDir -itemtype directory -force}

# --------------------------------------------------
# dein インストール
# --------------------------------------------------
# dein インストーラーのダウンロード
Invoke-WebRequest https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.ps1 -OutFile installer.ps1
# $deinInstallDir に dein インストール
./installer.ps1 $deinInstallDir

# --------------------------------------------------
# git clone
# --------------------------------------------------
# dotfiles を git clone する
git clone https://github.com/luhasho/dotfiles.git $dotfilesDir

# --------------------------------------------------
# シンボリックリンク作成
# --------------------------------------------------
# vim関連
New-Item -ItemType SymbolicLink -Path (Join-Path $HOME _vimrc) -Value (Join-Path $dotfilesDir _vimrc)
New-Item -ItemType SymbolicLink -Path (Join-Path $HOME _gvimrc) -Value (Join-Path $dotfilesDir _gvimrc)

# PowerShell関連
New-Item -ItemType SymbolicLink -Path $PROFILE -Value (Join-Path $dotfilesDir Microsoft.PowerShell_profile.ps1)

# bash関連
New-Item -ItemType SymbolicLink -Path (Join-Path $HOME .bash_profile) -Value (Join-Path $dotfilesDir .bash_profile)
New-Item -ItemType SymbolicLink -Path (Join-Path $HOME .bashrc) -Value (Join-Path $dotfilesDir .bashrc)

exit

