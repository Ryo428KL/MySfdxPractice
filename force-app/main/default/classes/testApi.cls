@RestResource(urlMapping='/testApi/*')
global with sharing class testApi {
    @HttpPost
    global static void postApiHandler(){
        System.debug('postApiHandler is called');
        RestRequest  req = RestContext.request;
        System.debug(req);
        // ヘッダーを見る
        System.debug(req.headers);        
        // リクエストパラメータを見る
        System.debug(req.params);
        // リクエストボディも見る
        System.debug(req.requestBody.toString());
        // リクエストURIも見る
        System.debug(req.requestURI);
    }
}
