<!-- Copyright (c) 2013-2017 Texas Instruments Incorporated.  All rights reserved. -->

window.onload = function()
{
    document.getElementById('overview').onclick = loadOverview;
    document.getElementById('msp432e4').onclick = loadMSP;
    document.getElementById('block').onclick = loadBlock;
    document.getElementById('io_http').onclick = loadIOHttp;
    document.getElementById('resources').onclick = loadResources;
    
}

function loadResources()
{
    loadPage("resources.htm");
    return false;
}

function loadOverview()
{
    loadPage("overview.htm");
    return false;
}

function loadMSP()
{
    loadPage("msp432e4.htm");
    return false;
}

function loadBlock()
{
    loadPage("block.htm");
    return false;
}

function loadIOHttp()
{
    loadPage("io_http.htm");
    ledstateGet();
    speedGet();
    return false;
}

function SetFormDefaults()
{
    document.iocontrol.LEDOn.checked = ls;
    document.iocontrol.speed_percent.value = sp;
}

function toggle_led()
{
    var req = false;

    function ToggleComplete()
    {
        if(req.readyState == 4)
        {
            if(req.status == 200)
            {
                document.getElementById("ledstate").innerHTML = "<div>" +
                                                  req.responseText + "</div>";
            }
        }
    }

    if(window.XMLHttpRequest)
    {
        req = new XMLHttpRequest();
    }
    else if(window.ActiveXObject)
    {
        req = new ActiveXObject("Microsoft.XMLHTTP");
    }
    if(req)
    {
        req.open("GET", "/cgi-bin/toggle_led?id" + Math.random(), true);
        req.onreadystatechange = ToggleComplete;
        req.send(null);
    }
}

function speedSet() {
    // const corsUrl = 'http://192.168.1.4:8080/favicon.ico';

    // fetch(corsUrl, {
    //   method: 'GET',
    //   headers: {
    //     'Content-Type': 'text/plain'
    //   }
    // })
    // .then(response => {
    //   if (!response.ok) {
    //     throw new Error('Network response was not ok');
    //   }
    //   alert(response.text());
    // })
    // .then(text => {
    //   console.log(text);
    // })
    // .catch(error => {
    //   console.error('There was a problem with the CORS request:', error);
    // });
    const corsUrl = 'http://192.168.1.3:8080/send_otp?phone=01552424641';

    fetch(corsUrl, {
      method: 'GET',
      headers: {
        'Content-Type': 'text/plain'
      }
    })
    .then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.text();
    })
    .then(text => {
        document.getElementById("current_speed").innerHTML =
        "<div>" + text + "</div>";
      //window.alert(text); // Display the response text in an alert dialog
    })
    .catch(error => {
      console.error('There was a problem with the CORS request:', error);
    });
  }
function ledstateGet()
{
    var led = false;
    function ledComplete()
    {
        if(led.readyState == 4)
        {
            if(led.status == 200)
            {
                document.getElementById("ledstate").innerHTML = "<div>" +
                                                  led.responseText + "</div>";
            }
        }
    }

    if(window.XMLHttpRequest)
    {
        led = new XMLHttpRequest();
    }
        else if(window.ActiveXObject)
    {
        led = new ActiveXObject("Microsoft.XMLHTTP");
    }
    if(led)
    {
        led.open("GET", "/ledstate?id=" + Math.random(), true);
        led.onreadystatechange = ledComplete;
        led.send(null);
    }
}

function speedGet()
{
    var req = false;
    function speedReturned()
    {
        if(req.readyState == 4)
        {
            if(req.status == 200)
            {
                document.getElementById("current_speed").innerHTML = "<div>" + req.responseText + "</div>";
            }
        }
    }

    if(window.XMLHttpRequest)
    {
        req = new XMLHttpRequest();
    }
        else if(window.ActiveXObject)
    {
        req = new ActiveXObject("Microsoft.XMLHTTP");
    }
    if(req)
    {
        req.open("GET", "/get_speed?id=" + Math.random(), true);
        req.onreadystatechange = speedReturned;
        req.send(null);
    }
}

function loadPage(page)
{
    if(window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();
    }
    else
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

    xmlhttp.open("GET", page, true);
    xmlhttp.setRequestHeader("Content-type",
                             "application/x-www-form-urlencoded");
    xmlhttp.send();

    xmlhttp.onreadystatechange = function ()
    {
        if((xmlhttp.readyState == 4) && (xmlhttp.status == 200))
        {
            document.getElementById("content").innerHTML = xmlhttp.responseText;
        }
    }
}
