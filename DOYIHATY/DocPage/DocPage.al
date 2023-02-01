page 50112 "Document Page by DOYIHATY"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Rent Order Table";
    Caption = 'Document Page by DOYIHATY';

    layout
    {
        area(Content)
        {
            group("Rent Order Form")
            {
                grid(GeneralGrid)
                {
                    group("Personal Information")
                    {
                        field("No."; Rec."No.")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Indicates order number.';
                        }
                        field("First Name"; Rec."First Name")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Specifies the name of the tenant.';
                        }
                        field("Middle Name"; Rec."Middle Name")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Specifies the patronymic of the tenant.';
                        }
                        field("Last Name"; Rec."Last Name")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Specifies the last name of the tenant.';
                        }
                        field("Phone Number"; Rec."Phone Number")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Specifies the tenant''s phone number.';
                        }
                        field("E-Mail"; Rec."E-Mail")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Specifies tenant''s email.';
                        }
                        field(Sex; Rec.Sex)
                        {
                            ApplicationArea = All;
                            ToolTip = 'Specifies the gender of the tenant.';
                        }
                    }
                    group("Rent Information")
                    {
                        field("Car Type"; Rec."Car Type")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Indicates vehicle type.';
                        }
                        field("Desired Car"; Rec."Desired Car")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Indicates the desired car.';

                            trigger OnLookup(var Text: Text): Boolean
                            var
                                CarL: Record "DOYIHATY Vehicle Table";
                                CarType: Enum VehicleType;
                            begin
                                CarL.Reset();
                                if (Page.RunModal(Page::"List Page by DOYIHATY", CarL) = Action::LookupOK) AND (Rec."Car Type" = CarL.vehType)
                                then begin
                                    Rec."Desired Car" := CarL.Vehicle;
                                    Rec."Pick-up Location" := CarL.Location;
                                end else begin
                                    Message('A vehicle with a different type than the one specified in the "Car Type" field has been selected.');
                                end;
                            end;
                        }
                        field("Pick-up Location"; Rec."Pick-up Location")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Indicates the location of the car pickup.';

                        }
                        field("Drop-off Location"; Rec."Drop-off Location")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Indicates the location of the car drop off.';
                        }
                        field("Pick-up Date"; Rec."Pick-up Date")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Indicates the date and time of pick up of the car.';
                        }
                        field("Drop-off Date"; Rec."Drop-off Date")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Indicates the date and time of drop off of the car.';
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

        area(Reporting)
        {
            action("Rent Order Report")
            {
                ApplicationArea = All;
                RunObject = report RentOrderReport;
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
        Date: Date;
        Time: Time;
        DateTime: DateTime;

    trigger OnModifyRecord(): Boolean
    begin
        Date := Today;
        Time := Time;
        DateTime := CreateDateTime(Date, Time);
        if (Rec."Drop-off Date" <= DateTime)
        then begin
            Rec.Status := 'Open';
        end else begin
            Rec.Status := 'Closed';
        end;
    end;
}