pageextension 50112 VendorPageExt extends "Vendor Card"
{
    layout
    {
        addafter(Name)
        {
            field("Reverse name"; rec."Reverse name")
            {
                ApplicationArea = all;
            }

        }
    }

    actions
    {
        addafter("Co&mments")
        {
            action("ReverseName")
            {
                Promoted = true;
                PromotedOnly = true;
                ApplicationArea = All;
                Caption = 'ReverseName';
                trigger OnAction()
                var
                    Vendor: Record "Vendor";
                begin
                    if Vendor.FindSet() then
                        repeat
                            Vendor."Reverse name" := ReverseString(Vendor.Name);
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
        for i := StrLen(Name) downto 1 do;
        ReversedName += CopyStr(Name, i, 1);
    end;
}