import ballerinax/trigger.asgardeo;
import ballerina/http;
import ballerina/log;

configurable asgardeo:ListenerConfig config = ?;

listener http:Listener httpListener = new(8090);
listener asgardeo:Listener webhookListener =  new(config,httpListener);

service asgardeo:LoginService on webhookListener {
  
    remote function onLoginSuccess(asgardeo:LoginSuccessEvent event ) returns error? {
      log:printInfo(event.toJsonString());
    }
    
    remote function onUserAdd(asgardeo:AddUserEvent event ) returns error? {
      log:printInfo(event.toJsonString());
    }
   
}

service /ignore on httpListener {}
