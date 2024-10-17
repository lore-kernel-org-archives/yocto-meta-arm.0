Return-Path: <adam.johnston@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 739C4D37491
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 13:39:15 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.48556.1729172350337763822
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Oct 2024 06:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wVSSk7s6;
 spf=pass (domain: linaro.org, ip: 209.85.208.46, mailfrom: adam.johnston@linaro.org)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c9634c9160so1187269a12.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 17 Oct 2024 06:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729172349; x=1729777149; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mWp9QwzM6vBmwUi2jKuFFTxgBsGEqWdAbdVrZGQksv4=;
        b=wVSSk7s6H2PDyM6TGXJO1xgoLplcw/uLBQTPA0S7eCYgolttA498u/mejkV1fntTto
         hJe//7v9vo/4TKWO7a3arbK00v2k3EDSck6+XL4CxGI4bhvUxgdQb9vjia6odfSyCwG0
         w9fRdJczIKiFt6vH/IWSyItu+flVfBB4YScELs8dJrC68h8mpygExTi2wVmMWIlk3wP4
         8JXhtlz9+ouEeEqhBp8mA73E4CC0hsX2rvd2mEohMtYoHjK1WhPpBRzDnsL4DwBsdwzJ
         wAqx6KVzNBhnYm8gbZ1QojLUOMR91m5XMsV33bic0K87wjAaPN++YQfk7zEjKEs4zXU3
         pluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729172349; x=1729777149;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWp9QwzM6vBmwUi2jKuFFTxgBsGEqWdAbdVrZGQksv4=;
        b=Bxabe3IfPdX8ycjy1gAL36cBscZ4ilreWHYr8bnX+248lAa7iZ2pGJxM5fnchqZWcs
         Uryt3FlXBQYbPSealydGOzQs2IGKvMf/4ac+nCGSEHuKSmAxKUVRohshTwzFcDN05oZE
         ZpMm9Iq2L35+O53JNcoG82MbKO1qMx6crOFpe/x4rvHdB6dff7RwJQ3A5oBn0B1uN3gb
         DwHBTYzNSeohWEm/n/VLTraha6FYMjsHSwgR8gMO1r7J/mrKum8QMJ5bnHk+4zPphp0V
         kNOwjGppXVU9W1I+BaUBfrhoPe3aexcaot8e6Tc46hzCYVa0gBHbFr74ACG1Iha8qhs/
         62Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXc7DQKjJuTNrT3KVwS9qQRb/w04xNiKytpTiTSDGueURxqWle8fDRBzRe7vEjGG6UtLuYdLpb3zQ==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yynnie+dOBhrvMjRu1b6W8ACrlG4U6DEm4gc//vUlOaMCC9Bkvm
	M88t94puJZgbx7aaYuUvTpZO6zpJuwbIITUMFUM86/sdw5+thwktQ4q8ZJqVwSAmWTgJeRxR+24
	w/gMnXadPIbFM1is5Ql5VwhKzAFzBVXmN4UwGxg==
X-Google-Smtp-Source: AGHT+IEtwZvl/ng3QX5EGbfNrUWH4kAZCAMzEDrID8ho62KjTOaBn7RhMReizxPxk30zpXCpJXoLId2v6fgl9se5mRI=
X-Received: by 2002:a05:6402:13d3:b0:5c8:a01c:e511 with SMTP id
 4fb4d7f45d1cf-5c9950e10cemr6819690a12.10.1729172348294; Thu, 17 Oct 2024
 06:39:08 -0700 (PDT)
MIME-Version: 1.0
References: <20241017065907.172504-1-mikko.rapeli@linaro.org>
 <20241017065907.172504-2-mikko.rapeli@linaro.org> <AS8PR08MB589563A608DE289457643CA991472@AS8PR08MB5895.eurprd08.prod.outlook.com>
 <ZxDMGLYsOSe9rPFO@nuoska> <AS8PR08MB589512524CBB7BFB377101C391472@AS8PR08MB5895.eurprd08.prod.outlook.com>
 <ZxDeZvHXRUmITGKd@nuoska> <AS8PR08MB58951A0CBE556C313695963291472@AS8PR08MB5895.eurprd08.prod.outlook.com>
 <ZxDwXeOdfwuCsI_p@nuoska>
