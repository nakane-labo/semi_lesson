# Lesson16 傾向スコアマッチング（Propensity Score Matching）

ゼミ用の傾向スコアマッチング・IPW（逆確率重み付け）の R 教材です。5 つのデータセットを使い、因果推論の基本的な手法を実践的に学びます。

> 旧リポジトリ `nakane-labo/propensity-score-matching` から、本リポジトリの Lesson16 に統合しました。

## フォルダ構成

| フォルダ | テーマ | アウトカム | 処置変数 | 手法 |
|---|---|---|---|---|
| `喫煙妊婦/` | 妊婦の喫煙と出生体重 | 出生体重 (bweight) | 喫煙 (mbsmoke) | PSM, IPW |
| `心臓カテーテル/` | 右心カテーテル (RHC) と死亡率 | 死亡 (death) | RHC 施術 (swang1) | PSM (caliper), IPW |
| `失業手当/` | 失業手当の給付と収入変化 | 給付前後の収入差 (gap_income) | 給付有無 (payment) | IPTW (WeightIt) |
| `猫/` | 投薬と寄生虫除去日数 | 除去日数 (days) | 投薬 (treatment) | IPTW (WeightIt) |
| `試験点数/` | テキスト利用と成績変化 | 成績変化 (outcome) | テキスト利用 (treatment) | IPTW (WeightIt) |

## 必要な R パッケージ

```r
install.packages(c(
  "tidyverse", "ggplot2", "GGally", "ggthemes", "gtsummary",
  "broom", "readxl", "Matching", "MatchIt", "WeightIt",
  "cobalt", "survey", "twang", "PSweight",
  "coefplot", "modelsummary", "gridExtra",
  "extrafont", "showtext"
))
```

## 使い方

各フォルダの `.R` ファイルを RStudio で開き、上から順に実行してください。データファイル（`.csv` / `.xlsx`）は同フォルダに含まれています。

## ライセンス

教育目的の教材です。
