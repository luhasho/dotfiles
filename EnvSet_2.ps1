# ################################################################################
# Windows環境設定 2
# ################################################################################
# 変数設定
$Git_Name=memo
$Git_Clone_Dir = Join-Path $HOME 00_GIT\ |Join-Path -ChildPath $Git_Name

$Git_Url = "https://github.com/luhasho/" + $Git_Name + ".git"

# フォルダの作成
if ( -not (test-path $Git_Clone_Dir)) {new-item -path $Git_Clone_Dir -itemtype directory -force}

# git clone
git clone $Git_Url $Git_Clone_Dir


exit

