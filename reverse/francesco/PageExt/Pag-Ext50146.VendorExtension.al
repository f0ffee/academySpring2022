pageextension 50146 "Vendor Extension" extends "Vendor Card"
{
    layout
    {
        addafter(General)
        {
            group(Inverted)
            {
                field("Inverted Name"; Rec."Inverted Name") { }
            }
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
                PromotedCategory = Category4;
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
                PromotedCategory = Category4;
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