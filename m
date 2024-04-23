Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B5EC4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 18:21:25 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.2564.1713896480630492804
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Apr 2024 11:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=aJ190rmx;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-78ebc7e1586so12505185a.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 11:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713896480; x=1714501280; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L7iK+LdSgpb1BMHn28RriRBolwXelckrcKR+V1XF5+M=;
        b=aJ190rmxGkjjVddDxw/48RjbXURObJSKGMB0xB6cCsYOPwDZmjKgf2ML8NFI9Gj72Q
         clmPJ1tm0HEloX5bILw6k9jKi3BWVDp8YB0UI1h1RZBBB17BMPqVFHtY01cd3NXLMJxQ
         S83muJO9lVciIzd78maSoAuuEwNPAFhKBqauWj0XI1T3anYo4NJ2R2q+oqvWTAtz4yyj
         2yg2PJrd75nTESkxu3rw5SHbyp3FDetDlU1pxU8J7eaOKWdqj4Tit/sTpfYuqAETdwFY
         F2jAlsRtRR+mpHubfpuXSvVJPMgv71GnoPLsROZQ5QsKAy+yuV/h6CntyHevcUPOdbmn
         kt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713896480; x=1714501280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7iK+LdSgpb1BMHn28RriRBolwXelckrcKR+V1XF5+M=;
        b=drOyrsf9WqAiqd5ZuXFVV6thnO2gBKDNvMArCw+IoBySDZmM8q5mLolpQNsFn7Si3B
         jJ/qzz2VHBGAejkjxwbMoXnvGXQskuEer0vwdUxboH7jX/6MyhZuFHQKSOcUOs+Myl68
         203kgfwKJw0xHu5JWk55thWiDcBg6XKuWuSegGSJMDWO55X204xp3Mm4A/fT1GgMRfqd
         d373wUhFPm6e/ue7YW4jclElp5YuLAXKoFmYmKyMxeHKgdtJaw0QwOcni5iKj8wHh68R
         Vzr4WcVh2EFeke1n8pCQZmXZ6r4BYhszHx/ht0cXesuGHLz+y8K2/7eLMLemuSEkKgl6
         hW4Q==
X-Gm-Message-State: AOJu0YxYFd0N3Vb9Q4dwk1CQAqkGWm9Wq5fa/MZy2O72zZZK27pE3j+K
	WkPL0m8/gz9xdSgsuC9tqU6iDmayLaSyn72BZ3zjJYJ30mBj5hQ38cfoRDWooA==
X-Google-Smtp-Source: AGHT+IFM6CwXXpkYbGOaZF5XArLUnY+/GZGX7aDjUSGNTxfqkFf0LUuIj60OY85ZHyrv96ZFRzk2Qg==
X-Received: by 2002:a05:6214:14e6:b0:6a0:8914:65a8 with SMTP id k6-20020a05621414e600b006a0891465a8mr484213qvw.15.1713896479675;
        Tue, 23 Apr 2024 11:21:19 -0700 (PDT)
Received: from kudzu.us ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id k10-20020a0c970a000000b006a079a9adc4sm2736531qvd.40.2024.04.23.11.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 11:21:19 -0700 (PDT)
Date: Tue, 23 Apr 2024 14:21:12 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH 1/2] trusted-firmware-a: continue if TPM device is missing
Message-ID: <Zif8GPUamF5+3fDR@kudzu.us>
References: <20240417110722.283283-1-mikko.rapeli@linaro.org>
 <ZiREdlA+SzuLso5y@kudzu.us>
 <ZiYRvZYE2yaO49MU@nuoska>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZiYRvZYE2yaO49MU@nuoska>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 18:21:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5597

