import { LightningElement } from 'lwc';
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import registerAccount from '@salesforce/apex/myLwcSampleController.registerAccount';
import searchAccount from '@salesforce/apex/myLwcSampleController.searchAccount';

export default class MyLwcSample extends LightningElement {
  get nameValue(){
    const input = this.refs.Name;
    return input.value;
  }
  get searchNameValue(){
    const input = this.refs.searchName;
    return input.value;
  }

  get columns(){
    return [
      { label: 'recordId', fieldName: 'Id' },
      { label: 'お名前', fieldName: 'Name' },
    ];
  }

  registeredData;
  searchData;

  async register(){
    const accountName = this.nameValue;
    const result = await registerAccount({inputName:accountName});
    await this.showRegisterData(result);
    this.showSuccess('取引先を登録しました。','');
  }
  async showRegisterData(account){
    this.registeredData = [account];
  }
  async search(){
    const name = this.searchNameValue;
    const result = await searchAccount({searchName: name});
    this.searchData = result;
  }

  showSuccess(title, message) {
    const evt = new ShowToastEvent({
      title: title,
      message: message,
      variant: "success",
    });
    this.dispatchEvent(evt);
  }
}