In-Reply-To: <ZxDwXeOdfwuCsI_p@nuoska>
From: Adam Johnston <adam.johnston@linaro.org>
Date: Thu, 17 Oct 2024 14:38:56 +0100
Message-ID: <CAJ0ObGybwxUDPrzOo73s4SPTZsnr8M_=WV0ZajWvjArKOdA1=w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v3 2/2] trusted-service: remove optee udev and
 group settings
To: mikko.rapeli@linaro.org
Cc: Gyorgy Szing <Gyorgy.Szing@arm.com>, 
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000009378020624ac4fee"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Oct 2024 13:39:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6212

--0000000000009378020624ac4fee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> I'm still not sure of the right direction. Which recipes and layers have
> userspace
> SW which needs to access /dev/tee* or /dev/teepriv* devices nodes without
> root
> rights in userspace? Where is a test for these recipes or functionality?


Parsec uses the teeclnt group for access to the PSA APIs when TS is in
PACKAGECONFIG but I'm not sure they test that configuration.
Cassini tests that config and also use the same group to run the PSA API
tests

Regards

Adam

On Thu, 17 Oct 2024 at 12:09, Mikko Rapeli via lists.yoctoproject.org
<mikko.rapeli=3Dlinaro.org@lists.yoctoproject.org> wrote:

> Hi,
>
> On Thu, Oct 17, 2024 at 10:54:41AM +0000, Gyorgy Szing wrote:
> > Hi,
> >
> > =E2=80=9CBut optee and optee-client are part of the TS images and confi=
gs so
> there is a link.=E2=80=9D
> > =E2=80=9CI don't see any user being added to the previously used "teecl=
nt"
> group. So which non-root users are there? If the users are in Cassini, I
> have proposed fixes there.=E2=80=9D
> > I am not saying the TS recipes are perfect and there might be a
> dependency, which is an error. Except for the OP-TEE SPMC tests SPs which
> indeed depend on op-tee and xtest.
> >
> > =E2=80=9CWhat is the proper way to fix this?
> >
> > I don't think duplicating optee/tee-supplicant udev rules is the answer=
.
> > I could move optee-client recipe udev rules to a separate binary packag=
e
> > to enable installing without tee-supplicant.=E2=80=9D
> > I think a dedicated recipe on which both libts and optee-client depends
> is one way to fix.
>
> A dedicated recipe is not ok. optee-client upstream provides the udev rul=
e.
> A dedicated binary package from optee-client for the udev rule could be
> created. The udev rule and matching systemd service (and possibly sysvini=
t
> script) are non-trivial to setup and thus in meta-arm recipe some aspects
> were wrong and other Linux distros have even more issues. Thus it's bette=
r
> to collaborate with upstream when setting them up.
>
> > =E2=80=9CBut I'd like to see the users and have a test case, preferably=
 in
