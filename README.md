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

