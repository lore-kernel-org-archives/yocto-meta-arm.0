Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85163C4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 07:29:10 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.12899.1713770945954078594
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Apr 2024 00:29:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=K4J7MnoV;
 spf=pass (domain: linaro.org, ip: 209.85.208.180, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2dd6c160eaaso9159471fa.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 22 Apr 2024 00:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713770944; x=1714375744; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2rJ2XSf33z962bM1Q0Io6Vx0HFtOrk/yJuzaJI0d66g=;
        b=K4J7MnoVJUISSm2Brbt9nte2xLoTWpIVaDTB0h5fQDskGJOgyTyE8C9C5As3V4FdJQ
         03WlxBvvzbJX6HiuLpLf/h+qfNRc5apkSFsC4IS1BT8RWF1W846O4chtwu5/zS+9gOg+
         dYMnMVZmLU38rG7NSaZJnBABhvWJ30z8Po+vc3LPSw4tRs6hPBD3L6jen/P5+IQ5lf8M
         oXDa83muNx3Kc6LbQakrqFT2V1pKz0Ug+e7jifSuR1XKD5rIMHcw2ASqehsNOy5Lj/7l
         TlGwAE/GIV02Bip3InXzZOPRmgEnWoTFzzDX0mng5s4nZmLEcEfE8hG1kdj2P6mERfPW
         iUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713770944; x=1714375744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rJ2XSf33z962bM1Q0Io6Vx0HFtOrk/yJuzaJI0d66g=;
        b=UIFXCvPrAPqcEBWKMvM7k9xbyCn78iNE8sKfuC56qmWnvm7OABDitJZ3BfwqR4Vqas
         uimppQm0zrY856G8XDgotGIuSCRXXVmhG5RCLUHF0gXrvkGNbJ8QLK65hoG37uGlztAg
         uZoqhEBUX34IqTx7Q4XNJEC/vTC/kykYrJXzI+DW4zXXicy1H6eHxWeJfIN3g5KEnxRQ
         l9cI4taf++Gt5SVf62l0TP31asQ6an9xrlBfwLluVfZ7lkUgrXKy2fvCFUuHJlZ98/nI
         b3d6kWaRTav+h+v/ysC1VY3SppDXYtgutY/4jmlxnM7D/zsMLUymMgGzjwR+v3ReXs8J
         bfOg==
X-Gm-Message-State: AOJu0YwFkG85dg7nxUqt45JLK6Dyr0EGMlEu16JMJQWuldZqyoA8qgB1
	/1njr/MiiipjqXGAqkQ7Rqdgi21Te5FI1vIoh00O+hfFqoRWuim+N3z9srPABE0=
X-Google-Smtp-Source: AGHT+IHzrjoN37DCj3FFLgVuqA0l1Nsxh/zsj96p7CEX4hvpDU7LraxaJJhMtBijCeYY3hLD6BgPwA==
X-Received: by 2002:a2e:9050:0:b0:2d9:fde0:86e2 with SMTP id n16-20020a2e9050000000b002d9fde086e2mr7080156ljg.15.1713770944039;
        Mon, 22 Apr 2024 00:29:04 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id w5-20020a2e8205000000b002dd1153dc4dsm713574ljg.77.2024.04.22.00.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 00:29:03 -0700 (PDT)
Date: Mon, 22 Apr 2024 10:29:01 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH 1/2] trusted-firmware-a: continue if TPM device is missing
Message-ID: <ZiYRvZYE2yaO49MU@nuoska>
References: <20240417110722.283283-1-mikko.rapeli@linaro.org>
 <ZiREdlA+SzuLso5y@kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZiREdlA+SzuLso5y@kudzu.us>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 22 Apr 2024 07:29:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5574

Hi,

On Sat, Apr 20, 2024 at 06:40:54PM -0400, Jon Mason wrote:
> On Wed, Apr 17, 2024 at 02:07:21PM +0300, Mikko Rapeli wrote:
> > All other firmware boot components also continue booting
> > if TPM is not found. It is up to subsequent SW components
> > to e.g. fail if rootfs can't be decrypted. Enables policies
> > like fall back to unencrypted rootfs if TPM device is
> > not found with qemu and swtpm.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> 
> This series is failing on all instances of qemuarm64-secureboot and
> qemuarm-secureboot.  You can see it on my gitlab CI at:
> https://gitlab.com/jonmason00/meta-arm/-/pipelines/1261200728
> 
> All of them appear to be due to detecting the following error (snipped
> from the dmesg of the errorlog):
> optee-ftpm optee-ta-bc50d971-d4c9-42c4-82cb-343fb7f37896: ftpm_tee_probe: tee_client_open_session failed, err=ffff3024
> optee-ftpm: probe of optee-ta-bc50d971-d4c9-42c4-82cb-343fb7f37896 failed with error -22

Bummer, checking what I missed here.

Did optee-test/xtest run and possibly pass despite of this? I don't see this from the logs.

Cheers,

-Mikko

> Thanks,
> Jon
> 
> > ---
> >  ...ot.c-ignore-TPM-error-and-continue-w.patch | 36 +++++++++++++++++++
> >  .../trusted-firmware-a_2.10.3.bb              |  5 +++
> >  2 files changed, 41 insertions(+)
> >  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch
> > 
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch b/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch
> > new file mode 100644
> > index 00000000..2d189d8e
> > --- /dev/null
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch
> > @@ -0,0 +1,36 @@
> > +From 1d1425bde8435d6e2b3e4f2b7bcb2eb293ef9601 Mon Sep 17 00:00:00 2001
> > +From: Mikko Rapeli <mikko.rapeli@linaro.org>
> > +Date: Mon, 15 Jan 2024 09:26:56 +0000
> > +Subject: [PATCH] qemu_measured_boot.c: ignore TPM error and continue with boot
> > +
> > +If firmware is configured with TPM support but it's missing
> > +on HW, e.g. swtpm not started and/or configured with qemu,
> > +then continue booting. Missing TPM is not a fatal error.
> > +Enables testing boot without TPM device to see that
> > +missing TPM is detected further up the SW stack and correct
> > +fallback actions are taken.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > +---
> > + plat/qemu/qemu/qemu_measured_boot.c | 3 ++-
> > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/plat/qemu/qemu/qemu_measured_boot.c b/plat/qemu/qemu/qemu_measured_boot.c
> > +index 122bb23b14..731b081c47 100644
> > +--- a/plat/qemu/qemu/qemu_measured_boot.c
> > ++++ b/plat/qemu/qemu/qemu_measured_boot.c
> > +@@ -79,7 +79,8 @@ void bl2_plat_mboot_finish(void)
> > + 		 * Note: In QEMU platform, OP-TEE uses nt_fw_config to get the
> > + 		 * secure Event Log buffer address.
> > + 		 */
> > +-		panic();
> > ++		ERROR("Ignoring TPM errors, continuing without\n");
> > ++		return;
> > + 	}
> > + 
> > + 	/* Copy Event Log to Non-secure memory */
> > +-- 
> > +2.34.1
> > +
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.3.bb
> > index b30ac725..13942dbb 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.3.bb
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.3.bb
> > @@ -11,3 +11,8 @@ SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=ht
> >  SRCREV_mbedtls = "72718dd87e087215ce9155a826ee5a66cfbe9631"
> >  
> >  LIC_FILES_CHKSUM_MBEDTLS = "file://mbedtls/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> > +
> > +# continue to boot also without TPM
> > +SRC_URI += "\
> > +    file://0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch \
> > +"
> > -- 
> > 2.34.1
> > 
> > 

