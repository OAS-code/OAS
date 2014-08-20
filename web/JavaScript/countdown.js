function calcage(secs, num1, num2) {
    s = ((Math.floor(secs / num1)) % num2).toString();
    if (LeadingZero && s.length < 2)
        s = "0" + s;
    return "<b>" + s + "</b>";
}

function CountBack(secs) {
    if (secs < 0) {
        document.getElementById("countdown1").innerHTML = FinishMessage;
        return;
    }
    DisplayStr = DisplayFormat.replace(/%%D%%/g, calcage(secs, 86400, 100000));
    DisplayStr = DisplayStr.replace(/%%H%%/g, calcage(secs, 3600, 24));
    DisplayStr = DisplayStr.replace(/%%M%%/g, calcage(secs, 60, 60));
    DisplayStr = DisplayStr.replace(/%%S%%/g, calcage(secs, 1, 60));
    
    document.getElementById("countdown1").innerHTML = DisplayStr;
    if (CountActive) {
        var SetTimeOutPeriod = (Math.abs(CountStepper) - 1) * 1000 + 990;
        setTimeout("CountBack(" + (secs + CountStepper) + ")", SetTimeOutPeriod);
    }
}


if (typeof (DisplayFormat) == "undefined")
    DisplayFormat = "%%D%%:%%H%%:%%M%%:%%S%%";
if (typeof (CountActive) == "undefined")
    CountActive = true;
if (typeof (FinishMessage) == "undefined")
    FinishMessage = "Auction Closed";
if (typeof (CountStepper) != "number")
    CountStepper = -1;
if (typeof (LeadingZero) == "undefined")
    LeadingZero = true;

function startCountdown(TargetDate) {
    if (!TargetDate){
        TargetDate = "12/31/2020 5:00 AM";
    }

    document.write("<span id='countdown1'></span>");
    CountStepper = Math.ceil(CountStepper);
    if (CountStepper == 0)
        CountActive = false;
    var dthen = new Date(TargetDate);
    var dnow = new Date();
    if (CountStepper > 0)
        ddiff = new Date(dnow - dthen);
    else
        ddiff = new Date(dthen - dnow);
    gsecs = Math.floor(ddiff.valueOf() / 1000);
    CountBack(gsecs);
}
