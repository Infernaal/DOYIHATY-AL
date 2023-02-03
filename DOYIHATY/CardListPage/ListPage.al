page 50105 "List Page by DOYIHATY"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "DOYIHATY Vehicle Table";
    CardPageId = "Card Page by DOYIHATY";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(List)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                }
                field(Vehicle; Rec.Vehicle)
                {
                    ApplicationArea = All;
                }
                field(vehType; Rec.vehType)
                {
                    ApplicationArea = All;
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = All;
                }
                field("Parking Center"; Rec."Parking Center")
                {
                    ApplicationArea = All;
                }
                field("Place Truck"; Rec."Place Truck")
                {
                    ApplicationArea = All;
                }
                field("Car Status"; Rec."Car Status")
                {
                    ApplicationArea = All;
                }
                field("ID Parking Center"; Rec."ID Parking Center")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
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
        }
    }
}