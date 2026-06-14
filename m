Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668F7CD98C5
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 14:16:51 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.109930.1781446607699376939
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 14 Jun 2026 07:16:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=A4jZYarU;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.177, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-48762009daeso261258b6e.1
        for <meta-arm@lists.yoctoproject.org>; Sun, 14 Jun 2026 07:16:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781446607; cv=none;
        d=google.com; s=arc-20240605;
        b=fVcvT2MBzXM/eF2ZhS8k2zGVkX+qu5i/sCa2DtE1MHPA7rr8h1TyYLCMpwB1UxW+A7
         3BumYV196+MoH85XkkKSQBjlB4Jl+dKr5KeaAO9xawlyFxAVMJoifFfftFr9FSmATs6d
         tDLXvpixDWKGpbIi3pkyRgxEElu39ozHl1r/nH+l/Ag196elHvZoFwze7qeftGjpTV5p
         MA/KuNfDEDtViEbkkrjQnsqND4IV6KE1z4q9dtQ/hbKmd5W83etZiYkOEbrweHJwK036
         slAlRrCdZnOIC5rukcjliAHy5ZC+SEnr0sSRL0/g0kDmSb4AblfqaJ1E1BKLtH+d/6Oi
         JQSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Q+1kGpUWNBDdfHoR8b/EN+RN37/H1bMC8HkuLvTj/g=;
        fh=bSr45N1l79QdfKcx3NeWXNWlRMmJkyPaHYW7Ek5clvk=;
        b=QiVO9kFqtxG8fmRmX+Tjd9evZfXq4IE5SPhS0vdHOeX1zYBF9LfRHWPWgcjOyYelkl
         iAHkDvtX5LJNitSKV1ccv/cCjUgZFJ2dWOoZamSBgKQQGzjsBa5H3sb2Lb1EtLtdkqPm
         RxXte8FkWKz3exlYdKEUfbqkv2XiJWGpxJ0OM7iLaiN8P5ZlQb2t1nyH6jDHT49k+F1z
         nMAGPvZPCtiziLPj9JxKAdIBgu2wNYH96j0Zbb6KIDiRBM+IF33zcKKwdmD9CSc2Qt/O
         hNMKMd//nfpR2nKP/u6Qh8QuZxlD7Zh/c4scXLDsQMunMjGOESZp+vwl3JyhI5ubbfq9
         7kzw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1781446607; x=1782051407; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Q+1kGpUWNBDdfHoR8b/EN+RN37/H1bMC8HkuLvTj/g=;
        b=A4jZYarUrK1rveqOmiZ3UDcgKI+rtKeb43fH3p0rNZTLH7GRUObzDF8HsTLZWgmR6C
         fhvtg8j2QfocakzsLUGtQlmdS8Vynnd+vOtT8dqne+7CSCJAW7hKOQ3EJsToquDh1KFF
         usI7C1ZHiThLs5efax2ZDE/DEjrV13jyF6zl+VZ4E/55pzUzpGTKr4eklEdjtPvAQlpc
         04+Uvb7VaTP2XRyChMdvLQ3J8oJyS7NmADTQOKPtmL3mP1N2rX1O6XwtjsAbU+EqnLKZ
         b0ti8J9ub8HGvNz76RrClujBURF17pRdN2foOhE6ejhzIPiU+H7jLIuTHsJCrUMfsWkW
         hVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781446607; x=1782051407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Q+1kGpUWNBDdfHoR8b/EN+RN37/H1bMC8HkuLvTj/g=;
        b=PNd2awXCa5HtcPwfCbRuF+orLJp79zZ3tuSNL0ZDJnZ7KYlXRl5m3CcXDQbNyuTJNt
         bfIYRzr89Viw/24sl3JgbEs3Wp1PkhrCpIboTj2BQoiX9eBn8AMDXYqZt1P3WziZVXb+
         6stYKlUbNrf/6rDjon31t9s9P8gr/0K954Jvp4tJAKccsZNitFiINYAJFarkt056fmbK
         Oh8WdutA3zlu3EdPN9XsZNan6DW9J8kFbfQtauGtAIKdcoDLMCc/8MNwCWQQWNJbXjTH
         P9caTXHiVLa9oMsw+4LNX98pwXfjiPZ/vCajEvBm/KVGXRnRLkXxdv+Hwuc8sCEb6qfb
         sVVA==
