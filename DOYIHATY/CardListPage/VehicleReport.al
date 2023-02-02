report 50117 VehicleReport
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Report/Vehicle/VehicleReport.rdl';
    Caption = 'Vehicle Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(VehTable; "DOYIHATY Vehicle Table")
        {
            RequestFilterFields = "Location";
            column(ID; ID) { }
            column(Vehicle; Vehicle) { }
            column(vehType; vehType) { }
            column(Location; Location) { }
            column(Parking_Center; "Parking Center") { }
        }
    }

    labels
    {
        HeaderLabel = 'Result search vehicles in a specific location', Comment = 'Foo', MaxLength = 999, Locked = true;
    }
}