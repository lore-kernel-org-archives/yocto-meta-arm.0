Return-Path: <jerome.forissier@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F2BCD3440
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 06:52:29 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.1906.1695106341557464444
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Sep 2023 23:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=J7XZJWBJ;
 spf=pass (domain: linaro.org, ip: 209.85.221.41, mailfrom: jerome.forissier@linaro.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-32164a6af64so670865f8f.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 18 Sep 2023 23:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695106340; x=1695711140; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=71Kob7FMjQcSusB14AnTjWFDcJoTaxjI82JgyrobXI8=;
        b=J7XZJWBJs1G9Na8xVwH0JmgV/eXZHFpn8tJpRrBNuLHhX7Fmm+2G6wBW5Kzn4kmd2R
         lypVxG4MbrL06IaI3T1VQb2VZcyjeft/mmGWCarZ7AEfU/UDJc7dUgg4S3sSZ5NZoSXa
         /BSFGVPKNJLJ5AADpYQnPVtZMrKKDRQT5C1OW5Ik/MgbRitlPG9lmqTO2oi0Di8y/Ep6
         LtRljVf1nrvv9iRYDqGF1FhoVWmP4BiuvrDQRgHiMzF3FRhjCHyFnMgzv14W6WR8RvKy
         heBkM32e+POVVVsVsIzCxQ/nJrAQ76uby8+/bY4TQYBX8R47Ek068lOMX9bzxSWvdFG9
         ykFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695106340; x=1695711140;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71Kob7FMjQcSusB14AnTjWFDcJoTaxjI82JgyrobXI8=;
        b=e4LqFDUy7mKaUQ2IaruTmec73hpmRs+my1IUjtfmc1TRsFUuggvn3l1XS2p3/rHBz0
         rdQrGz/V3PrPfpu3FxW3pAnTNUw1+/RLa8s5ojTCLEf+F8ZBgFbxWFMYl9kDD0edBedk
         83lH7kF0urUnr8pLmEBbQ6v8zNpVJzl5LzZFxAv47T1lHwAY6KgqEvswpACoiybcVNg9
         7JvGpZkTqd20m/eQo5I9WstKfgNNfHoSAfSQ0HbBS6wV0Zzc8IfwZ7WxhoGGqKWw91MW
         JzKzrbnLW7fAljZmEADnQ3ieJgmLh3I8TsC2gaQKZMYzH/Gt68dMyt66JHr5jzGSNQ3A
         UjUg==
X-Gm-Message-State: AOJu0Yz9X11FzHwUv9e4Dg5A3DB0BfRtrUU+3OU82O1QCaIJq1d1syuS
	vEcejw/0sRwDmapcIbZHhFuSHUfqWPe0nLOLhnaM0Q==
X-Google-Smtp-Source: AGHT+IFYc7Te4NuyU8qoXwFVIbGGEkIX05Cq617sa1ABgovbv7hbQ/81u1dzvhyBiXvPHDJ29UsCxvZJeCrBh70v+zw=
X-Received: by 2002:a5d:6145:0:b0:31f:b120:143 with SMTP id
 y5-20020a5d6145000000b0031fb1200143mr10515388wrt.59.1695106339809; Mon, 18
 Sep 2023 23:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230918190452.62938-1-javier.tia@linaro.org>
In-Reply-To: <20230918190452.62938-1-javier.tia@linaro.org>
From: =?UTF-8?B?SsOpcsO0bWUgRm9yaXNzaWVy?= <jerome.forissier@linaro.org>
Date: Tue, 19 Sep 2023 08:52:08 +0200
Message-ID: <CA+NB=ma-aQzydYd5Ys2Mc=9qzo+K25c9ME+moq2JaJSAJAeHsQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] libts: tee-udev.rules: Change ownership to tee group
To: Javier Tia <javier.tia@linaro.org>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000003dc53e0605b0b370"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 19 Sep 2023 06:52:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5058

--0000000000003dc53e0605b0b370
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Sept 2023 at 21:05, Javier Tia <javier.tia@linaro.org> wrote:

