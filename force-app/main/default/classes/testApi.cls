@RestResource(urlMapping='/testApi/*')
global with sharing class testApi {
    @HttpPost
    global static void postApiHandler(){
        System.debug('postApiHandler is called');
        RestRequest  req = RestContext.request;
        System.debug(req);
        // リクエストパラメータを見る
        System.debug(req.params);
        // リクエストボディも見る
        System.debug(req.requestBody.toString());
    }
}
