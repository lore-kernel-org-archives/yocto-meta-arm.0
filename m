Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F05C61CE8
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 13:50:06 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.60238.1749477006016878627
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Jun 2025 06:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=N+8YdRNW;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.210.42, mailfrom: jdmason@kudzu.us)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-735a8be4ea9so1076891a34.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 09 Jun 2025 06:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1749477005; x=1750081805; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhMCW9v+JU8X2SXFl/UN+dDVDJufF/Cg8h8GXaeCeb0=;
        b=N+8YdRNWqGcsUkNnd1Itg5K3a8pfsDTWbBOHAiOMsPIcyJRUk1y8k55g/tb0/1RRWw
         BjoNgL0gtfQDF/QAhHPjF+MrobazdSILLpsdst0MFIuGALBY+FzDM+hFB2wrfrlM5IdT
         Fljp6QNFZlJmcC+vr46asSsNC1YGT5FjSwG6I57w3pq/xaYgfmWCGnm/huITKmrXG+1i
         5pJA9+9e6mia+fotX5dWLI0xRFkKPfpHhoSaXYuwQUH5rerZ0YEB/MUQFa/NbOSx2YE8
         RMNwUDBxHOveKuvy1ErpG5UIo15vlNz+5x+u0xXd9DUiQGJeS0PM0FdRZB7kUP6A1ucy
         nNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749477005; x=1750081805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XhMCW9v+JU8X2SXFl/UN+dDVDJufF/Cg8h8GXaeCeb0=;
        b=A171mla5SSU7M6MeLy+6vONG7SW9XKgP4Glrt7Ubm1qtmuOJDhzzXSwqR0w2fB9MKC
         PbVbp9cPi/9hV9QIO3WMLlXlFelArZ+qI+TYt6gWq0cfIqkRJNmXRbiPk9f18ahQOnSj
         d9oPX/3X/wOhJ9jOXgQVDBBu7nKrxWJpEC0RcaybNuYjK22KGOHVZCRE+x14hZW9hCM4
         G99Wc6FXBD8um+s8Emk1TSVijbwrOok2cob6KzMOJqtfZ/sD0erDn2q8za5DAHLDJLkJ
         WX0KXIiSPOw9yVGg7J35jdcz1zMg4l7NXpWA4ASsET8LHAbHGDgwygqN2ANLc1ZFyGuM
         q79Q==
X-Gm-Message-State: AOJu0YzRHjD6aevfQTJYkx0+xoM3Zz1R1cRWHPFQAmB+kGZE6FJun3JJ
	8mtleDtqOx3z86zy7fxGJ3/DA/UlXDykc2EP9btKCh+jCXI/PZEQnnug7tPzfaonPTy3nFSFduh
	8P3+g+WEDR6AYxl4s6nU0dfmmQGnmnLps02NTQDvqE1M94mWMPz1rHOFG
X-Gm-Gg: ASbGnctKQ8Ur4L/uO0gGSxSzuceimWZ9TxPM/drb3mrs/51BYy0sHdr0JgODg1vyr5T
	Dykx4+jwiiSt3FLn+dGtu1F/3VrkU7iwOo5NePo7Ba/cQy+32T16rdqabHVY0D6RgvqhWUgN6TF
	/KR//MFL3+vjB50iwTJ3hPYTAOJbdL0zIV
X-Google-Smtp-Source: AGHT+IFuO3/BFWN8oe6oaJmYxTW4LHrPiumZz/BJoRm2KThyHhCxboK909sxDz2YEd2FA5PzglP6qPHCL0Jkxjw8umA=
X-Received: by 2002:a05:6871:bb0b:b0:2d5:230f:b34a with SMTP id
 586e51a60fabf-2ea0081fc3fmr9140649fac.9.1749477005100; Mon, 09 Jun 2025
 06:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAHw2UgDSp9jK_9Q0FsdfiGPdmWmGQRTfiTQoBg=ZrD16q0ucXA@mail.gmail.com>
In-Reply-To: <CAHw2UgDSp9jK_9Q0FsdfiGPdmWmGQRTfiTQoBg=ZrD16q0ucXA@mail.gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Mon, 9 Jun 2025 09:49:54 -0400
X-Gm-Features: AX0GCFuqyZKQZIGooj0Bc4AJ1v-TEncnbfh3vNFFTPQAk0PPNekD2TMfaxIUMcU
Message-ID: <CAPoiz9wk6fWsbOJkoiG1mMO6t39Zo8Dsv3JBQMxm=AZXh4m6RQ@mail.gmail.com>
Subject: Re: [meta-arm] fvp-base doesn't support armv8.2
To: marek.bykowski@gmail.com
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 09 Jun 2025 13:50:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6534

On Sun, Jun 8, 2025 at 4:14=E2=80=AFPM Marek Bykowski via
lists.yoctoproject.org
<marek.bykowski=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> When I simply change to "require conf/machine/include/arm/arch-armv8-2a.i=
nc" and "FVP_CONFIG[cluster0.has_arm_v8-2] =3D "1"" and "FVP_CONFIG[cluster=
1.has_arm_v8-2] =3D "1" " the FVP_Base_RevC-2xAEMvA doesn't boot at all. I =
do not see even a single line of log even from bl1. Would that mean the SW =
stack/Yocto doesn't support armv8.2 for fvp-base model platform?


No, this doesn't necessarily indicate a lack of support in the
software stack =E2=80=94 rather, it means you're using an untested
configuration. So far, we've only validated support for ARMv8.0, v8.4,
and more recently v8.5 on the FVP Base platform.

I'm not sure which release or branch you're working from, so I=E2=80=99ll
assume you're on master. If that's the case, you may need to disable
the ARMv8.5 configuration in meta-arm-bsp/conf/machine/fvp-base.conf.

Additionally, I recommend enabling debug in TF-A to help with early
boot visibility. You can do this by setting TFA_DEBUG =3D "1" in
meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-base.inc=
.

A good starting point would be to use the ARMv8.0 configuration and
confirm that it boots correctly =E2=80=94 which it did in previous releases=
 =E2=80=94
before attempting to move up to v8.2.

Let me know how it goes or if you need help with any of these changes.

Thanks,
Jon

> Thanks,
> Marek
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6533): https://lists.yoctoproject.org/g/meta-arm/mess=
age/6533
> Mute This Topic: https://lists.yoctoproject.org/mt/113539838/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kud=
zu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

