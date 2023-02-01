page 50111 MainPage
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Main Page';

    layout
    {
        area(Content)
        {
            group("Information")
            {
                Caption = 'The document was created for quick navigation through the created pages. You can view each page using the Action panel.';
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

            action("Vehicle Card")
            {
                ApplicationArea = All;
                RunObject = page "Card Page by DOYIHATY";
                Image = Card;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction();
                begin

                end;
            }

            action("Document Page")
            {
                ApplicationArea = All;
                RunObject = page "Document Page by DOYIHATY";
                Image = Document;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction();
                begin

                end;
            }
        }
    }
}