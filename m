Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F3FC4345F
	for <webhook@archiver.kernel.org>; Sat, 20 Apr 2024 22:41:10 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.22231.1713652862674830139
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 20 Apr 2024 15:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=D/foHPOl;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.161.53, mailfrom: jdmason@kudzu.us)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5aa1e9527d1so2592272eaf.1
        for <meta-arm@lists.yoctoproject.org>; Sat, 20 Apr 2024 15:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713652862; x=1714257662; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O6/hhADOeZykihpTLF91pU823HZMXKqS5aS5IRE8bIc=;
        b=D/foHPOlFnMBU5Ev0SrmiNqOL5Alo/kVaJHyX20Rv00N8/v/iGJvXBFPpk2DsAx0lD
         2TNpYYGYxAJKJyllCIgjIRDesvZGMSAcvys7tMz/SIE3zMyeyWTJ9oklAywDMEeOTucT
         LpXrv3JqIOe0Ky24KMiT0pCEuA9ZBHXgcIJd3P9x+GxJQeyXa57Zc0SowL0apamkO4F/
         zMsQwrXcvmllx9H6TsyI3LFGmiVOWf5UyFUOcUpjZpb4dymdCFRcvNiDPZBYGxvF/+wT
         hdtb4BwhBZeYw0WCWaHfzHATkEmIpmge8PGvnEvHrLlQxPgdOXWx7GJsr6WnYBUN/lRb
         R6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713652862; x=1714257662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6/hhADOeZykihpTLF91pU823HZMXKqS5aS5IRE8bIc=;
        b=NprtGXZjNIQpnUVH4IxwRxm9maN3Jf/69iR5b1jMUsT7p8xavsIZoFVK5KzLzx/+Id
         JkSggQ4g2mmuwmDJb81F4ZJpNKnrrwZ6ZaoO5w7Dor9P/pmOJeJpBVd7QBv5m7vjrebT
         DepH26aiwWjE/RZRZeql+JXK07piHOw9aUXGNFyMfZVH2B2mw0HPwLS95jPtFbLQlS9o
         sFAdhfuBia4H27n4CLKdDDqQ6rb6G3FcmRLMC+K3WRjSsGpMxQz0f2EP90fA4WgTOWAZ
         q2umYUCikmtz1waLilC5qk6CoTV6YeUNLHif1KHUwGxu7mSyCpyeQgqw+THRQDNxcm1D
         392w==
X-Gm-Message-State: AOJu0Yzkssw7l25xKFjwcM5WApyiVrwd31PYbSqy+maPWhDie+EVxFgh
	J8uxH7eYfbX1oIi6ckBLciqRTl9HWC8q3AJuR204m5hDGItpjZH+UXb93W1eGQ==
X-Google-Smtp-Source: AGHT+IHpXD5RlHxFqeJ1r4UNmvc56pg6F6O2STcsbyRBTOhYNSqPfu9xGMjA2/lZncMUiGpZX9q8tw==
X-Received: by 2002:a05:6358:7b90:b0:186:1abe:611e with SMTP id n16-20020a0563587b9000b001861abe611emr6071540rwg.30.1713652861784;
        Sat, 20 Apr 2024 15:41:01 -0700 (PDT)
Received: from kudzu.us ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id y10-20020a0cd98a000000b0069b7c8ced6asm1480517qvj.12.2024.04.20.15.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 15:41:01 -0700 (PDT)
Date: Sat, 20 Apr 2024 18:40:54 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH 1/2] trusted-firmware-a: continue if TPM device is missing
Message-ID: <ZiREdlA+SzuLso5y@kudzu.us>
References: <20240417110722.283283-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417110722.283283-1-mikko.rapeli@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 20 Apr 2024 22:41:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5569

On Wed, Apr 17, 2024 at 02:07:21PM +0300, Mikko Rapeli wrote:
> All other firmware boot components also continue booting
> if TPM is not found. It is up to subsequent SW components
> to e.g. fail if rootfs can't be decrypted. Enables policies
> like fall back to unencrypted rootfs if TPM device is
> not found with qemu and swtpm.
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>

This series is failing on all instances of qemuarm64-secureboot and
qemuarm-secureboot.  You can see it on my gitlab CI at:
https://gitlab.com/jonmason00/meta-arm/-/pipelines/1261200728

All of them appear to be due to detecting the following error (snipped
from the dmesg of the errorlog):
optee-ftpm optee-ta-bc50d971-d4c9-42c4-82cb-343fb7f37896: ftpm_tee_probe: tee_client_open_session failed, err=ffff3024
optee-ftpm: probe of optee-ta-bc50d971-d4c9-42c4-82cb-343fb7f37896 failed with error -22

Thanks,
Jon

> ---
>  ...ot.c-ignore-TPM-error-and-continue-w.patch | 36 +++++++++++++++++++
>  .../trusted-firmware-a_2.10.3.bb              |  5 +++
>  2 files changed, 41 insertions(+)
>  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch
> 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch b/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch
> new file mode 100644
> index 00000000..2d189d8e
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch
> @@ -0,0 +1,36 @@
> +From 1d1425bde8435d6e2b3e4f2b7bcb2eb293ef9601 Mon Sep 17 00:00:00 2001
> +From: Mikko Rapeli <mikko.rapeli@linaro.org>
> +Date: Mon, 15 Jan 2024 09:26:56 +0000
> +Subject: [PATCH] qemu_measured_boot.c: ignore TPM error and continue with boot
> +
> +If firmware is configured with TPM support but it's missing
> +on HW, e.g. swtpm not started and/or configured with qemu,
> +then continue booting. Missing TPM is not a fatal error.
> +Enables testing boot without TPM device to see that
> +missing TPM is detected further up the SW stack and correct
> +fallback actions are taken.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> +---
> + plat/qemu/qemu/qemu_measured_boot.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/plat/qemu/qemu/qemu_measured_boot.c b/plat/qemu/qemu/qemu_measured_boot.c
> +index 122bb23b14..731b081c47 100644
> +--- a/plat/qemu/qemu/qemu_measured_boot.c
> ++++ b/plat/qemu/qemu/qemu_measured_boot.c
> +@@ -79,7 +79,8 @@ void bl2_plat_mboot_finish(void)
> + 		 * Note: In QEMU platform, OP-TEE uses nt_fw_config to get the
> + 		 * secure Event Log buffer address.
> + 		 */
> +-		panic();
> ++		ERROR("Ignoring TPM errors, continuing without\n");
> ++		return;
> + 	}
> + 
> + 	/* Copy Event Log to Non-secure memory */
> +-- 
> +2.34.1
> +
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.3.bb
> index b30ac725..13942dbb 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.3.bb
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.3.bb
> @@ -11,3 +11,8 @@ SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=ht
>  SRCREV_mbedtls = "72718dd87e087215ce9155a826ee5a66cfbe9631"
>  
>  LIC_FILES_CHKSUM_MBEDTLS = "file://mbedtls/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +# continue to boot also without TPM
> +SRC_URI += "\
> +    file://0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch \
> +"
> -- 
> 2.34.1
> 
> 

