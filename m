Return-Path: <ben@bluerocksoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C43C77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 05:37:10 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.7093.1685511428564261790
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 May 2023 22:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bluerocksoft.com header.s=google header.b=JSaqIZ7O;
 spf=pass (domain: bluerocksoft.com, ip: 209.85.166.176, mailfrom: ben@bluerocksoft.com)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-33b4b70693eso20136985ab.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 May 2023 22:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bluerocksoft.com; s=google; t=1685511427; x=1688103427;
        h=to:date:message-id:subject:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zWen0ZsCbcA/bmE6Kh/UieafMkY9t0+s+nUiUmZSQp0=;
        b=JSaqIZ7Oa6W1fkWaqDbRy7m3/uIJWjXwi7kvOc0fvbn+SwGN0fnSuLkahAcYWDPA/d
         UFvnMOMDnANyK0Vc81q+V2fBZTsxUcSxyvWmY5NEoh6esZYzQzFEbv0+tJnTF4JdjcRL
         ZMasIFPMlM8wjOoxXovE/Zoh+2dW9HZbJrs103A6EgVYZv15C0XcEhPvs3HIhIyKcQgV
         lk5r40GfO/jFp/67/GRZzwtjD9fS6sT1B7p7iG1sIQxSZbA0vUQczGOje88pMxg8v4or
         vwjRZo0leUYygSEy47zfb4nVLNRMZ63dYvCeZTWKUk4ULpdkTzdkiL9VlCLpQ7OyAhVX
         gkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685511427; x=1688103427;
        h=to:date:message-id:subject:mime-version:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zWen0ZsCbcA/bmE6Kh/UieafMkY9t0+s+nUiUmZSQp0=;
        b=Z6YqgyLWJoK3EJbFBFuwXDr+V/izDZc5JkzZnEebMGJUodWWHk5565RddTE4q0nyKB
         a7W555Tl8z5e8wIPG3uPRgLEfCLIwojUWN/fnbqkqPSlHGlQhtIH0X9ZIr74YpjbdI8v
         w38+veVyGovBRKMAj/cXdv69Ss7rxZQHHN5B1kFE1/k+TGDg3Hk+kXrYh7dXltCiLa8o
         kY60dNjlCGZ6RdIU3HadssBCSn93J/WlgT9/+6BTRfwsp/Oz61uA++rh/xBkdgzdXmii
         pXUczKkyti6+PQoChRwyP+zATDdt0kSPLaNIBvIbYZjERbXaAWsYkRsGaO8RTn12K1W1
         Hwkw==
X-Gm-Message-State: AC+VfDxaDUKaY43KeSLwafq2Lq3/Zi30/Np63gZKbQNXOwuwa6wQqoUI
	UIjrrMsOUvLuikjwTMWyzXil6XEOnpWxj3Srbq0ehA==
X-Google-Smtp-Source: ACHHUZ6Edvc5KnLAH3uCGlfKA95HZeK9HtOMDDqoTmUm11i9nI0xKuFZtpiAdrJwtYz33k/S3DmCvw==
X-Received: by 2002:a92:db4b:0:b0:325:eb13:1045 with SMTP id w11-20020a92db4b000000b00325eb131045mr1669705ilq.2.1685511427530;
        Tue, 30 May 2023 22:37:07 -0700 (PDT)
Received: from smtpclient.apple (cpe-76-171-169-214.socal.res.rr.com. [76.171.169.214])
        by smtp.gmail.com with ESMTPSA id bf10-20020a170902b90a00b001ae5cc15655sm341661plb.5.2023.05.30.22.37.06
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 May 2023 22:37:07 -0700 (PDT)
From: Ben Payne <ben@bluerocksoft.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_8773E5B5-D4CC-4924-8C76-F7CC27D0601D"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Adding a new Device tree Overlay
Message-Id: <1DFF0519-B207-4FCB-9AF9-A1BF0519D928@bluerocksoft.com>
Date: Tue, 30 May 2023 22:37:06 -0700
To: meta-arm@lists.yoctoproject.org
X-Mailer: Apple Mail (2.3696.120.41.1.1)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 31 May 2023 05:37:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4717


--Apple-Mail=_8773E5B5-D4CC-4924-8C76-F7CC27D0601D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

New to this mailing list, but been working with Yocto for a while now.  =
Having a challenge getting a new device tree overlay file to end up in =
my raspberry pi 4 image.  I=E2=80=99ve got my own layer that is =
installing our application and some driver modes.  I have the driver =
changes and the new dtbo file as part of a patch that I apply to the =
kernel.  So the kernel build should take care of building my dtbo file.  =
But can=E2=80=99t seem to get it into the /boot partition. =20