On Mon, Apr 22, 2024 at 10:29:01AM +0300, Mikko Rapeli wrote:
> Hi,
> 
> On Sat, Apr 20, 2024 at 06:40:54PM -0400, Jon Mason wrote:
> > On Wed, Apr 17, 2024 at 02:07:21PM +0300, Mikko Rapeli wrote:
> > > All other firmware boot components also continue booting
> > > if TPM is not found. It is up to subsequent SW components
> > > to e.g. fail if rootfs can't be decrypted. Enables policies
> > > like fall back to unencrypted rootfs if TPM device is
> > > not found with qemu and swtpm.
> > > 
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > 
> > This series is failing on all instances of qemuarm64-secureboot and
> > qemuarm-secureboot.  You can see it on my gitlab CI at:
> > https://gitlab.com/jonmason00/meta-arm/-/pipelines/1261200728
> > 
> > All of them appear to be due to detecting the following error (snipped
> > from the dmesg of the errorlog):
> > optee-ftpm optee-ta-bc50d971-d4c9-42c4-82cb-343fb7f37896: ftpm_tee_probe: tee_client_open_session failed, err=ffff3024
> > optee-ftpm: probe of optee-ta-bc50d971-d4c9-42c4-82cb-343fb7f37896 failed with error -22
> 
> Bummer, checking what I missed here.
> 
> Did optee-test/xtest run and possibly pass despite of this? I don't see this from the logs.

optee-test is only being compiled, not being run as part of CI
(patches very much wanted and welcomed).  So, nothing exciting here
except the kernel trying to load the modules and erroring out.

Thanks,
Jon

> 
> Cheers,
> 
> -Mikko
> 
> > Thanks,
> > Jon
> > 
> > > ---
> > >  ...ot.c-ignore-TPM-error-and-continue-w.patch | 36 +++++++++++++++++++
> > >  .../trusted-firmware-a_2.10.3.bb              |  5 +++
> > >  2 files changed, 41 insertions(+)
> > >  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch
> > > 
> > > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch b/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch
> > > new file mode 100644
> > > index 00000000..2d189d8e
> > > --- /dev/null
> > > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch
> > > @@ -0,0 +1,36 @@
> > > +From 1d1425bde8435d6e2b3e4f2b7bcb2eb293ef9601 Mon Sep 17 00:00:00 2001
> > > +From: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > +Date: Mon, 15 Jan 2024 09:26:56 +0000
> > > +Subject: [PATCH] qemu_measured_boot.c: ignore TPM error and continue with boot
> > > +
> > > +If firmware is configured with TPM support but it's missing
> > > +on HW, e.g. swtpm not started and/or configured with qemu,
> > > +then continue booting. Missing TPM is not a fatal error.
> > > +Enables testing boot without TPM device to see that
> > > +missing TPM is detected further up the SW stack and correct
> > > +fallback actions are taken.
> > > +
> > > +Upstream-Status: Pending
> > > +
> > > +Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > +---
> > > + plat/qemu/qemu/qemu_measured_boot.c | 3 ++-
> > > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > > +
> > > +diff --git a/plat/qemu/qemu/qemu_measured_boot.c b/plat/qemu/qemu/qemu_measured_boot.c
> > > +index 122bb23b14..731b081c47 100644
> > > +--- a/plat/qemu/qemu/qemu_measured_boot.c
> > > ++++ b/plat/qemu/qemu/qemu_measured_boot.c
> > > +@@ -79,7 +79,8 @@ void bl2_plat_mboot_finish(void)
> > > + 		 * Note: In QEMU platform, OP-TEE uses nt_fw_config to get the
> > > + 		 * secure Event Log buffer address.
> > > + 		 */
> > > +-		panic();
> > > ++		ERROR("Ignoring TPM errors, continuing without\n");
> > > ++		return;
> > > + 	}
> > > + 
> > > + 	/* Copy Event Log to Non-secure memory */
> > > +-- 
> > > +2.34.1
> > > +
> > > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.3.bb
> > > index b30ac725..13942dbb 100644
> > > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.3.bb
> > > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.3.bb
> > > @@ -11,3 +11,8 @@ SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=ht
> > >  SRCREV_mbedtls = "72718dd87e087215ce9155a826ee5a66cfbe9631"
> > >  
> > >  LIC_FILES_CHKSUM_MBEDTLS = "file://mbedtls/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> > > +
> > > +# continue to boot also without TPM
> > > +SRC_URI += "\
> > > +    file://0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch \
> > > +"
> > > -- 
> > > 2.34.1
> > > 
> > > 
> 

