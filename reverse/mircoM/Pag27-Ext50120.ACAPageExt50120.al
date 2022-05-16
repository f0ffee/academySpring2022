pageextension 50120 "ACAPageExt50120" extends "Vendor List" //27
{
    layout
    {
        addafter(name)
        {
            field("ACA Reverse Name"; Rec."ACA Reverse Name")
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
                Caption = 'Fill reverese';
                ToolTip = 'Fill the reverse Name field for each vendor';
                trigger OnAction()
                var
                    Vendor: Record Vendor;
                begin
                    if Vendor.FindSet() then
                        repeat
                            Vendor."ACA Reverse Name" := ReveseString(Vendor.Name);
                            Vendor.Modify();
                        until Vendor.Next() = 0;
                end;
            }
        }
    }
    local procedure ReveseString(Name: text[100]) ReversedName: Text[100]
    var
        i: Integer;
    begin
        for i := StrLen(Name) downto 1 do
            ReversedName += CopyStr(Name, i, 1);

    end;
}