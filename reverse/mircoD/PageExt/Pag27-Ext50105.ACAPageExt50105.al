pageextension 50105 "ACA Page Ext 50105" extends "Vendor List" //27
{
    layout
    {
        addafter(Name)
        {
            field("ACA Reversed Name"; Rec."ACA Reversed Name")
            {
                Caption = 'Reversed Name';
                ApplicationArea = ALL;
                ToolTip = 'Writes the reversed Name of the vendor';
            }
        }
    }

    actions
    {
        addfirst("Ven&dor")
        {
            action(ReverseName)
            {
                ApplicationArea = ALL;
                Caption = 'Reverse Name';
                ToolTip = 'Fill the Reverse Name field for each Vendor';
                Image = Action;

                trigger OnAction()
                var
                    Vend: Record Vendor;
                    RevName: Text[100];
                    i: Integer;
                    lenght: Integer;

                begin
                    // Filters to calculate field only if it is empty
                    Vend.SetFilter("ACA Reversed Name", '');

                    if Vend.FindSet() then
                        repeat
                            Vend."ACA Reversed Name" := ReverseString(Vend.Name);
                            Vend.Modify();
                        until Vend.Next() = 0;
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
    end;

}