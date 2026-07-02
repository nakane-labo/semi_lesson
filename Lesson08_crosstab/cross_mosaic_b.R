# パッケージの準備（devtools / ggmosaic は事前に install.packages で入れておく）
# install.packages("devtools")  # 必要なら R コンソールで実行
library(tidyverse)
library(ggplot2)
library(GGally)
library(dbplyr)
library(ggthemes)
library(gtsummary)

# ggmosaicはRのバージョンでエラーが出やすいので、最新のRStudio、Rのにアップデートしてから
devtools::install_github("haleyjeppson/ggmosaic")
library(ggmosaic)

#全部の変数を消す
rm(list=ls())

#テーマのセット
theme_set(theme_grey(base_family = if (interactive()) "HiraginoSans-W3" else "sans"))
theme_set(theme_gray(
  base_family = "HiraginoSans-W3",
  base_size = 11, #文字の大きさを設定。デフォルトは11
  base_line_size = 0.2, #罫線の線の太さを設定。デフォルトはbase_size/22
  base_rect_size = 0.2 #外枠の線の太さを設定。デフォルトはbase_size/22
))


# 作業フォルダを semi_lesson に合わせる（Lesson 等のサブフォルダから実行した場合のみ1つ上へ）
# datasetを読み込む（相対パス）


#変数を箱に入れるよ


#genderと再婚意思をカテゴリ変数に変換

#データセット全体のテーブルを自動でつくる


#記述統計量にラベルを付けてテーブルで出力する

# データをカテゴリー変数でクロス集計


# χ二乗検定の実行


# χ二乗検定結果の表示

# せっかくだから男女別に書いてみる

# add_p()でχ二乗検定を行い、その結果を表に追加

#モザイクプロットを書く
