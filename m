Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EFF81090233
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 14:11:41 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12139.1773929494524415242
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 07:11:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=PiH//yrK;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.210.48, mailfrom: jdmason@kudzu.us)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d75371d873so1113970a34.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 19 Mar 2026 07:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773929494; cv=none;
        d=google.com; s=arc-20240605;
        b=kHV+KKQF/h/7a4SIjMtdu56ItFc0am6aCUoKuQFVrnlQqXF0Q5iP7//SMRQiExIIy2
         TP2beCsbU9X4Y2KWia5nt1/arEx5ycdJjdYvOeY/CkfUcyyKEjkLPep8+YWOOdJkaLMo
         WU/S069lwjVR2n0RaKWHyI6Tp46E2nCobObMnqaT6NM2fy1cpI7lWsZTR1jUpToJ3MXB
         D0DP7+arrCcA+VMdMdLobOcHocJVT+AVt6L3Z/Og8ofJihGnQ31puTwJ8tObg2hOZGWC
         Qtivp6oqUxAvwUIgTaYU7v8uLafh+PSjq40jskOixbc+pb2VwSBrUAKPFgl9a5rGcDFR
         VDqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2YOfviUPVkIMfVlf1Cfq++an2MzFcKQyk/6JNy1r9Ag=;
        fh=CNtzBQdTrBaWN/2tTb2OjhpHSUuk/liWQySmN8Hroh8=;
        b=aYwQgDDPc7jd2P/FUKoQAVBcHbdBOrAcS+JbKppFBUIUz69lOru00QHf/2sxbJ72vT
         p7dzfSG2BGwaLm26hnRvZ6vvEp4oEbrcWuaw9VQSDC6J3kxkUzj59rvfZrFPXk/n6+i5
         Uv2AwegBKBGrqslsUO3HYWV/Dt9f/AvChgast+Q6lvxgMb8vRIPGMBg4wUwjebF1HEF2
         zuiceUTI2jzrvcszy/ia4Q0VtRXetsjHs0Vyf5vQsV0wlaZXs2yidW/rFil+M8G1i2WO
         jL+QrFewq158yN/1CVVoaj3Ibb/eoECEYBJV8/xFBzY6deyirlSrMWevzV/+TgqHIK5G
         djPw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1773929494; x=1774534294; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YOfviUPVkIMfVlf1Cfq++an2MzFcKQyk/6JNy1r9Ag=;
        b=PiH//yrKRR9HlcWqqlx+gDvHNHUFfN8pIecDQByB4wmJGag22t2PBhjUiYVyRM+aKb
         9P4/EZjELA6oLff9pHR+1MDNwhv4yMo4WXH5kJQXARXbiW2G11Pyk0+b9tcNexU2NUui
         1xA82RX3i9pkb2Iy/bAnv8sikoFuJDabNr1kMWhHWOs+JjsKfi93gPQMkxwGCTloe+ji
         aZgPSJX9E/g/y5Ea/07EibHffDRxOfd0GCLuBThtLRPFd9PNQHY7xzhRrEmHHfxoXlvu
         28Mtnj+WzZUbktfrw9uZlDAIjAJPoJLEGKE/cv/8GwOJg99RhP4j9JCK6Jsvj9EW+jae
         uz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773929494; x=1774534294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2YOfviUPVkIMfVlf1Cfq++an2MzFcKQyk/6JNy1r9Ag=;
        b=DY5p0ZcSCTESlBFNSGPaWEg0eR+0ULtwWbMfHJdVJ7Ob0I1yItf9dvl4ZAgI/eJQQ/
         XVlVxQIZNU+vx+zjUikXY7yCiY8V9m7qoNqrg8qUcCd6EMdkCFR4wxcpqf2ee2ox894+
         BkSQGw415Lx/frKmeBcXWH03xD3eM7oTHn8i2oLBm9dH5yoeUdhzsaAkKsxPo7CHYISP
         N87fLkM1ZaRDJcOI36rd6gwinJ+ua6hLU+sOUVOGBl4R1M1ZTAW0CHUzdGYDHcc94ENQ
         tYVixrmV6cyi2QBmfYXEDgkSytfZ2NSPD3J4SJuPNeXZ8fbxbIPbi9QJ+tkJXh948a7a
         i/rw==
X-Gm-Message-State: AOJu0Yz4HTvyya+11sVmOrk/yh7/igYIyCh6nkzn0qwaZR1NLfbG62Fb
	jFkKsxnvD6VmwnPCXhsafk77ronG5fx0O3f/oOyqm+nM/5KNtqGa0D5Xqq2W0FV3dvQgvAJLL+0
	v2vcnFLsP6eswppjbCam5YHdT2qAo5a9Tw5HitdNM
