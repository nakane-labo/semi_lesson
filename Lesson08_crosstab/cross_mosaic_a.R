# クロス集計とモザイクプロット

# パッケージの準備
library(tidyverse)
library(ggplot2)
library(GGally)
library(dbplyr)
library(ggthemes)
library(gtsummary)

# 作業ディレクトリの確認
getwd()
# 作業フォルダを semi_lesson に合わせる（Lesson 等のサブフォルダから実行した場合のみ1つ上へ）
setwd(
  "/Users/naruhisa/Library/CloudStorage/OneDrive-学校法人立命館/lecture/semi/R/semi_lesson"
)

#全部の変数を消す
rm(list = ls())

#テーマのセット
#theme_set(theme_grey(base_family = "HiraginoSans-W3"))
#theme_set(theme_gray(
#base_family = "HiraginoSans-W3",
#base_size = 11, #文字の大きさを設定。デフォルトは11
#base_line_size = 0.2, #罫線の線の太さを設定。デフォルトはbase_size/22
#base_rect_size = 0.2 #外枠の線の太さを設定。デフォルトはbase_size/22))

#datasetを読み込む
remarrigewill_a <- read_csv("Lesson08_crosstab/remarrigewill_a.csv")

print(remarrigewill_a)
view(remarrigewill_a)

#変数を箱に入れるよ
gender <- (remarrigewill_a$gender)
remarrige_will <- (remarrigewill_a$remarrige_will)

#genderと再婚意思をカテゴリ変数に変換
remarrigewill <- remarrigewill_a %>%
  mutate(gender_c = factor(gender, levels = 1:2, labels = c("男性", "女性")))

remarrigewill_c <- remarrigewill %>%
  mutate(
    remarrige_will_c = factor(
      remarrige_will,
      levels = 1:3,
      labels = c(
        "機会があれば再婚したい",
        "当面は再婚の意思はない",
        "再婚する意思はない"
      )
    )
  )

print(remarrigewill_c)

#データセット全体のテーブルを自動でつくる
remarrigewill_c %>%
  tbl_summary()

#記述統計量にラベルを付けてテーブルで出力する
remarrigewill_c %>%
  select(gender_c, remarrige_will_c) %>%
  tbl_summary(
    label = list(gender_c ~ "性別", remarrige_will_c ~ "再婚意思"), #~の前には列名、後ろにはつけたい名前を""で囲んで入れ、,で一つずつ区切る
    statistic = list(all_continuous() ~ "{mean} ({sd})"),
    digits = all_continuous() ~ 1
  ) %>% #数値の部分が小数点第y位の部分の値
  modify_header(label ~ "") # ""の部分には好きな文字列を入れられる。何も入れなければ空欄になる

# データをカテゴリー変数でクロス集計（tidyverse）
table_data <- remarrigewill_c %>%
  count(gender_c, remarrige_will_c, name = "n")

table_data

# χ二乗検定の実行
chisq_result <- table_data %>%
  xtabs(n ~ gender_c + remarrige_will_c, data = .) %>%
  chisq.test()

# χ二乗検定結果の表示
print(chisq_result)

# せっかくだから男女別に書いてみる（by= 使用時は label に by 変数を含めない）
table_by_gender <- remarrigewill_c %>%
  select(gender_c, remarrige_will_c) %>%
  tbl_summary(
    label = list(remarrige_will_c ~ "再婚意思"),
    statistic = list(all_continuous() ~ "{mean} ({sd})"),
    by = gender_c,
    digits = all_continuous() ~ 1
  )

# add_p()でχ二乗検定を行い、その結果を表に追加
table_data_with_p <- table_by_gender %>%
  add_p(test = list(remarrige_will_c ~ "chisq.test"))

table_data_with_p

# モザイクプロット（ggplot2 の geom_rect で描画）
mosaic_data <- remarrigewill_c %>%
  count(gender_c, remarrige_will_c) %>%
  group_by(remarrige_will_c) %>%
  mutate(prop_within = n / sum(n)) %>%
  ungroup() %>%
  mutate(
    col_total = ave(n, remarrige_will_c, FUN = sum),
    col_prop  = col_total / sum(n)
  )

# 各列の幅と位置を計算
col_info <- mosaic_data %>%
  distinct(remarrige_will_c, col_prop) %>%
  mutate(
    xmax = cumsum(col_prop),
    xmin = lag(xmax, default = 0),
    xmid = (xmin + xmax) / 2
  )

mosaic_data <- mosaic_data %>%
  left_join(col_info, by = c("remarrige_will_c", "col_prop")) %>%
  group_by(remarrige_will_c) %>%
  mutate(
    ymax = cumsum(prop_within),
    ymin = lag(ymax, default = 0)
  ) %>%
  ungroup()

ggplot(mosaic_data) +
  geom_rect(
    aes(
      xmin = xmin, xmax = xmax,
      ymin = ymin, ymax = ymax,
      fill = gender_c
    ),
    colour = "white"
  ) +
  geom_text(
    data = col_info,
    aes(x = xmid, y = -0.03, label = remarrige_will_c),
    size = 3
  ) +
  labs(title = "再婚意思の男女比較", fill = "性別") +
  theme_minimal(base_family = if (interactive()) "HiraKakuPro-W3" else "sans") +
  theme(
    axis.text.x  = element_blank(),
    axis.ticks.x = element_blank(),
    plot.title   = element_text(hjust = 0.5)
  )
