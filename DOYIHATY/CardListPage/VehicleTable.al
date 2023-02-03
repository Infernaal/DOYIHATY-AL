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
        field(6; "Place Truck"; Text[50])
        {
        }
        field(7; "Car Status"; Text[15])
        {
        }
        field(8; "ID Parking Center"; Text[50])
        {
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

    trigger OnModify()
    begin
        case Location of
            Location::Kyiv:
                begin
                    "Parking Center" := 'Parking Center A';
                    "ID Parking Center" := UpperCase("Parking Center".Replace(' ', '-'));
                end;
            Location::Sumy:
                begin
                    "Parking Center" := 'Parking Center B';
                    "ID Parking Center" := UpperCase("Parking Center".Replace(' ', '-'));
                end;
            Location::Cherkasy:
                begin
                    "Parking Center" := 'Parking Center C';
                    "ID Parking Center" := UpperCase("Parking Center".Replace(' ', '-'));
                end;
            Location::Lviv:
                begin
                    "Parking Center" := 'Parking Center D';
                    "ID Parking Center" := UpperCase("Parking Center".Replace(' ', '-'));
                end;
            Location::Rivne:
                begin
                    "Parking Center" := 'Parking Center E';
                    "ID Parking Center" := UpperCase("Parking Center".Replace(' ', '-'));
                end;
            Location::Sevastopol:
                begin
                    "Parking Center" := 'Parking Center F';
                    "ID Parking Center" := UpperCase("Parking Center".Replace(' ', '-'));
                end;
        end;
    end;
}