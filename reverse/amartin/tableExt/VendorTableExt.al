tableextension 50112 "VendorTableExt" extends Vendor
{
    fields
    {
        field(50112; "Reverse name"; text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Reverse name';
        }
    }
}