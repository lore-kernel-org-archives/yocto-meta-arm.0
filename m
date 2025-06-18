Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A414CC7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 12:29:36 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.5952.1750249772420085690
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 05:29:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=y0yBITzQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.45, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2ea08399ec8so4079575fac.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 18 Jun 2025 05:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1750249771; x=1750854571; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuwCHnAMb7INEY9mYeldGJ5GtD1uq3piSvN0RSCoHKM=;
        b=y0yBITzQBI0s8hMBLSyfNc+zeGpM0N35rFTJzmLEkcbH24gcVyJcKe1FMkwhB9xs3/
         gaQy9oi/Wu6Qh4HfTbyaJSZFGmE2T4v4H9OGvy9jSa6EgHYCAo/YDJrLR29xa6vsTdnj
         14otAcS9rjfkZOgO78myBWmz2NKSwpBpcSKXMuqUbvj496i6YYJV3UOwywxy7rKFU5EB
         dzzZ0y7hTx773c8e5KsFNIirs79nwBM9hN/JdkA0uyX2eUXbBTsRsUBMUArFsUfLl1ID
         WaRWYcmDJDtTfVLyOwMi4duP7M/FJbz/g+4w8/ko8IvdDDBMr47WUBlF1/YFpREXvuwV
         ZQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249771; x=1750854571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AuwCHnAMb7INEY9mYeldGJ5GtD1uq3piSvN0RSCoHKM=;
        b=sbJHnPpl9hDLQn+95OynC9AOaaqTxQwSFse7L801w67NyNKFDpyaLaCWAL6aNeVAAs
         ufMh+6eaWG9WRBRIpDQkBDQrYrj/IpDWn9r+nCfrMlWRZEXSJ0swUbU7+3NMsddXoEDP
         OZST1Tfktf56ZDeOeq0wrq0uovZm4DnAz5pSZN7Ppwgeug5HFUfkAWFIifV/nfiUSmCl
         9lBa8u9S/yc4uzhlL0yv7O4W99e60Kn8lUFNyt6sPHu3uX5JMAI8V2qA9ejAj5tRiWHL
         /KMGjx6oBAdtlp2J3SZ8w0LTidKZmj9W7HEP843V2SeQhupF4/3v+zKgx395/HRNjMgY
         gQ5g==
X-Gm-Message-State: AOJu0Yyw26u5XZJZPNrzmBPSCqIUGorYDn4xlknTyndJSRU8Yo/UF/Yz
	V3MBhP4caciI+FHvaKiwDRszyNTZlS1OArOSPzDbaEmDG9qys/SYQ/JzGuTSNYmnfMk2w6ejLZz
	NKPBSJOkspTrll8q/6gBofXy2sGpnE+xzXjEB/B5U
X-Gm-Gg: ASbGncsWY538kgbjlK3Qx2QjKcfiu7MSt3lq3Hvil340Y0X8Jti78xmusnAsHLg553e
	vHwsiqcjToiI+Pm3jMXUII1NbmLfwd0r6rha3bXoAw2FKG+6RmRRhH2l+cpCtJWpzDppxTHWldi
	4XSPPXKOfQrQb6hNGrfTClfViSFO2T67BCq5FcysccH/I=
X-Google-Smtp-Source: AGHT+IEAm6GTI4LnoMkD6+GHQR2qRlY3JqSusWnBO9E3JtRocxADfErL4XxRFdpdHclNa+Qfq+XKavBVcY/cG7mSPLU=
X-Received: by 2002:a05:6870:7996:b0:296:5928:7a42 with SMTP id
 586e51a60fabf-2eaf0b063afmr10340929fac.22.1750249771546; Wed, 18 Jun 2025
 05:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <339cab03-66a4-2b93-2964-6eee4eb057bc@crashcourse.ca>
In-Reply-To: <339cab03-66a4-2b93-2964-6eee4eb057bc@crashcourse.ca>
From: Jon Mason <jdmason@kudzu.us>
Date: Wed, 18 Jun 2025 08:29:20 -0400
X-Gm-Features: AX0GCFs5YscwTLyQojZB0AWN7PLiOT2fX05nbVLEM8gwhWVrChCFqx1gLkUsl9Q
Message-ID: <CAPoiz9xd+n0on5FfkquhMLvU+LfDEr3p+T2YVCKgrPFEp1_TSQ@mail.gmail.com>
Subject: Re: [meta-arm] if this meta-arm .inc file missing a trailing colon?
To: rpjday@crashcourse.ca
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Jun 2025 12:29:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6569

On Wed, Jun 18, 2025 at 6:07=E2=80=AFAM Robert P. J. Day via
lists.yoctoproject.org <rpjday=3Dcrashcourse.ca@lists.yoctoproject.org>
wrote:
>
>
> here:
>
> https://git.yoctoproject.org/meta-arm/tree/meta-arm-bsp/recipes-bsp/trust=
ed-firmware-a/trusted-firmware-a-fvp-base.inc#n7
>
> should there not be a trailing ":" at the end of that prepend
> operation?

I think you are correct, and a quick grep shows 10 other instances of
this in meta-arm.  Thanks for the heads up.

I wonder if there is a way to add a check for prepend and
FILESEXTRAPATHS in the sanity checkers.

Thanks,
Jon

>
> rday
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6568): https://lists.yoctoproject.org/g/meta-arm/mess=
age/6568
> Mute This Topic: https://lists.yoctoproject.org/mt/113705609/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kud=
zu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

