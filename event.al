codeunit 50103 MySubscriber1
{
    EventSubscriberInstance=StaticAutomatic;
    
    trigger OnRun();
    begin
    end;

    [EventSubscriber(ObjectType::Page, 21, 'OnModifyRecordEvent','',true, true)]
    procedure CheckAddressLine(Rec : Record Customer);
    var 
        Client :HttpClient;
        RequestMessage : HttpRequestMessage;
        ResponseMessage : HttpResponseMessage;
        Content: Text;
    begin
        Message(Rec.Name);
        Message(Rec.Address);
        RequestMessage.Method('Get');
        RequestMessage.SetRequestUri('https://www.google.com');
        Client.Send(RequestMessage, ResponseMessage);
        ResponseMessage.Content().ReadAs(Content);

        Message(Content); 
    end;
}