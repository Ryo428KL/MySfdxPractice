// サンプルデータ作成
SampleParent__c sampleParent = new SampleParent__c(Name='サンプル親オブジェクト1');
insert sampleParent;
SampleChild__c sampleChild = new SampleChild__c(Name='サンプル子オブジェクト1', SampleParent__c=sampleParent.Id);
insert sampleChild;
SampleGrandChild__c sampleGrandChild = new SampleGrandChild__c(Name='サンプル孫オブジェクト1', SampleChild__c=sampleChild.Id);
insert sampleGrandChild;
