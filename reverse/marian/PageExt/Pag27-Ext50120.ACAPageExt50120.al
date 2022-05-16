pageextension 50120 "ACAPageExt50120" extends "Vendor List" //27
{
    layout
    {
        addafter(Name)
        {

            field("ACA Reversed Name"; Rec."ACA Reversed Name")
            {
                ApplicationArea = All;
            }
        }

    }

    actions
    {
        addfirst("Ven&dor")
        {
            action(FillReverse)
            {
                ApplicationArea = All;
                Caption = 'Fill reverse';
                ToolTip = 'Fill the Reverse name field for each Vendor.';

                trigger OnACtion()
                var
                    Vendor: Record Vendor;
                begin
                    if Vendor.FindSet() then
                        repeat
                        until Vendor.Next() = 0
                end;
            }
        }
    }

    var
        myInt: Integer;
}