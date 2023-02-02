table 50103 "DOYIHATY Vehicle Table"
{
    DataClassification = ToBeClassified;
    Caption = 'Data Table by DOYIHATY';

    fields
    {
        field(1; ID; Code[5])
        {
            NotBlank = true;
            DataClassification = ToBeClassified;
        }
        field(2; Vehicle; Text[30])
        {
        }
        field(3; vehType; Enum VehicleType)
        {
        }
        field(4; Location; Enum Loc)
        {
        }
        field(5; "Parking Center"; Text[50])
        {
        }
        field(6; "Car Status"; Text[15])
        {
            trigger OnValidate()
            var
                VehT: Record "DOYIHATY Vehicle Table";
            begin
                if VehT.Get(ID) then
                    "Car Status" := 'Not In Use';
            end;
        }
    }

    keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }
        key(SK; Vehicle)
        {

        }
        key(TK; "Car Status")
        {

        }
    }
}