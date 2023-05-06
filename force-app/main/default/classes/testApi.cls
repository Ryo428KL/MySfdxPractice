@RestResource(urlMapping='/testApi/*')
global with sharing class testApi {
    @HttpPost
    global static void postApiHandler(){
        System.debug('postApiHandler is called');
        // リクエストパラメータ解析
        RestRequest  req = RestContext.request;
        System.debug(req);
    }
}
