codeunit 50000 "Test Try Functions"
{

    procedure TestTryFunction(CallFunction: Integer)
    var
        Customer: Record Customer;
    begin
        Case CallFunction of
            1:
                begin
                    if TryCreateCustomerActual(Customer) then
                        Customer.Insert(true)
                    else
                        Message(GetLastErrorText());
                end;
            2:
                if not TryCreateCustomerWithInsert(Customer) then
                    Message('Error-%1', GetLastErrorText());
            3:
                if not TryCreateCustomerWithModify(Customer) then
                    Message('Error-%1', GetLastErrorText());
            4:
                if not TryCreateCustomerWithDelete(Customer) then
                    Message('Error-%1', GetLastErrorText());
        End;
    end;

    [TryFunction]
    local procedure TryCreateCustomerActual(var Customer: Record Customer)
    begin
        Customer.Init();
        Customer.Validate(Name, 'TryCustomer');
        Customer.Validate("Gen. Bus. Posting Group", 'IN');
    end;

    [TryFunction]
    local procedure TryCreateCustomerWithInsert(var Customer: Record Customer)
    begin
        Customer.Init();
        Customer.Validate(Name, 'TryCustomer');
        Customer.Insert(true);
    end;

    [TryFunction]
    local procedure TryCreateCustomerWithModify(var Customer: Record Customer)
    begin
        Customer.SetRange(Name, 'TryCustomer');
        IF Customer.FindFirst() then begin
            Customer.Validate(Blocked, Customer.Blocked::All);
            Customer.Modify(true);
        end;
    end;

    [TryFunction]
    local procedure TryCreateCustomerWithDelete(var Customer: Record Customer)
    begin
        Customer.SetRange(Blocked, Customer.Blocked::All);
        IF Customer.FindFirst() then
            Customer.Delete(true);
    end;

    // [TryFunction]
    // local procedure TryCreateCustomerWithReturn(var Customer: Record Customer): Boolean
    // begin
    //     Customer.Init();
    //     Customer.Validate(Name, 'TryCustomer');
    //     Customer.Insert();
    // end;
}