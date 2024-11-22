import { LightningElement ,api } from 'lwc';

export default class MyLwcSampleChild extends LightningElement {
  @api get account(){
    console.log(`getter ${this._account}`);
    return this._account;
  };
  set account(val){
    console.log(`setter ${val}`);
    this._account=val;
  }
  _account;

  get columns(){
    return [
      { label: 'recordId', fieldName: 'Id' },
      { label: 'お名前', fieldName: 'Name' },
    ];
  }
}