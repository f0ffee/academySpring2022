pageextension 50147 "Vendor Extension 2" extends "Vendor List"
{
    layout
    {
        addafter(Name)
        {
            field("Inverted Name"; Rec."Inverted Name") { }
        }
    }
    actions
    {
        addlast("Ven&dor")
        {
            action(InvertNames)
            {
                Image = Item;
                ApplicationArea = All;
                Caption = 'Invert Names';
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Category5;
                trigger OnAction()
                var
                    InvertCodeUnit: Codeunit InvertingCodeUnit;
                begin
                    InvertCodeUnit.CreateInvertedNames();
                end;
            }
            action(ResetInvertNames)
            {
                Image = Item;
                ApplicationArea = All;
                Caption = 'Reset Invert Names';
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Category5;
                trigger OnAction()
                var
                    InvertCodeUnit: Codeunit InvertingCodeUnit;
                begin
                    InvertCodeUnit.ResetInvertedNames();
                end;
            }
        }
    }
}