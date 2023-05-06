# MySfdxPractice

## 準備(Salesforce DevHub側)
* 組織上でDev Hub組織を有効化する
  * クイック検索「Dev Hub」→Dev Hubタブ→「Dev Hub を有効」<br>
  **※注意：一度有効化したら元に戻せない**<br>
  ![](img/step1.png)

## 準備(Git~)
* プロジェクトをcloneする
* cloneしてきたディレクトリへ移動してDevHub組織を認証
```
sfdx force:auth:web:login -r orgURL -d -a MyDevHub
```
* スクラッチ組織作成
```
sfdx force:org:create -s -f config/project-scratch-def.json -a myScratch
```
* スクラッチ組織を開く
```
sfdx force:org:open -u myScratch
```

* 組織にソースをpushする
```
sfdx force:source:push -u myScratch
```

* 組織からソースをpullする
```
sfdx force:source:pull -u myScratch
```

* 開発準備用apex実行
```
# 権限セット設定
sfdx force:apex:execute -f scripts/apex/setupPermissionSet.apex -u myScratch
# サンプルデータ設定
sfdx force:apex:execute -f scripts/apex/setupData.apex -u myScratch
```

* 開発環境構築_スクリプト版(スクラッチ環境作成～設定用Apex実行)
```
sh scripts/preparation.sh myScratch
```

* スクラッチ組織のパスワード生成
```
sfdx force:alias:list
sfdx force:user:password:generate --targetusername <username>
```

* workbenchによるREST API実行
```
# 以下のURLから実行可能
https://workbench.developerforce.com/login.php
# REST Explorerを選択して以下でExecute
/services/apexrest/<className>/<methodName>
```
