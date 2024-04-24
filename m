Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48EEEC4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 06:37:23 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.10322.1713940640929045462
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Apr 2024 23:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ggin67na;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-516d68d7a8bso591270e87.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 23:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713940639; x=1714545439; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rcly/gGAo/G8LsjY2SUXn/jSGC/yII4khD1fND2DVAI=;
        b=ggin67naM442OaCpz1VS8SWjRoJ0k2oc+hJ0ajr0qbOc6I0b6AvVoYUG99qUjy3X6S
         8EiGE/aeeVvE/Syi7v9mMTxq+YhoFdSFyEv6q9cHo0NCC23gZkX0HJhKVBfOZoM03zSn
         CXDmIC+1IjeYZ7SuC63TCoGolF4J7E6KSxTjJFkdX6KqAiMJtpaw6Bq0FeoH4/JuV3wL
         tRfTST60+BblwQNxp4vplZYSnJ+lxIlY9UjWC5l796NF4KBzJ2w9+LjRJ/bcW3BJhupD
         xiaWT0fBCKW1tRvq/BIHYY0Rka8wgq5m9xl6v1qOsxqQqCwvZaNnjLt+uFR6iVf502U/
         ONgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713940639; x=1714545439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rcly/gGAo/G8LsjY2SUXn/jSGC/yII4khD1fND2DVAI=;
        b=Ab1HLevPIRUR4AoeuFP+es1BLTs0kkUl1lAHww2YseUkV8cbbCfrT2kfEB2teHkjSf
         QgigwTLpHDG/cjcUDbzRzcrx0seMJre55vRMVGQG9vwZPUuU6ZHPKoOlMcEy7liTilbu
         RdGiOK1vPa1seExqU9JUiQDAiSGSuNovCvh1HYP2x6rN+m4AmiiPi6GWlUoZEx2kcn2V
         4Nyedf1qQLrXTDlGKTtwmYryFZl1XVZCTMs4nDFc+wBsWwQfwGZVjZ8AOxTNl92F9e2E
         MgaUVTCXzCWhgm3VauF5t6evDzSu7ia6UItZl7g2+PZt+7Q0mrRg/iXkC/eQwRXoDnTw
         tCsw==
X-Gm-Message-State: AOJu0YyOy8JTQmEZy8B0UF2R5wqNmmlKgPqsEmYozX+o9RiDACCT6fU0
	YO9zJmebHjPXaPGesjDLeQ/2CWX9ysBWQyynv+l0FZEk+ZJk9Wc3/EqHxP7igbM=
X-Google-Smtp-Source: AGHT+IEM8daoP8TUgKATyPQggjGGmd2YZH5AJ29bD/prCQd6yw6hAw0XmrPWbon5Jt4WAuN/Ua0uMA==
X-Received: by 2002:a19:2d4d:0:b0:518:b17f:237a with SMTP id t13-20020a192d4d000000b00518b17f237amr1619198lft.27.1713940638786;
        Tue, 23 Apr 2024 23:37:18 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id y24-20020a197518000000b00518b91e8fd7sm2266629lfe.235.2024.04.23.23.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 23:37:18 -0700 (PDT)
Date: Wed, 24 Apr 2024 09:37:16 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH 1/2] trusted-firmware-a: continue if TPM device is missing
Message-ID: <ZiionO_3d-zy5Oh1@nuoska>
References: <20240417110722.283283-1-mikko.rapeli@linaro.org>
 <ZiREdlA+SzuLso5y@kudzu.us>
 <ZiYRvZYE2yaO49MU@nuoska>
 <Zif8GPUamF5+3fDR@kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zif8GPUamF5+3fDR@kudzu.us>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 24 Apr 2024 06:37:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5601

Hi,

On Tue, Apr 23, 2024 at 02:21:12PM -0400, Jon Mason wrote:
> On Mon, Apr 22, 2024 at 10:29:01AM +0300, Mikko Rapeli wrote:
> > Hi,
> > 
> > On Sat, Apr 20, 2024 at 06:40:54PM -0400, Jon Mason wrote:
> > > On Wed, Apr 17, 2024 at 02:07:21PM +0300, Mikko Rapeli wrote:
> > > > All other firmware boot components also continue booting
> > > > if TPM is not found. It is up to subsequent SW components
> > > > to e.g. fail if rootfs can't be decrypted. Enables policies
> > > > like fall back to unencrypted rootfs if TPM device is
> > > > not found with qemu and swtpm.
> > > > 
> > > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > 
> > > This series is failing on all instances of qemuarm64-secureboot and
> > > qemuarm-secureboot.  You can see it on my gitlab CI at:
> > > https://gitlab.com/jonmason00/meta-arm/-/pipelines/1261200728
> > > 
> > > All of them appear to be due to detecting the following error (snipped
> > > from the dmesg of the errorlog):
> > > optee-ftpm optee-ta-bc50d971-d4c9-42c4-82cb-343fb7f37896: ftpm_tee_probe: tee_client_open_session failed, err=ffff3024
> > > optee-ftpm: probe of optee-ta-bc50d971-d4c9-42c4-82cb-343fb7f37896 failed with error -22
> > 
> > Bummer, checking what I missed here.
> > 
> > Did optee-test/xtest run and possibly pass despite of this? I don't see this from the logs.
> 
> optee-test is only being compiled, not being run as part of CI
> (patches very much wanted and welcomed).  So, nothing exciting here
> except the kernel trying to load the modules and erroring out.

Ok. I managed to reproduce this issue and also saw that optee-test xtest was
failing on the core-image-base. The image needs

IMAGE_INSTALL:append = " optee-client optee-os-ta optee-test"

and then optee-test/xtest passes. So optee itself is working and fine.

What exact config and commands does the CI job run? I could provide
the patches for optee-test/xtest.

Looking into the ftpm kernel error now...

Cheers,

-Mikko

