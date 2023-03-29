Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1B7C6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 15:39:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1266.1680104378334452599
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Mar 2023 08:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0368B1FB
	for <meta-arm@lists.yoctoproject.org>; Wed, 29 Mar 2023 08:40:22 -0700 (PDT)
Received: from [10.1.199.64] (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A3313F663
	for <meta-arm@lists.yoctoproject.org>; Wed, 29 Mar 2023 08:39:37 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------ILloWWS5OlsGC6G0b3wGzBZa"
Message-ID: <acebbf22-512c-f9fe-8167-6dd220db2557@arm.com>
Date: Wed, 29 Mar 2023 16:39:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-arm] [PATCH 1/2] arm/lib: pass the PATH to fvp runner
To: meta-arm@lists.yoctoproject.org
References: <1750E21A8E7AA843.29160@lists.yoctoproject.org>
 <CAJiuCce8Q7KjiLewZeB+mrJXRA8ZV_5B7aXdhtaaqHhiDVwe2Q@mail.gmail.com>
Content-Language: en-US
From: Peter Hoyes <Peter.Hoyes@arm.com>
In-Reply-To: <CAJiuCce8Q7KjiLewZeB+mrJXRA8ZV_5B7aXdhtaaqHhiDVwe2Q@mail.gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 29 Mar 2023 15:39:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4499

This is a multi-part message in MIME format.
--------------ILloWWS5OlsGC6G0b3wGzBZa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 29/03/2023 13:02, Cl=C3=A9ment P=C3=A9ron via lists.yoctoproject.org w=
rote:
> Hi,
>
> On Wed, 29 Mar 2023 at 14:01, Cl=C3=A9ment P=C3=A9ron via lists.yoctopr=
oject.org=20
> <http://lists.yoctoproject.org>=20
> <peron.clem=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > When running an FVP machine the model executable need to be found
> > in the PATH environement.
>
> I'm trying to execute the FVP machine in Docker that will install the F=
VP
> in a location which is different from the builder machine.
>
> Hope it makes sense
> Regards,
> Clement
>
Hi Cl=C3=A9ment,

Thanks for this - looks like I broke the use case where FVP_PROVIDER is=20
not set and the model is provided by the host? Seems like a reasonable=20
solution to me.

Are you running some tests against the FVP on Docker?

Peter

--------------ILloWWS5OlsGC6G0b3wGzBZa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 29/03/2023 13:02, Cl=C3=A9ment P=C3=
=A9ron via
      lists.yoctoproject.org wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CAJiuCce8Q7KjiLewZeB+mrJXRA8ZV_5B7aXdhtaaqHhiDVwe2Q@mail.gmai=
l.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DU=
TF-8">
      <div dir=3D"ltr">Hi,<br>
        <br>
        On Wed, 29 Mar 2023 at 14:01, Cl=C3=A9ment P=C3=A9ron via <a
          href=3D"http://lists.yoctoproject.org" moz-do-not-send=3D"true"=
>lists.yoctoproject.org</a>
        &lt;peron.clem=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.o=
rg"
          moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">gmail.=
com@lists.yoctoproject.org</a>&gt;
        wrote:<br>
        &gt;<br>
        &gt; When running an FVP machine the model executable need to be
        found<br>
        &gt; in the PATH environement.
        <div><br>
        </div>
        <div>I'm trying to execute the FVP machine in Docker that will
          install the FVP=C2=A0</div>
        <div>in a location which is different from the builder machine.</=
div>
        <div><br>
        </div>
        <div>Hope it makes sense</div>
        <div>Regards,</div>
        <div>Clement</div>
        <div><span style=3D"font-family:Arial,Helvetica,sans-serif"><br>
          </span></div>
      </div>
    </blockquote>
    <p>Hi Cl=C3=A9ment,</p>
    <p>Thanks for this - looks like I broke the use case where
      FVP_PROVIDER is not set and the model is provided by the host?
      Seems like a reasonable solution to me.</p>
    <p>Are you running some tests against the FVP on Docker?<br>
    </p>
    <p>Peter</p>
  </body>
</html>

--------------ILloWWS5OlsGC6G0b3wGzBZa--

