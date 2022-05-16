pageextension 50120 "ACAPageExt50120" extends "Vendor List" // 27
{
    layout
    {
        addafter(Name)
        {
            field("Reverse Name"; Rec."ACA Reverse Name")
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
                ToolTip = 'Fill the Reverse Name field for each Vendor.';

                trigger OnAction()
                var
                    Vendor: Record Vendor;
                begin
                    //Vendor.SetRange("ACA Reverse Name", '');
                    if Vendor.FindSet() then
                        repeat
                            Vendor."ACA Reverse Name" := ReverseString(Vendor.Name);
                            Vendor.Modify();
                        until Vendor.Next() = 0;
                end;
            }
        }
    }

    local procedure ReverseString(Name: Text[100]) ReversedName: Text[100]
    var
        i: Integer;
    begin
        for i := StrLen(Name) downto 1 do
            ReversedName += CopyStr(Name, i, 1);
        // ReversedName := ReversedName + CopyStr(Name, i, 1);
    end;

    // local procedure ReverseString(Name: Text[100]): Text[100]
    // var
    //     i: Integer;
    //     ReversedName: Text[100];
    // begin
    //     for i := StrLen(Name) downto 1 do
    //         ReversedName += CopyStr(Name, i, 1);

    //     exit(ReversedName);
    // end;
}