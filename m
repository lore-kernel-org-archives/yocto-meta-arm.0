Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30DFECE9D5E
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 15:34:21 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92523.1767713654833309639
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Jan 2026 07:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=b7u0zuA8;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so909191f8f.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 06 Jan 2026 07:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767713653; x=1768318453; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xH0s4CZiNGjmmLKnMSzLM5Hu+gWRHTXYLeomXTOa5RQ=;
        b=b7u0zuA8e0m7GnjSPxgbfq5esd22UKoAI50jgemIalv8UgHhRZRAC2QZJwvlLUJCHa
         2oxttt5BaCzdyBGm1+910HaF2zXsh7SmCpAtrTvjkj6Xk2PEG4E/c5qRpgUpOk7iU+7q
         MYxfDb5xXdF+jF2egOxdlPx/KiJ4ae+NcDT/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767713653; x=1768318453;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xH0s4CZiNGjmmLKnMSzLM5Hu+gWRHTXYLeomXTOa5RQ=;
        b=WzQgWO5BzZCBopNUoetcb7ezXoX20nxzeQUbod0IKi39FHscXsXrrHdmUAmQki/91r
         vUoYy0oeRPWebLqsMR/9bDUW1UjmEOyMlfg+gaaJcfd6Qaqtx9AvayIAzQOKxH8dVs4X
         9xsQZv09dVMp+4oK9KckUWPFDSLrsi8N3Dh06leS0FRvrTmou526wVdbTZ05pH5DsJ5P
         31E5le4ZVP0Mb+CtI7ztUkFxtqpKEp4awEl37g37CIpujTbJewWY0Wmg+MrjCnmLqguY
         ou5s8QyiM/2kVvvHpKVd9usaJtRv0xKGvilaNf/6YJ40e/sILg9EP8t9CBxHoVzB3et7
         k1BQ==
X-Gm-Message-State: AOJu0YymLBeLb79/Qm62ENyw4pgb7i+1z2Y4s0ZNpNTVKHr9hSGEH4/g
	7JlgfL2fZnr+DnzQmBpFrKfMxhtxx2HMeVWYM8isOne9mSCNICV9ihXvUIa0mRwfgnmgWXGDdW6
	BbeD15orT8BmHzPKUiJKSmBBDzHyekVqXogKqkpoedQ==
X-Gm-Gg: AY/fxX5u2O7aKneUMHB+ITrtq90E/tgkf9UWn6PGX2AmI1eURbLEwefnSorRtUu8EvK
	6d4v8uNhzdBNmU0R7StbLc4zu0o7WksIILfEBqDZFwfcHn3biDMhZHky2mPETwnl/vESr2BV7Q1
	qFWXudfOIgZ6W2InokyB+6YmPHAec5lJD2j1vl2BBPMGGCx4q8bUemtvCaiiRv/CTqojaAh7+Pq
	XCR+9gLuRbpnNBJIuG5CkDrTPE6TX43ojyD04xFh4TY8xPeKruWTj6P8duxTH4QISYo+IUgvdxd
	znWshQw6a1DGolsvmlZgtGOjKambhw==
X-Google-Smtp-Source: AGHT+IHpG8UbotMH72t3Yjh04K0tUz+9Xm8zimHU2pPbcM8363JSbiQErAvgfRd+x2m25L8VKWtRrPEawZprJIRNpi8=
X-Received: by 2002:a05:6000:2907:b0:430:f454:84ae with SMTP id
 ffacd0b85a97d-432bca5972emr4110231f8f.63.1767713653043; Tue, 06 Jan 2026
 07:34:13 -0800 (PST)
MIME-Version: 1.0
References: <20260106152046.578426-1-ross.burton@arm.com>
In-Reply-To: <20260106152046.578426-1-ross.burton@arm.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 6 Jan 2026 16:33:47 +0100
X-Gm-Features: AQt7F2qCVEPSkKx9bhsOeoYHIs46C0wM46B6Ft0tJFNBDELQOQqFN6cG0bp_AR0
Message-ID: <CAMSfU+4Eubk2dukntVZ=8HVk3nXBz45w=t2u90qJXHscE2QrBA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH][whinlatter] CI: use whinlatter branches
To: ross.burton@arm.com
Cc: meta-arm@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000005ac8b10647b9e84c"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 06 Jan 2026 15:34:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6814

--0000000000005ac8b10647b9e84c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 6 janv. 2026 =C3=A0 16:21, Ross Burton via lists.yoctoproject.org
<ross.burton=3Darm.com@lists.yoctoproject.org> a =C3=A9crit :

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ci/base.yml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/ci/base.yml b/ci/base.yml
> index 87192fba26..41300c5a0f 100644
> --- a/ci/base.yml
> +++ b/ci/base.yml
> @@ -7,11 +7,12 @@ distro: poky
>
>  defaults:
>    repos:
> -    branch: master
> +    branch: whinlatter
>
>  repos:
>    bitbake:
>      url: https://git.openembedded.org/bitbake
> +    branch: "2.14"
>

FYI, whinlatter is based on 2.16


>      layers:
>        bitbake: disabled
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6813):
> https://lists.yoctoproject.org/g/meta-arm/message/6813
> Mute This Topic: https://lists.yoctoproject.org/mt/117106390/4316185
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000005ac8b10647b9e84c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 6 =
janv. 2026 =C3=A0=C2=A016:21, Ross Burton via <a href=3D"http://lists.yocto=
project.org">lists.yoctoproject.org</a> &lt;ross.burton=3D<a href=3D"mailto=
:arm.com@lists.yoctoproject.org">arm.com@lists.yoctoproject.org</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" tar=
get=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0ci/base.yml | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/ci/base.yml b/ci/base.yml<br>
index 87192fba26..41300c5a0f 100644<br>
--- a/ci/base.yml<br>
+++ b/ci/base.yml<br>
@@ -7,11 +7,12 @@ distro: poky<br>
<br>
=C2=A0defaults:<br>
=C2=A0 =C2=A0repos:<br>
-=C2=A0 =C2=A0 branch: master<br>
+=C2=A0 =C2=A0 branch: whinlatter<br>
<br>
=C2=A0repos:<br>
=C2=A0 =C2=A0bitbake:<br>
=C2=A0 =C2=A0 =C2=A0url: <a href=3D"https://git.openembedded.org/bitbake" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/bitbake</a=
><br>
+=C2=A0 =C2=A0 branch: &quot;2.14&quot;<br></blockquote><div><br></div><div=
>FYI, whinlatter is based on 2.16=C2=A0</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0layers:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake: disabled<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#6813): <a href=3D"https://lists.yoctoproject.org/g/meta=
-arm/message/6813" rel=3D"noreferrer" target=3D"_blank">https://lists.yocto=
project.org/g/meta-arm/message/6813</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/117106390/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/117106390/4316185</a><br>
Group Owner: <a href=3D"mailto:meta-arm%2Bowner@lists.yoctoproject.org" tar=
get=3D"_blank">meta-arm+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arm/unsub" re=
l=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ar=
m/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_blank">yoa=
nn.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000005ac8b10647b9e84c--

