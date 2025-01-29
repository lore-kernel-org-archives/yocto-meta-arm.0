Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81ACDC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 07:04:14 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.7572.1738134247161693041
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 28 Jan 2025 23:04:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=PR8hpEz2;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-543d8badc30so3308035e87.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 28 Jan 2025 23:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738134245; x=1738739045; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EQ7OXzS43baqzAF1Yg9inF9WF9+kRIog7zNO2sozhwc=;
        b=PR8hpEz2HqpL0mnv7eewNfehlNs95osxuz3puZYQTkLwmzF6Uy9o6b4OpAYrV0ljeX
         Pr5w322Mdiqnjmon3+9eB57vAYG9JN9lpQTGPRmakG5i9ZKTlKAjZal4r8r7pDrf77B7
         I9j8hwBkvEZxX2EQgecN4S5T4v0EYldWCudK/H0bKEu55arnDQq/N8CugSh6yqAQQYTL
         KE3ODzc0j9N41wHWERkV/hgbPLSvNPDVC9bLyFgHE+tpNSPUB/u0k45Skd6n81Rr6dLo
         8LiC+y4OsBjAHfsWVt7Q3986A/jVT/ROrnjf/fIGmrFN33n83m7AzIPECTn6cB0/yr/N
         cNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738134245; x=1738739045;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EQ7OXzS43baqzAF1Yg9inF9WF9+kRIog7zNO2sozhwc=;
        b=XAEz4fZWcXinXgOj20W1vY4IFBPxr1xP3Qv6c7QPdaD0Y3FJmhf6Sxr6pJ8I+6siyB
         5HJKcjSU8L14JJt180oHHZxV64QUhp5jiP7TC9HhFXwklGTlI87b4EULQJUkh0u97YeF
         rdHUzkYVfPdSGFxSp9H/haEPAVQBrIaohdVjBpuiIwuLMKDUwzfqQlKkPvVF0ukYsovt
         0bdS+u8P0U13XdiBDPNWPu0YiWzWbvGatGtaSj96uWWUmCHOUuvSh/pe7KVd4aDx6OyG
         1tt5Tl0TL37S9MakhUe1pMg0+nRG5XuvKSAEBQv9H3s0ZAm4vwIjpwhcRKnwVvmfOiz4
         cINA==
X-Gm-Message-State: AOJu0YxI+g3cJAUo/XeIGxFx/mWGxAWySBIeWR02Wu/agYkOHkhzYlE7
	4GL4iwQtYqVsye/XUmKqyqZcPDzNkz+KHQJ/223+ULluYQEOyAbLxiw1H5qD0XU=
X-Gm-Gg: ASbGncsYIRHzHryn812V9olgTgX0/YmKpm4ebomxxZPSO/f8xTx4bOq9+x8sSrzMN0W
	asDFsyJMN3+oW9HS3kTnpBGiBgpx/nRuVJ/wxPJbfD8MumlUEehqtCo5pOyRI8xK7HD5EvXDL03
	6oUDFCBlrB65pLMS4q3T2u+Br48O+ke2dMV7nEogQaN42tjkL8ptCH5KzWOo8h2yIaw7u4KPGQf
	HjKPAmPmBz+GmVQVgLcdVqDtTiqCNqVdbfPIO896jTZ9pzOESH9+iUu7g8DMEsgIN5Xz2ils0Qw
	IfD1G9ioVPfvjQNqmXQbXBNIyVkJpPIcAwADQKsA
X-Google-Smtp-Source: AGHT+IHcZNk+nlgaXvm66RbdyMduBWE3PSfgSNz1CeK+hbJAYKFrbvDTyoiuQXtZcL216Q56j5USEQ==
X-Received: by 2002:ac2:4943:0:b0:543:bb21:4255 with SMTP id 2adb3069b0e04-543e4c417e6mr467078e87.49.1738134244963;
        Tue, 28 Jan 2025 23:04:04 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8368379sm1868343e87.136.2025.01.28.23.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 23:04:03 -0800 (PST)
Date: Wed, 29 Jan 2025 09:03:59 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] systemd-boot: update systemd-bootaarch64.efi
 path
Message-ID: <Z5nS314VFsL9NcSk@nuoska>
References: <20250127072356.852345-1-mikko.rapeli@linaro.org>
 <CAPoiz9wANA-Tgub4G+AXs_yQf9-NyKsSOJX5J0z=qOu8=jA42A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPoiz9wANA-Tgub4G+AXs_yQf9-NyKsSOJX5J0z=qOu8=jA42A@mail.gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 29 Jan 2025 07:04:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6355

Hi,

On Tue, Jan 28, 2025 at 03:33:28PM +0000, Jon Mason wrote:
> On Mon, Jan 27, 2025 at 7:24 AM Mikko Rapeli via
> lists.yoctoproject.org
> <mikko.rapeli=linaro.org@lists.yoctoproject.org> wrote:
> >
> > poky updated systemd from 256 to 257 which changed
> > the build time path.
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> 
> I tried this out a couple weeks ago.
> https://gitlab.com/jonmason00/meta-arm/-/jobs/8885513336
> Essentially, systemd changed more than just the location.  It changed
> UKI fairly significantly, and that is failing to generate an
> authenticated image.
> I was able to bisect it to the systemd commit
> https://github.com/systemd/systemd/commit/2188c759f97e40b97ebe3e94e82239f36b525b10
> 
> I ran out of time to bug this further, and meant to email you with the above.
> 
> I'm hesitant to apply a patch that doesn't fully resolve the issue
> (though Ross might have a different opinion).  So, if you can manage
> to fix the systemd UKI issue, I'd be willing to take it then.

Ok I will have a look. oe-core has pretty good selftests for uki.bbclass and
systemd-boot so I would have expected them to catch major regressions, apart
from secureboot which is the addition to them in meta-arm.

Cheers,

-Mikko

> Thanks,
> Jon
> 
> > ---
> >  meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc b/meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
> > index 84196a68..9d72dac5 100644
> > --- a/meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
> > +++ b/meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
> > @@ -1,6 +1,6 @@
> >  inherit sbsign
> >
> > -SBSIGN_TARGET_BINARY = "${B}/src/boot/efi/systemd-boot${EFI_ARCH}.efi"
> > +SBSIGN_TARGET_BINARY = "${B}/src/boot/systemd-boot${EFI_ARCH}.efi"
> >
> >  do_compile:append() {
> >      do_sbsign
> > --
> > 2.43.0
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#6350): https://lists.yoctoproject.org/g/meta-arm/message/6350
> > Mute This Topic: https://lists.yoctoproject.org/mt/110835165/3616920
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kudzu.us]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

