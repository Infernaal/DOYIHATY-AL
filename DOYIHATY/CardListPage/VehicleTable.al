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
        }
    }

    keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }
    }
}