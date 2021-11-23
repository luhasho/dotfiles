function prompt {

  if((Get-Location).Path -like ($env:USERPROFILE) + "*") {
  # prompt がユーザープロファイルの時の動作
    #環境変数userprofileの文字列内の\を\\に置換する(正規表現になるので、エスケープが必要)
    $tmp = $env:USERPROFILE -replace "\\" , "\\"
    "PS " + ($(get-location).Path -replace  $tmp , "~") + "> "
  } else {
  # prompt がユーザープロファイルの時以外の動作
    "PS " + $(get-location) + "> "
  }

}

