# MySfdxPractice

## 準備(Salesforce DevHub側)
* 組織上でDev Hub組織を有効化する
  * クイック検索「Dev Hub」→Dev Hubタブ→「Dev Hub を有効」<br>
  **※注意：一度有効化したら元に戻せない**<br>
  ![](img/step1.png)

## 準備(Git~)
* プロジェクトをclone

* 以下コマンドを実行する
```
npm install
```

* cloneしてきたディレクトリへ移動してDevHub組織を認証
```
sf auth web login -r orgURL -d -a MyDevHub
```
* スクラッチ組織作成
```
sf org create scratch -f config/project-scratch-def.json -a myScratch -y 30
```
* スクラッチ組織を開く
```
sf org open -o myScratch
```

* 組織にソースをpushする
```
sf project deploy start -o myScratch
```

* 組織からソースをpullする
```
sf project retrieve start -o myScratch
```

* 開発準備用apex実行
```
# 権限セット設定
sf apex run -f scripts/apex/setupPermissionSet.apex -o myScratch
# サンプルデータ設定
sf apex run -f scripts/apex/setupData.apex -o myScratch
```

* 開発環境構築_スクリプト版(スクラッチ環境作成～設定用Apex実行)
```
sh scripts/preparation.sh myScratch
```

* スクラッチ組織のパスワード生成
```
sf org list
sf org generate password -o <username>
sf org display -o <orgName>
```

* スクラッチ組織の削除
```
sf org scratch delete -o <orgname>
```

* workbenchによるREST API実行
```
# 以下のURLから実行可能
https://workbench.developerforce.com/login.php
# REST Explorerを選択して以下でExecute
/services/apexrest/<className>/<methodName>
```

# プラグイン練習
## pulgin
https://github.com/Kitalive-Inc/sfdx-plugin/tree/main

```
sf plugins install @kitalive/sfdx-plugin
```

### 練習1 オブジェクトの項目の追加
* 例1 SampleChild__cに選択リスト「TestPiclList__c」を追加して選択リスト値「test1:項目1」、「test2:項目2」を設定する ※「<API参照名>:<ラベル>」

```
sf kit object fields setup -s SampleChild__c -f pulgins/csv/SampleChild__c_fields.csv
```

* 例2 追加した選択リスト「TestPiclList__c」の選択リスト値「test1:項目1」、「test2:項目2」を無効化し、「項目3:test3」、「項目4:test4」を設定する

```
sf kit object fields setup -s SampleChild__c -f pulgins/csv/SampleChild__c_fields_2.csv
```
上記コマンド実行後、既存選択リスト値「test1:項目1」、「test2:項目2」は **ラベルがAPI参照名となり** 無効化された選択リスト値へ更新され、新規で「項目3:test3」、「項目4:test4」が作成される。

