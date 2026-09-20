# semi_lesson

立命館大学・中根ゼミ用の **R 統計入門レッスン**です。基礎から回帰・ロジスティック回帰、傾向スコア（Lesson16）までを、Lesson ごとのフォルダで公開しています。

詳細な手順（FAQ 含む）は [`GitHub連携ガイド_学生向け.md`](GitHub連携ガイド_学生向け.md) を参照してください。

---

## 保存場所（必ず守ること）

レッスン内の R スクリプトは、作業ディレクトリ（`setwd`）を次の場所に合わせる前提で書かれています。**別の場所に置くと、データ読み込みで Directory / ファイルが見つからないエラーになります。**

### Mac

```
/Users/[あなたのユーザー名]/Library/CloudStorage/OneDrive-学校法人立命館/lecture/semi/R/semi_lesson
```

- `[あなたのユーザー名]` はパソコンごとに異なります（ターミナルで `whoami`）。
- 例（ユーザー名が `tanaka` の場合）:

```
/Users/tanaka/Library/CloudStorage/OneDrive-学校法人立命館/lecture/semi/R/semi_lesson
```

### Windows

OneDrive の場所は環境で異なります。次と同じ並びになるように配置してください。

```
…\OneDrive-学校法人立命館\lecture\semi\R\semi_lesson
```

### 注意

- フォルダ名は必ず `semi_lesson` にしてください（ZIP 解凍で `semi_lesson-main` になったらリネーム）。
- デスクトップには置かないでください。
- 中に `Lesson01_R_basics` などの Lesson フォルダが並んでいれば OK です。

---

## まとめてダウンロードする（リポジトリ全体）

授業の通年教材として使う場合や、初めて一式を入れる場合はこちらです。

### 方法 A：ZIP（いちばん簡単）

1. https://github.com/nakane-labo/semi_lesson を開く
2. 緑色の **Code** → **Download ZIP**
3. ZIP を解凍する
4. できたフォルダを、上の **保存場所** に移動する
5. フォルダ名が `semi_lesson-main` なら `semi_lesson` にリネームする

更新を取り直すときは、もう一度 ZIP をダウンロードし、必要な Lesson だけ上書きするか、別名フォルダに解凍してから移してください。自分で編集したファイルは消さないよう、先にコピーを残すと安心です。

### 方法 B：Git clone（更新を取りやすい）

Git が入っている場合。**保存場所のひとつ上（`R` フォルダ）** で実行します。

```bash
cd "/Users/[あなたのユーザー名]/Library/CloudStorage/OneDrive-学校法人立命館/lecture/semi/R"
git clone https://github.com/nakane-labo/semi_lesson.git
```

更新の取り込み:

```bash
cd "/Users/[あなたのユーザー名]/Library/CloudStorage/OneDrive-学校法人立命館/lecture/semi/R/semi_lesson"
git pull
```

---

## レッスンごとにダウンロードする

特定の Lesson だけ欲しい場合の手順です。**解凍・配置したあとも、最終的なパスは上記の `…/R/semi_lesson/LessonXX_…` になるようにしてください。** Lesson フォルダだけをデスクトップなどに単体で置くと、スクリプト内の `setwd` と合わずエラーになります。

### 方法 1：ブラウザでフォルダ内のファイルを取る（少ファイル向け）

1. リポジトリページで目的の Lesson フォルダ（例: `Lesson07_ttest`）を開く
2. 各ファイルを開き、右上のダウンロード（または Raw → 名前を付けて保存）で保存する
3. 自分のパソコンの `semi_lesson` 内に、**GitHub 上と同じフォルダ名**で置く

### 方法 2：フォルダごと ZIP で取る（おすすめ）

GitHub 本体には「フォルダ単位の Download ZIP」がないため、次のどちらかを使います。

**A. Download Directory（ブラウザ）**

1. https://download-directory.github.io/ を開く
2. 欲しい Lesson フォルダの URL を貼る  
   例: `https://github.com/nakane-labo/semi_lesson/tree/main/Lesson07_ttest`
3. ダウンロードされた ZIP を解凍する
4. 中身を `…/R/semi_lesson/` の下に、フォルダ名ごと置く  
   （結果として `…/semi_lesson/Lesson07_ttest/` になること）

**B. Git の sparse checkout（ターミナル）**

すでに `semi_lesson` を clone 済みなら、必要な Lesson だけに絞ることもできます。初めての場合は「まとめてダウンロード」のほうが簡単です。

```bash
cd "/Users/[あなたのユーザー名]/Library/CloudStorage/OneDrive-学校法人立命館/lecture/semi/R"
git clone --filter=blob:none --sparse https://github.com/nakane-labo/semi_lesson.git
cd semi_lesson
git sparse-checkout set Lesson07_ttest
```

別の Lesson を追加する例:

```bash
git sparse-checkout add Lesson16_propensity_score
```

---

## レッスン一覧

| フォルダ | 内容 |
|---|---|
| `Lesson01_R_basics` | R の基礎 |
| `Lesson02_vectors_and_dataframes` | ベクトルとデータフレーム |
| `Lesson03_histogram` | ヒストグラム |
| `Lesson04_ggplot_basics` | ggplot2 基礎 |
| `Lesson05_line_plot` | 折れ線グラフ |
| `Lesson06_sd_and_se` | 標準偏差と標準誤差 |
| `Lesson07_ttest` | t 検定 |
| `Lesson08_crosstab` | クロス集計 |
| `Lesson09_long_wide` | long / wide 変換 |
| `Lesson10_simple_regression` | 単回帰 |
| `Lesson11_data_handling` | データハンドリング |
| `Lesson12_multiple_regression1` | 重回帰（1） |
| `Lesson13_multiple_regression2` | 重回帰（2） |
| `Lesson14_logistic_regression1` | ロジスティック回帰（1） |
| `Lesson15_logistic_regression2` | ロジスティック回帰（2） |
| `Lesson16_propensity_score` | 傾向スコアマッチング・IPW |

その他: `R_assignment_tidyverse100-main/`（課題）、`folder_format/`（フォルダ構成の見本）

---

## 使い方の要点

1. 教材を **指定の保存場所** に置く
2. RStudio や Cursor で `semi_lesson` を開く
3. 各 Lesson フォルダ内の `.R` を上から実行する（データファイルは同じ Lesson フォルダ内）

GitHub 上のファイルを学生側から変更（push）する必要はありません。編集はローカルだけで構いません。
