report 50118 UseVehicleReport
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Report/Vehicle/UseVehicleReport.rdl';
    Caption = 'Use Vehicle Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(VehTable; "DOYIHATY Vehicle Table")
        {
            RequestFilterFields = "Car Status";
            column(ID; ID) { }
            column(Vehicle; Vehicle) { }
            column(vehType; vehType) { }
            column(Location; Location) { }
            column(Parking_Center; "Parking Center") { }
            column(Car_Status; "Car Status") { }
        }
    }

    labels
    {
        HeaderLabel = 'Result search vehicles in use', Comment = 'Foo', MaxLength = 999, Locked = true;
    }
}