> tee and teeclnt are there to avoid running client applications (CAs) and
> tee-supplicant as root.
>
> - The teeclnt group stands for "TEE client" and is for CAs (CAs need
>   access to /dev/tee[0-9]* but not /dev/teepriv[0-9]*).
>
> - tee is just for tee-supplicant to open its device /dev/teepriv[0-9]*.
>   No other process is supposed to open that one.
>
> Signed-off-by: Javier Tia <javier.tia@linaro.org>
> ---
>  meta-arm/recipes-security/trusted-services/libts/tee-udev.rules | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git
> a/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules
> b/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules
> index af428974..43fafd8c 100644
> --- a/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules
> +++ b/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules
> @@ -3,5 +3,5 @@ KERNEL=="tee[0-9]*", TAG+="systemd", MODE="0660",
> GROUP="teeclnt"
>
>  # If a /dev/teepriv[0-9]* device is detected, start an instance of
>  # tee-supplicant.service with the device name as parameter
> -KERNEL=="teepriv[0-9]*", MODE="0660", OWNER="root", GROUP="teeclnt", \
> +KERNEL=="teepriv[0-9]*", MODE="0660", OWNER="root", GROUP="tee", \
>      TAG+="systemd", ENV{SYSTEMD_WANTS}+="tee-supplicant@%k.service"
> --
> 2.42.0
>

Reviewed-by: Jerome Forissier <jerome.forissier@linaro.org>


> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#5057):
> https://lists.yoctoproject.org/g/meta-arm/message/5057
> Mute This Topic: https://lists.yoctoproject.org/mt/101440792/7094589
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [
> jerome.forissier@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000003dc53e0605b0b370
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, 18 Sept 2023 at 21:05, Javier=
 Tia &lt;<a href=3D"mailto:javier.tia@linaro.org">javier.tia@linaro.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">tee =
and teeclnt are there to avoid running client applications (CAs) and<br>
tee-supplicant as root.<br>
<br>
- The teeclnt group stands for &quot;TEE client&quot; and is for CAs (CAs n=
eed<br>
=C2=A0 access to /dev/tee[0-9]* but not /dev/teepriv[0-9]*).<br>
<br>
- tee is just for tee-supplicant to open its device /dev/teepriv[0-9]*.<br>
=C2=A0 No other process is supposed to open that one.<br>
<br>
Signed-off-by: Javier Tia &lt;<a href=3D"mailto:javier.tia@linaro.org" targ=
et=3D"_blank">javier.tia@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta-arm/recipes-security/trusted-services/libts/tee-udev.rules | 2 +=
-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-arm/recipes-security/trusted-services/libts/tee-udev.rule=
s b/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules<br>
index af428974..43fafd8c 100644<br>
--- a/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules<br>
+++ b/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules<br>
@@ -3,5 +3,5 @@ KERNEL=3D=3D&quot;tee[0-9]*&quot;, TAG+=3D&quot;systemd&quo=
t;, MODE=3D&quot;0660&quot;, GROUP=3D&quot;teeclnt&quot;<br>
<br>
=C2=A0# If a /dev/teepriv[0-9]* device is detected, start an instance of<br=
>
=C2=A0# tee-supplicant.service with the device name as parameter<br>
-KERNEL=3D=3D&quot;teepriv[0-9]*&quot;, MODE=3D&quot;0660&quot;, OWNER=3D&q=
uot;root&quot;, GROUP=3D&quot;teeclnt&quot;, \<br>
+KERNEL=3D=3D&quot;teepriv[0-9]*&quot;, MODE=3D&quot;0660&quot;, OWNER=3D&q=
uot;root&quot;, GROUP=3D&quot;tee&quot;, \<br>
=C2=A0 =C2=A0 =C2=A0TAG+=3D&quot;systemd&quot;, ENV{SYSTEMD_WANTS}+=3D&quot=
;tee-supplicant@%k.service&quot;<br>
-- <br>
2.42.0<br></blockquote><div><br></div><div>Reviewed-by: Jerome Forissier &l=
t;<a href=3D"mailto:jerome.forissier@linaro.org">jerome.forissier@linaro.or=
g</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#5057): <a href=3D"https://lists.yoctoproject.org/g/meta=
-arm/message/5057" rel=3D"noreferrer" target=3D"_blank">https://lists.yocto=
project.org/g/meta-arm/message/5057</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/101440792/709=
4589" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/101440792/7094589</a><br>
Group Owner: <a href=3D"mailto:meta-arm%2Bowner@lists.yoctoproject.org" tar=
get=3D"_blank">meta-arm+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arm/unsub" re=
l=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ar=
m/unsub</a> [<a href=3D"mailto:jerome.forissier@linaro.org" target=3D"_blan=
k">jerome.forissier@linaro.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000003dc53e0605b0b370--

