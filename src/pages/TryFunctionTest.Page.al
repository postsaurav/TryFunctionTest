page 50000 "Try Function Test"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group("Test Try")
            {
                field(ActualTry; ActualTry)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    trigger OnDrillDown()
                    begin
                        TryTesting.TestTryFunction(1);
                    end;
                }
                field(InsertTry; InsertTry)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    trigger OnDrillDown()
                    begin
                        TryTesting.TestTryFunction(2);
                    end;
                }
                field(ModifyTry; ModifyTry)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    trigger OnDrillDown()
                    begin
                        TryTesting.TestTryFunction(3);
                    end;
                }
                field(DeleteTry; DeleteTry)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    trigger OnDrillDown()
                    begin
                        TryTesting.TestTryFunction(4);
                    end;
                }
            }
        }
    }
    var
        ActualTry: Label 'Actual Try';
        InsertTry: Label 'Insert Try';
        ModifyTry: Label 'Modify Try';
        DeleteTry: Label 'Delete Try';
        TryTesting: Codeunit "Test Try Functions";
}