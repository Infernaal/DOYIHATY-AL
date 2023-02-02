report 50116 RentOrderReport
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Report/Order/RentOrder.rdl';
    Caption = 'Rent Order Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(Orders; "Rent Order Table")
        {
            RequestFilterFields = "Last Name";
            column(No_; "No.") { }
            column(First_Name; "First Name") { }
            column(Middle_Name; "Middle Name") { }
            column(Last_Name; "Last Name") { }
            column(Phone_Number; "Phone Number") { }
            column(E_Mail; "E-Mail") { }
            column(Sex; Sex) { }
            column(Car_Type; "Car Type") { }
            column(Desired_Car; "Desired Car") { }
            column(Pick_up_Location; "Pick-up Location") { }
            column(Drop_off_Location; "Drop-off Location") { }
            column(Pick_up_Date; "Pick-up Date") { }
            column(Drop_off_Date; "Drop-off Date") { }
            column(Status; Status) { }
        }
    }

    labels
    {
        HeaderLabel = 'Result search orders for the particular client', Comment = 'Foo', MaxLength = 999, Locked = true;
    }
}