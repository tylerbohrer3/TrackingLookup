^!t::                                                                                               ;look up selected UPS or Fedex tracking number
trackingNumber(Length, date, mLength, dLength)
If (Length = 10 OR Length = 15 OR Length = 34 OR Length = 22)
    run https://www.fedex.com/apps/fedextrack/?action=track&tracknumbers=%Clipboard%&action=track&language=english&state=0&cntry_code=us
If (Length = 12){
    StringSplit, characters, Clipboard
    num = 0
    Loop, 9{
        num += 1
        character = characters%num%
        If %character% is alpha
            return
    }
    num += 1
    character = characters%num%
    If %character% is alpha
    {
        num += 1
        character = characters%num%
        If %character% is alpha
        {
            num += 1
            character = characters%num%
            If %character% is alpha
            {
                Clipboard = %characters1%%characters2%%characters3%%characters4%%characters5%%characters6%%characters7%%characters8%%characters9%
                run http://ltl.upsfreight.com/shipping/tracking/TrackingDetail.aspx?TrackProNumber=%Clipboard%
            }
        }
    }
   If %character% is digit
   {
        num += 1
        character = characters%num%
        If %character% is digit
        {
            num += 1
            character = characters%num%
            If %character% is digit
            {
                run https://www.fedex.com/apps/fedextrack/?action=track&tracknumbers=%Clipboard%&action=track&language=english&state=0&cntry_code=us
            }
        }
    }
}
if (Length = 18)
    run https://wwwapps.ups.com/WebTracking/processInputRequest?InquiryNumber1=%Clipboard%&sort_by=status&tracknums_displayed=1&TypeOfInquiryNumber=T&track.x=0&track.y=0
if (Length = 9)
    run http://ltl.upsfreight.com/shipping/tracking/TrackingDetail.aspx?TrackProNumber=%Clipboard%
return

trackingNumber(ByRef Length, ByRef Date, ByRef mLength, ByRef dLength){
    sleep 50
    SendInput ^c
    sleep 50
    StringReplace, Clipboard, Clipboard, %A_Space%, , 1
    StringReplace, Clipboard, Clipboard, %A_Tab%, , 1
    StringReplace, Clipboard, Clipboard, `,, , 1
    StringReplace, Clipboard, Clipboard, `., , 1
    StringReplace, Clipboard, Clipboard, `?, , 1
    StringReplace, Clipboard, Clipboard, `-, , 1
    StringReplace, Clipboard, Clipboard, `*, , 1
    StringReplace, Clipboard, Clipboard, `+, , 1
    StringReplace, Clipboard, Clipboard, `r, , 1
    StringReplace, Clipboard, Clipboard, `n, , 1
    StringReplace, Clipboard, Clipboard, ``, , 1
    StringReplace, Clipboard, Clipboard, `@, , 1
    StringReplace, Clipboard, Clipboard, `#, , 1
    StringReplace, Clipboard, Clipboard, `&, , 1
    StringReplace, Clipboard, Clipboard, `_, , 1
    StringReplace, Clipboard, Clipboard, `', , 1
    StringReplace, Clipboard, Clipboard, `", , 1
    StringReplace, Clipboard, Clipboard, `;, , 1
    StringReplace, Clipboard, Clipboard, `:, , 1
    StringReplace, Clipboard, Clipboard, `(, , 1
    StringReplace, Clipboard, Clipboard, `), , 1
    StringReplace, Clipboard, Clipboard, `=, , 1
    FormatTime, Date,,M
    StringLen, MLength, Date
    FormatTime, Date,,d
    StringLen, dLength, Date
    FormatTime, Date,,M/d
    StringLen, Length, Clipboard
    return 
}