X-Gm-Message-State: AOJu0YwuMWc+l7f+NkF/Lcq4OdYf+yZUNq4nSYg4f6J7oAWvbSzNWa2x
	J8bQbC+PeYRQMXts11aidrGa6ADfqJEwGDBaan4eIgHfFEBFXubzbtI49ovbeAq4qiaaPTaSelx
	NLllCGPY+E2diinVATUc/MBuv3kyFP1mDl9+mdcKp
X-Gm-Gg: Acq92OEBP4JQc/PgsPjbUUbcnFG8dnY5kNn3LbgndzLrjZzVCEcupt3lcMShMDwSB1x
	iLuhU8ILXoa9aVUAtDhLJVCgZqiRD2RN0NlbypKfNXXyd+VLYgqtvF/v+144JZcIKFFOoE4Yczi
	cBwOQ+XEqg32fzhSvLP/hu4kWcN5DqGBr4KXs8vx3C4MYegSpJL0l0t9q5kSKRg9YB15buQe+I+
	xRhnKYD88hZO+vntnlTkDLbxdNoueyyItNj2TYOaNiRlrOkB3Vt2wKYjRgPlWmWaUM6W3AJk7xN
	SrkqjDM=
X-Received: by 2002:a05:6808:6903:b0:485:4c50:830f with SMTP id
 5614622812f47-4872f5648d0mr6867795b6e.25.1781446606599; Sun, 14 Jun 2026
 07:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260608-mfe-optee-4-10-0-v1-1-83f4f4119c71@pengutronix.de>
In-Reply-To: <20260608-mfe-optee-4-10-0-v1-1-83f4f4119c71@pengutronix.de>
From: Jon Mason <jdmason@kudzu.us>
Date: Sun, 14 Jun 2026 10:16:35 -0400
X-Gm-Features: AVVi8Cd2IhH_NRW0M9uWkE_KEXp8XvD6ZNp3kLngPy6jkbLTBdDEWlH1h9rYIuI
Message-ID: <CAPoiz9xpqaWrJhQfsyxigDt+arTtqQ508iE1m06FBPyAnY6kEg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm/optee: upate to 4.10.0
To: m.felsch@pengutronix.de
Cc: meta-arm@lists.yoctoproject.org, yocto@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 14 Jun 2026 14:16:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7076

Your patch breaks corstone1000 because that platform has
PREFERRED_VERSION_optee-os ?=3D "4.9.%"
PREFERRED_VERSION_optee-client ?=3D "4.9.%"

But that recipe has been removed.  You can see it in CI at:
https://gitlab.com/jonmason00/meta-arm/-/pipelines/2585833357

There is some other noise in there because of upstream breakage, but
you get the idea.

Also, we should at least keep the optee git recipes at the latest
release (and probably newer than that too).

TLDR; this patch is incomplete.

I've had this optee update coming for a while, but the review has
taken longer than expected.  You can see it at:
https://gitlab.com/jonmason00/meta-arm/-/commit/d830ddc1fe0339422f5419dffc4=
575c2cd322ccb

If you want to copy it and send it as a v2, I'd be inclined to take
it.  Otherwise, I hope to have my version out on Monday.


Thanks,
Jon

