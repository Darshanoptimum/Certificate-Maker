$(document).ready(function () {
    $("#signup").click(function () {
        $("#first").fadeOut("fast", function () {
            $("#second").fadeIn("fast");
        });
    });

    $("#signin").click(function () {
        $("#second").fadeOut("fast", function () {
            $("#first").fadeIn("fast");
        });
    });

    $('#Create').click(function () {

        $.ajax({
            type: 'POST',
            url: "https://localhost:44390/api/addUser",

            dataType: 'json',
            data: {
                User_name: $("#newName").val(),
                Email: $("#newEmail").val(),
                User_password: $("#newPassword").val()

            },

            success: function (data) {
                let res = JSON.stringify(data);
                if (res == 1) {
                    $("#errorMessage").append("<b>Your account has been successfully created.</b>");
                } else {
                    $("#signup").click();
                }
            }
        });

    });



    $('#log').click(function () {

        $.ajax({
            type: 'POST',
            url: "https://localhost:44390/api/findUser",

            dataType: 'json',
            data: {
                User_name: $("#name").val(),
                Email: $("#email").val(),
                User_password: $("#password").val()
            },

            success: function (data1) {
                let res1 = JSON.stringify(data1);
                if (res1 == 0) {
                    $("#Message").append("<b>Wrong user details.</b>");
                } else {

                    sessionStorage.setItem("id", res1);
                    window.location.href = "mid.html";
                    console.log(res1)
                }
            }
        });
        sessionStorage.setItem("name", $("#name").val());
    });

    $("#AddCertificate").click(function () {
        window.location.href = "CertificateDetails.html";
    });

    $("#ViewCertificate").click(function () {
        window.location.href = "AllCertificate.html";
    });

    $("#viewc").click(function () {
        $.ajax({
            type: 'POST',
            url: "https://localhost:44390/api/getAllCertificate",

            dataType: 'json',
            data: {
                UserId: sessionStorage.getItem("id")
            },
            success: function (data1) {
                let res1 = JSON.stringify(data1);
                $("#tableBody").empty();
                $.each(JSON.parse(res1), function (indexInArray, res2) {
                    
                    
                    $("#tableBody").append(`<tr><th>${indexInArray + 1}</th><td>${res2.CourseName}</td><td>${res2.startDate}</td><td>${res2.endDate}</td><td>${res2.Date}</td><td><button type="button" value="${res2.Id}" Onclick ="listen(${res2.Id})" class="dwn1 btn btn-block mybtn btn-primary tx-tfm"><b>↓</b></button></td><td><button type="button" value="${res2.Id}" Onclick ="sendmail(${res2.Id})" class="dwn1 btn btn-block mybtn btn-primary tx-tfm">✉</button></td></tr>`);
                });
            }
        });
    });


    $(".dwn1").click(function () {
        console.log(sessionStorage.getItem("name"))
        $.ajax({
            type: 'POST',
            url: "https://localhost:44390/api/downloadCertificate",

            dataType: 'json',
            data: {
                Id: $("#dwn1").val(),
                UserId: sessionStorage.getItem("id"),
                UserName: sessionStorage.getItem("name")
            },
            success: function (data) {
                var b64 = data;
                var link = document.createElement('a');
                link.innerHTML = 'Download PDF file';
                link.download = 'file.pdf';
                link.href = 'data:application/octet-stream;base64,' + b64;
                console.log(data);
                link.click();
            }
        });
    });



    $('#Add').click(function () {
        $.ajax({
            type: 'POST',
            url: "https://localhost:44390/api/insertCertificate",

            dataType: 'json',
            data: {
                UserId: sessionStorage.getItem("id"),
                CourseName: $("#name").val(),
                startDate: $("#startdate").val(),
                endDate: $("#enddate").val()
            },

            success: function (data) {
                //const basedata = data;
                // const blob = URL.createObjectURL(new Blob([basedata] , {type:'application/pdf'}));
                // res = JSON.stringify(data)
                // var b64 = data;
                // var link = document.createElement('a');
                // link.innerHTML = 'Download PDF file';
                // link.download = 'file.pdf';
                // link.href = 'data:application/octet-stream;base64,' + b64;
                // link.click();
                //downloadPDF(res.PdfData,'abs.pdf','pdf');
                $("#CertificateMessage").empty();
                $("#CertificateMessage").append("<br><b>Your Certificate successfully created.</b>");
                //$("#CertificateMessage").append("<br><b> and send successfully to your mail.</b>");

            }
        });
    });



});
function listen(valId) {
    console.log(sessionStorage.getItem("name"))
    $.ajax({
        type: 'POST',
        url: "https://localhost:44390/api/downloadCertificate",

        dataType: 'json',
        data: {
            Id: valId
        },
        success: function (data) {
            let res3 = JSON.stringify(data);
            if (res3 == "Not found") {
                alert("Not found");
            } else {
                var b64 = data;
                var link = document.createElement('a');
                link.innerHTML = 'Download PDF file';
                link.download = 'file1.pdf';
                link.href = 'data:application/octet-stream;base64,' + b64;
                console.log(data);
                link.click();
            }

        }
    });
}
function sendmail(valId) {
    console.log(sessionStorage.getItem("name"))
    $.ajax({
        type: 'POST',
        url: "https://localhost:44390/api/sendMail",

        dataType: 'json',
        data: {
            Id: valId
        },
        success: function (data) {
            alert("Send Mail successfully")
        }
    });
}
