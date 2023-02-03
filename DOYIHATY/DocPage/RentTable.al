table 50113 "Rent Order Table"
{
    DataClassification = ToBeClassified;
    Caption = 'Rent Order Table by DOYIHATY';

    fields
    {
        field(1; "No."; Text[5])
        {
        }
        field(2; "First Name"; Text[50])
        {
        }
        field(3; "Middle Name"; Text[50])
        {
        }
        field(4; "Last Name"; Text[50])
        {
        }
        field(5; "Phone Number"; Code[15])
        {
        }
        field(6; "E-Mail"; Text[50])
        {
        }
        field(7; Sex; Enum Sex)
        {
        }
        field(8; "Car Type"; Enum VehicleType)
        {
        }
        field(9; "Desired Car"; Text[50])
        {
        }
        field(10; "Pick-up Location"; Enum Loc)
        {
        }
        field(11; "Drop-off Location"; Enum Loc)
        {
        }
        field(12; "Pick-up Date"; DateTime)
        {
        }
        field(13; "Drop-off Date"; DateTime)
        {
        }
        field(14; Status; Text[10])
        {
        }
    }

    keys
    {
        key(PrimaryKey; "No.")
        {
            Clustered = true;
        }
        key(SecondaryKey; "First Name")
        {
        }
        key(TertiaryKey; "Last Name")
        {
        }
        key(QuaternaryKey; Status)
        {
        }
    }

    trigger OnModify()
    var
        VehT: Record "DOYIHATY Vehicle Table";
    begin
        VehT.Reset();
        VehT.SetRange(Vehicle, Rec."Desired Car");

        if VehT.FindFirst() AND (Rec.Status = 'Open') then begin
            VehT."Car Status" := 'In Use';
            VehT.Modify(true);
        end else begin
            VehT."Car Status" := 'Not In Use';
        end;
    end;

}