On Mon, Jun 8, 2026 at 2:39=E2=80=AFPM Marco Felsch via lists.yoctoproject.=
org
<m.felsch=3Dpengutronix.de@lists.yoctoproject.org> wrote:
>
> Update all OP-TEE components to the latest 4.10.0 release.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  .../optee/{optee-client_4.9.0.bb =3D> optee-client_4.10.0.bb}           =
| 2 +-
>  .../optee/{optee-examples_4.9.0.bb =3D> optee-examples_4.10.0.bb}       =
| 2 +-
>  .../optee/{optee-os-tadevkit_4.9.0.bb =3D> optee-os-tadevkit_4.10.0.bb} =
| 0
>  .../recipes-security/optee/{optee-os_4.9.0.bb =3D> optee-os_4.10.0.bb}  =
| 4 ++--
>  .../optee/{optee-test_4.9.0.bb =3D> optee-test_4.10.0.bb}               =
| 4 ++--
>  5 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta-arm/recipes-security/optee/optee-client_4.9.0.bb b/meta=
-arm/recipes-security/optee/optee-client_4.10.0.bb
> similarity index 90%
> rename from meta-arm/recipes-security/optee/optee-client_4.9.0.bb
> rename to meta-arm/recipes-security/optee/optee-client_4.10.0.bb
> index b5c3f0a29eead8d7f440bc3b5f8b390280680f68..0d28c76f1f4fa03192822426c=
2ea1a74f7e1944e 100644
> --- a/meta-arm/recipes-security/optee/optee-client_4.9.0.bb
> +++ b/meta-arm/recipes-security/optee/optee-client_4.10.0.bb
> @@ -1,4 +1,4 @@
>  require recipes-security/optee/optee-client.inc
>
> -# v4.9.0
> +# v4.10.0
>  SRCREV =3D "9f5e90918093c1d1cd264d8149081b64ab7ba672"
> diff --git a/meta-arm/recipes-security/optee/optee-examples_4.9.0.bb b/me=
ta-arm/recipes-security/optee/optee-examples_4.10.0.bb
> similarity index 91%
> rename from meta-arm/recipes-security/optee/optee-examples_4.9.0.bb
> rename to meta-arm/recipes-security/optee/optee-examples_4.10.0.bb
> index 7c9bd97246ea9c8591cd74df896a6ea90c3b2aa0..15fddb79206daad4218d848fa=
64a3c4fe9106b3d 100644
> --- a/meta-arm/recipes-security/optee/optee-examples_4.9.0.bb
> +++ b/meta-arm/recipes-security/optee/optee-examples_4.10.0.bb
> @@ -1,4 +1,4 @@
>  require recipes-security/optee/optee-examples.inc
>
> -# v4.9.0
> +# v4.10.0
>  SRCREV =3D "934c7edb74a26e90f68024cf441073528444177f"
> diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.9.0.bb b=
/meta-arm/recipes-security/optee/optee-os-tadevkit_4.10.0.bb
> similarity index 100%
> rename from meta-arm/recipes-security/optee/optee-os-tadevkit_4.9.0.bb
> rename to meta-arm/recipes-security/optee/optee-os-tadevkit_4.10.0.bb
> diff --git a/meta-arm/recipes-security/optee/optee-os_4.9.0.bb b/meta-arm=
/recipes-security/optee/optee-os_4.10.0.bb
> similarity index 53%
> rename from meta-arm/recipes-security/optee/optee-os_4.9.0.bb
> rename to meta-arm/recipes-security/optee/optee-os_4.10.0.bb
> index cd369382c3c4c378c7e782e3dcd6b01fd436b114..b4c6cccaa210870a414afd776=
efdcf8cb7be2a59 100644
> --- a/meta-arm/recipes-security/optee/optee-os_4.9.0.bb
> +++ b/meta-arm/recipes-security/optee/optee-os_4.10.0.bb
> @@ -2,5 +2,5 @@ require recipes-security/optee/optee-os.inc
>
>  DEPENDS +=3D "dtc-native"
>
> -# 4.9.0
> -SRCREV =3D "c2b0684fcd89929976a8726e6e3af922b48dd2c7"
> +# 4.10.0
> +SRCREV =3D "753afbbee1682f5d16fd30e87b31058a4fd4f4b8"
> diff --git a/meta-arm/recipes-security/optee/optee-test_4.9.0.bb b/meta-a=
rm/recipes-security/optee/optee-test_4.10.0.bb
> similarity index 92%
> rename from meta-arm/recipes-security/optee/optee-test_4.9.0.bb
> rename to meta-arm/recipes-security/optee/optee-test_4.10.0.bb
> index 2cd5fc5c53e4726d9c6f0545db22dabae48635ef..f392a43e475c41af57afd04e8=
959aba824aa341d 100644
> --- a/meta-arm/recipes-security/optee/optee-test_4.9.0.bb
> +++ b/meta-arm/recipes-security/optee/optee-test_4.10.0.bb
> @@ -1,7 +1,7 @@
>  require recipes-security/optee/optee-test.inc
>
> -# v4.9.0
> -SRCREV =3D "b27648ea8472cceceb8dda368a965c709066f7aa"
> +# v4.10.0
> +SRCREV =3D "88c93e87a5c172363ee986ded036a25cafcc9d2c"
>
>  LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Da8fa504109e4cd7ea575bc49ea=
4be560 \
>                      file://LICENSE-BSD;md5=3Ddca16d6efa93b55d0fd662ae5cd=
6feeb \
>
> ---
> base-commit: 02d361b4359fde9b6646129980f1484f7aa5b09e
> change-id: 20260608-mfe-optee-4-10-0-d9e3c70ca845
>
> Best regards,
> --
> Marco Felsch <m.felsch@pengutronix.de>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7071): https://lists.yoctoproject.org/g/meta-arm/mess=
age/7071
> Mute This Topic: https://lists.yoctoproject.org/mt/119711029/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kud=
zu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