> meta-arm.=E2=80=9D
> > Well, I cannot provide a setup where TS is used without OP-TEE
> currently, but your config can and will be tested in the CI. Yes, TS only
> world might still be broken, but the change at least would make a step in
> the right direction.
>
> I'm still not sure of the right direction. Which recipes and layers have
> userspace
> SW which needs to access /dev/tee* or /dev/teepriv* devices nodes without
> root
> rights in userspace? Where is a test for these recipes or functionality?
>
> The old teeclnt setup was a bit broken. For example tee-supplicant was
> still
> started in systemd service file as root user. Both /dev/tee* and
> /dev/teepriv*
> used the same teeclnt group which was not right according to upstream,
> they need to have different groups. Then the systemd service which did no=
t
> work in initrd. Etc.
>
> Cheers,
>
> -Mikko
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6210):
> https://lists.yoctoproject.org/g/meta-arm/message/6210
> Mute This Topic: https://lists.yoctoproject.org/mt/109059457/8940727
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [
> adam.johnston@linaro.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009378020624ac4fee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I&#39;m =
still not sure of the right direction. Which recipes and layers have usersp=
ace<br>SW which needs to access /dev/tee* or /dev/teepriv* devices nodes wi=
thout root<br>rights in userspace? Where is a test for these recipes or fun=
ctionality?</blockquote><div><br></div><div>Parsec uses the teeclnt group f=
or access to the PSA APIs when TS is in PACKAGECONFIG but I&#39;m not sure =
they test that configuration.</div><div>Cassini tests that config and also =
use the same group to run the PSA API tests</div><div><br></div><div>Regard=
s</div><div><br></div><div>Adam</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, 17 Oct 2024 at 12:09, Mikko Ra=
peli via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</=
a> &lt;mikko.rapeli=3D<a href=3D"mailto:linaro.org@lists.yoctoproject.org">=
linaro.org@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi,<br>
<br>
On Thu, Oct 17, 2024 at 10:54:41AM +0000, Gyorgy Szing wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; =E2=80=9CBut optee and optee-client are part of the TS images and conf=
igs so there is a link.=E2=80=9D<br>
&gt; =E2=80=9CI don&#39;t see any user being added to the previously used &=
quot;teeclnt&quot; group. So which non-root users are there? If the users a=
re in Cassini, I have proposed fixes there.=E2=80=9D<br>
&gt; I am not saying the TS recipes are perfect and there might be a depend=
ency, which is an error. Except for the OP-TEE SPMC tests SPs which indeed =
depend on op-tee and xtest.<br>
&gt;<br>
&gt; =E2=80=9CWhat is the proper way to fix this?<br>
&gt; <br>
&gt; I don&#39;t think duplicating optee/tee-supplicant udev rules is the a=
nswer.<br>
&gt; I could move optee-client recipe udev rules to a separate binary packa=
ge<br>
&gt; to enable installing without tee-supplicant.=E2=80=9D<br>
&gt; I think a dedicated recipe on which both libts and optee-client depend=
s is one way to fix.<br>
<br>
A dedicated recipe is not ok. optee-client upstream provides the udev rule.=
<br>
A dedicated binary package from optee-client for the udev rule could be<br>
created. The udev rule and matching systemd service (and possibly sysvinit<=
br>
script) are non-trivial to setup and thus in meta-arm recipe some aspects<b=
r>
were wrong and other Linux distros have even more issues. Thus it&#39;s bet=
ter<br>
to collaborate with upstream when setting them up.<br>
<br>
&gt; =E2=80=9CBut I&#39;d like to see the users and have a test case, prefe=
rably in meta-arm.=E2=80=9D<br>
&gt; Well, I cannot provide a setup where TS is used without OP-TEE current=
ly, but your config can and will be tested in the CI. Yes, TS only world mi=
ght still be broken, but the change at least would make a step in the right=
 direction.<br>
<br>
I&#39;m still not sure of the right direction. Which recipes and layers hav=
e userspace<br>
SW which needs to access /dev/tee* or /dev/teepriv* devices nodes without r=
oot<br>
rights in userspace? Where is a test for these recipes or functionality?<br=
>
<br>
The old teeclnt setup was a bit broken. For example tee-supplicant was stil=
l<br>
started in systemd service file as root user. Both /dev/tee* and /dev/teepr=
iv*<br>
used the same teeclnt group which was not right according to upstream,<br>
they need to have different groups. Then the systemd service which did not<=
br>
work in initrd. Etc.<br>
<br>
Cheers,<br>
<br>
-Mikko<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#6210): <a href=3D"https://lists.yoctoproject.org/g/meta=
-arm/message/6210" rel=3D"noreferrer" target=3D"_blank">https://lists.yocto=
project.org/g/meta-arm/message/6210</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/109059457/894=
0727" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/109059457/8940727</a><br>
Group Owner: <a href=3D"mailto:meta-arm%2Bowner@lists.yoctoproject.org" tar=
get=3D"_blank">meta-arm+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arm/unsub" re=
l=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ar=
m/unsub</a> [<a href=3D"mailto:adam.johnston@linaro.org" target=3D"_blank">=
adam.johnston@linaro.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000009378020624ac4fee--

