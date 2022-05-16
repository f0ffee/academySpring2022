codeunit 50140 "InvertingCodeUnit"
{
    // trigger OnRun();
    // begin
    //     CreateInvertedNames();
    // end;

    internal procedure CreateInvertedNames()
    var
        VendorRecord: Record "Vendor";
    begin
        VendorRecord.Init();
        // NutrInfo."Item No." := ItemNo;
        VendorRecord.SetRange("Inverted Name", '');
        if (VendorRecord.FindSet) then
            repeat
                // process record  
                // J := 0;
                // FOR I := StrLen(VendorRecord.Name) DOWNTO 1 DO BEGIN
                //     J += 1;
                //     InvertedName[J] := VendorRecord.Name[I];
                // END;
                InvertedName := ReverseString(VendorRecord.Name);
                VendorRecord."Inverted Name" := InvertedName;
                VendorRecord.Validate("Inverted Name");
                VendorRecord.Modify();
                System.Clear(InvertedName);
            until (VendorRecord.Next = 0);
    end;

    internal procedure ResetInvertedNames()
    var
        VendorRecord: Record "Vendor";
    begin
        VendorRecord.Init();
        System.Clear(InvertedName);
        // NutrInfo."Item No." := ItemNo;
        if (VendorRecord.FindSet) then
            repeat
                VendorRecord."Inverted Name" := InvertedName;
                VendorRecord.Validate("Inverted Name");
                VendorRecord.Modify();
            until (VendorRecord.Next = 0);
    end;


    var
        InvertedName: Text[100];
        J, I : Integer;
    local procedure ReverseString(VendorRecord: Text[100]): Text[100]
    var
        j, i : Integer;
        InvertedName: Text[100];
    begin
        j := 0;
        FOR i := StrLen(VendorRecord) DOWNTO 1 DO BEGIN
            j += 1;
            InvertedName[j] := VendorRecord[i];
        end;
        exit(InvertedName);
    end;

}