X-Gm-Gg: ATEYQzynHMcLjRsK4a46etNc0D77gV1oe9ewN7JHNgkdj/K3iYUwCDRS7vOpiLf3rtF
	58aa7/6iXZxPWQE5fda7JkQjBMXIYBg8pZrDxJzuehlMi645/T4RsPmegFgLeyPwfvSeTbr9C1B
	mdiQ226crFjh6+P2DWgLP7vFRUdcdcIwfl/of9er94C4vZegrZx5SdWXmwgAO0SxvOq4EBv8zvC
	0ssQQUXrpRWysiFnGiYJcLRzgZwBPLmaJiQ5DKbGwN/0zWtKBvbYzDaz23ZWuIgP3QnV69DlICM
	CAQJfzEb
X-Received: by 2002:a05:6830:f94:b0:7d7:5959:946f with SMTP id
 46e09a7af769-7d7ca56fc0amr4401516a34.7.1773929493610; Thu, 19 Mar 2026
 07:11:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260318122948.3511335-2-jose.quaresma@oss.qualcomm.com>
In-Reply-To: <20260318122948.3511335-2-jose.quaresma@oss.qualcomm.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Thu, 19 Mar 2026 10:11:22 -0400
X-Gm-Features: AaiRm50YrYFX5FbI-e3c79oDviZATZxfeFY4M4q2Vj3rHP3jty89UvkuqfUStBw
Message-ID: <CAPoiz9wiA7yLLBycGkd4BAk4Lw1wnJTfgw5ABwzcVfece=D_Ww@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] layers: update for wrynose release series
To: quaresma.jose@gmail.com
Cc: meta-arm@lists.yoctoproject.org, 
	Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 19 Mar 2026 14:11:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6964

Thanks for the patch, but we pushed a quick patch to get our CI
working before we saw yours on the list.

Thanks,
Jon

On Wed, Mar 18, 2026 at 8:30=E2=80=AFAM Jose Quaresma via
lists.yoctoproject.org
<quaresma.jose=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
> ---
>  meta-arm-bsp/conf/layer.conf       | 2 +-
>  meta-arm-toolchain/conf/layer.conf | 2 +-
>  meta-arm/conf/layer.conf           | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
> index ecb91b08..58ab6b87 100644
> --- a/meta-arm-bsp/conf/layer.conf
> +++ b/meta-arm-bsp/conf/layer.conf
> @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-arm-bsp"
>  BBFILE_PATTERN_meta-arm-bsp =3D "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arm-bsp =3D "5"
>
> -LAYERSERIES_COMPAT_meta-arm-bsp =3D "whinlatter"
> +LAYERSERIES_COMPAT_meta-arm-bsp =3D "whinlatter wrynose"
>
>  LAYERDEPENDS_meta-arm-bsp =3D "core meta-arm"
>  # This won't be used by layerindex-fetch, but works everywhere else
> diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf=
/layer.conf
> index 8bffff41..b51fc107 100644
> --- a/meta-arm-toolchain/conf/layer.conf
> +++ b/meta-arm-toolchain/conf/layer.conf
> @@ -9,4 +9,4 @@ BBFILE_PATTERN_arm-toolchain :=3D "^${LAYERDIR}/"
>  BBFILE_PRIORITY_arm-toolchain =3D "5"
>
>  LAYERDEPENDS_arm-toolchain =3D "core"
> -LAYERSERIES_COMPAT_arm-toolchain =3D "whinlatter"
> +LAYERSERIES_COMPAT_arm-toolchain =3D "whinlatter wrynose"
> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> index 9d18c7c4..bfcd569d 100644
> --- a/meta-arm/conf/layer.conf
> +++ b/meta-arm/conf/layer.conf
> @@ -13,7 +13,7 @@ LAYERDEPENDS_meta-arm =3D " \
>      core \
>      arm-toolchain \
>  "
> -LAYERSERIES_COMPAT_meta-arm =3D "whinlatter"
> +LAYERSERIES_COMPAT_meta-arm =3D "whinlatter wrynose"
>
>  # runfvp --console needs telnet, so pull this in for testimage.
>  HOSTTOOLS_NONFATAL +=3D "telnet"
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6961): https://lists.yoctoproject.org/g/meta-arm/mess=
age/6961
> Mute This Topic: https://lists.yoctoproject.org/mt/118381496/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kud=
zu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

