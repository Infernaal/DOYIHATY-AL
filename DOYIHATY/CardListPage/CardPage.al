page 50104 "Card Page by DOYIHATY"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "DOYIHATY Vehicle Table";
    Caption = 'Card Page by DOYIHATY';

    layout
    {
        area(Content)
        {
            group("Vehicle Information")
            {
                grid(GeneralGrid)
                {
                    group(General)
                    {
                        field(ID; Rec.ID)
                        {
                            ApplicationArea = All;
                            ToolTip = 'Unique ID of each car in the system.';
                        }
                        field(Vehicle; Rec.Vehicle)
                        {
                            ApplicationArea = All;
                            ToolTip = 'Indicates the make of the vehicle manufacturer.';
                        }
                        field(vehType; Rec.vehType)
                        {
                            ApplicationArea = All;
                            ToolTip = 'Indicates vehicle type.';
                        }
                        field(Location; Rec.Location)
                        {
                            ApplicationArea = All;
                            ToolTip = 'Indicates the location of the car in services in Ukraine.';
                        }
                        field("Parking Center"; Rec."Parking Center")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Indicates the presence of slots for tracks at the parking center and automatically add to the table.';
                            Editable = false;
                        }
                    }
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Vehicle List")
            {
                ApplicationArea = All;
                RunObject = page "List Page by DOYIHATY";
                Image = ListPage;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction();
                begin

                end;
            }

            action("Main Page")
            {
                ApplicationArea = All;
                RunObject = page MainPage;
                Image = ViewPage;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction();
                begin

                end;
            }

            action("Avaliable Vehicle Message")
            {
                ApplicationArea = All;
                Image = Email;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction();
                var
                    CarT: Record "DOYIHATY Vehicle Table";
                    VehicleCount: Integer;
                begin
                    VehicleCount := 0;
                    CarT.Reset();
                    CarT.SetFilter("Car Status", '%1', 'Not In Use');
                    if CarT.FindSet(true) then
                        repeat
                            VehicleCount += 1;
                        until CarT.Next = 0;
                    Message('Number of available vehicles in all parking centers: %1', Format(VehicleCount));
                end;
            }
        }

        area(Reporting)
        {
            action("Vehicle Report")
            {
                ApplicationArea = All;
                RunObject = report VehicleReport;
                Image = Report;
                Promoted = true;
                PromotedCategory = Report;
                trigger OnAction();
                begin

                end;
            }

            action("Use Vehicle Report")
            {
                ApplicationArea = All;
                RunObject = report UseVehicleReport;
                Image = Report;
                Promoted = true;
                PromotedCategory = Report;
                trigger OnAction();
                begin

                end;
            }
        }
    }

    var
        Loc: Enum Loc;
        Car: Enum VehicleType;

    trigger OnModifyRecord(): Boolean
    begin
        if (Rec.Location = Loc::Kyiv) OR (Rec.Location = Loc::Sumy) OR (Rec.Location = Loc::Cherkasy)
        then begin
            Rec."Parking Center" := 'Have truck slot';
        end else begin
            Rec."Parking Center" := 'Not have truck slot';
        end;

        if (Rec.vehType = Car::Truck) AND (Rec.Location = Loc::Lviv) OR (Rec.Location = Loc::Rivne) OR (Rec.Location = Loc::Sevastopol)
        then begin
            Message('The selected car type is not available in this location.');
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Parking Center" := 'Automatically added based on location';
    end;
}