Tried do_install, but then it says I haven=E2=80=99t made this part of a =
package.  Left my previous trys in the file below.

I=E2=80=99ve see the KERNEL_DEVICETREE variable and tried it, no errors, =
but dtbo file is still missing. =20

This is the contents of my linux_raspberrypi_5.15.bbappend file:
inherit kernel-devicetree

FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"

SRC_URI:append =3D "file://0001-InterludeAudioDrivers.patch"

#RPI_KERNEL_DEVICETREE_OVERLAYS:append =3D " =
overlays/interludeaudio-digital.dtbo"

#FILES:${KERNEL_PACKAGE_NAME}-devicetree:append =3D " \
#    interludeaudio-digital.dtbo "

#do_install:append() {
#    install -d ${D}/boot/overlays
#    install -m 644 =
${B}/arch/arm/boot/dts/overlays/interludeaudio-digital.dtbo =
${D}/boot/overlays
#}

KERNEL_DEVICETREE:append =3D =E2=80=9C =
overlays/interludeaudio-digital.dtbo"




--Apple-Mail=_8773E5B5-D4CC-4924-8C76-F7CC27D0601D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">New =
to this mailing list, but been working with Yocto for a while now. =
&nbsp;Having a challenge getting a new device tree overlay file to end =
up in my raspberry pi 4 image. &nbsp;I=E2=80=99ve got my own layer that =
is installing our application and some driver modes. &nbsp;I have the =
driver changes and the new dtbo file as part of a patch that I apply to =
the kernel. &nbsp;So the kernel build should take care of building my =
dtbo file. &nbsp;But can=E2=80=99t seem to get it into the /boot =
partition. &nbsp;<div class=3D""><br class=3D""></div><div =
class=3D"">Tried do_install, but then it says I haven=E2=80=99t made =
this part of a package. &nbsp;Left my previous trys in the file =
below.</div><div class=3D""><br class=3D""></div><div class=3D"">I=E2=80=99=
ve see the KERNEL_DEVICETREE variable and tried it, no errors, but dtbo =
file is still missing. &nbsp;</div><div class=3D""><br =
class=3D""></div><div class=3D"">This is the contents of my =
linux_raspberrypi_5.15.bbappend file:</div><div class=3D""><div =
class=3D"">inherit kernel-devicetree</div><div class=3D""><br =
class=3D""></div><div class=3D"">FILESEXTRAPATHS:prepend :=3D =
"${THISDIR}/files:"</div><div class=3D""><br class=3D""></div><div =
class=3D"">SRC_URI:append =3D "<a =
href=3D"file://0001-InterludeAudioDrivers.patch" =
class=3D"">file://0001-InterludeAudioDrivers.patch</a>"</div><div =
class=3D""><br class=3D""></div><div =
class=3D"">#RPI_KERNEL_DEVICETREE_OVERLAYS:append =3D " =
overlays/interludeaudio-digital.dtbo"</div><div class=3D""><br =
class=3D""></div><div =
class=3D"">#FILES:${KERNEL_PACKAGE_NAME}-devicetree:append =3D " =
\</div><div class=3D""># &nbsp; &nbsp;interludeaudio-digital.dtbo =
"</div><div class=3D""><br class=3D""></div><div =
class=3D"">#do_install:append() {</div><div class=3D""># &nbsp; =
&nbsp;install -d ${D}/boot/overlays</div><div class=3D""># &nbsp; =
&nbsp;install -m 644 =
${B}/arch/arm/boot/dts/overlays/interludeaudio-digital.dtbo =
${D}/boot/overlays</div><div class=3D"">#}</div><div class=3D""><br =
class=3D""></div><div class=3D"">KERNEL_DEVICETREE:append =3D =E2=80=9C =
overlays/interludeaudio-digital.dtbo"</div><div class=3D"">
<div dir=3D"auto" style=3D"caret-color: rgb(0, 0, 0); letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; word-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;" class=3D""><div dir=3D"auto" =
style=3D"caret-color: rgb(0, 0, 0); letter-spacing: normal; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; word-wrap: break-word; -webkit-nbsp-mode: space; line-break: =
after-white-space;" class=3D""><div><br class=3D""></div><div =
style=3D"color: rgb(0, 0, 0);"><br class=3D""></div></div></div>
</div>
<br class=3D""></div></body></html>=

--Apple-Mail=_8773E5B5-D4CC-4924-8C76-F7CC27D0601D--

