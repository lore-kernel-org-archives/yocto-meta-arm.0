Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1550DCDB483
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 13:54:49 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web10.216299.1697550885253975378
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 06:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=OjN2SPVk;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.46, mailfrom: jdmason@kudzu.us)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7ab9f1efecfso1886777241.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 17 Oct 2023 06:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1697550884; x=1698155684; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w4Lw1vZEvfR4xbZYKlIxC9YnHkopY+cihrgNUuPmor8=;
        b=OjN2SPVkSVM8PhxizmX9u88Qm2uTn2aLZyRuzxWyj6ouAaLGTd9gnvGclX8s/EYrFq
         egdkcLlo31ZGSKJQTcnS2EZJaZD3Lmt8RUfHwYCaiz72b/zN4motNjEErgdggCFJrMz9
         q8N7Kgs7ZuwLxJj7SHEt+lsVkqnfzP5yJKSLKyxs6sykbQKC4wVUcNPnu4fpJO53CrF/
         Urv1CSgQ8G8qOcKzZYQrRUx0YIAbG1MMK884i2yufrRijhtv1IbDOS9dSeW8PmZcCWgM
         vJpEf3Ktck2hAsrxNfqMiBW5zP4V1B1ZmE6htxDvOihWU3TJnef/Zmv5zNy843bGamVi
         nEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697550884; x=1698155684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4Lw1vZEvfR4xbZYKlIxC9YnHkopY+cihrgNUuPmor8=;
        b=izXtHEJCzb5yHneOCvDIUPqHv7Oyrmkb/UNX/CBAZmgFXj8mVhunXXQmTMMzerwLDg
         OjHWfTsQ93VB/mVF/PykP4Wgl6MClauY9pI4oKSv0S9Yv74SQdK3wimQbh7Fsdf9JZyW
         NnynVyYy9KcGNyZUHZkaPNDSqy0MFLGTYFYXcVmMngHhvyyXodJvX6JX24Vvp8LbwHIA
         uhfQvbM9GKFvbsA4JyY3e3DKfObdi5h66xoTe+VTL6C5VI3tv/iackc2Ty7/FbkGuqH4
         6zhj+JIzJzSgWFkh1W13LEM/zTpF4Mix1MfcSgACUtBlHzEjkZZ3/qTJYi8DjyB3/uoh
         R8rw==
X-Gm-Message-State: AOJu0YxwPa2PglK0DcrlWWc60SUVhzEucGK9RAkIQAUM+koM4Xb4RBuY
	Ip0TO9tOva+1HxaEGdOb2I4G+w==
X-Google-Smtp-Source: AGHT+IH4FtvfMeedEXEXQveKJ65sG/7+SxvEDmxy5BPVVhRRD0KQWK9408sX2aFWDUFVsUsRZUkJtg==
X-Received: by 2002:a67:c216:0:b0:452:721b:1cae with SMTP id i22-20020a67c216000000b00452721b1caemr2583010vsj.0.1697550884197;
        Tue, 17 Oct 2023 06:54:44 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id x18-20020ac87a92000000b004181b41e793sm628543qtr.50.2023.10.17.06.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:54:43 -0700 (PDT)
Date: Tue, 17 Oct 2023 09:54:37 -0400
From: Jon Mason <jdmason@kudzu.us>
To: harsimransingh.tungal@arm.com
Cc: meta-arm@lists.yoctoproject.org, Ross.Burton@arm.com, nd@arm.com
Subject: Re: [PATCH 2/4] arm-bsp/linux: corstone1000: update the defconfig
Message-ID: <ZS6SHY50wqy5khkb@kudzu.us>
References: <20231017075748.40743-1-harsimransingh.tungal@arm.com>
 <20231017075748.40743-3-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017075748.40743-3-harsimransingh.tungal@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Oct 2023 13:54:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5133

On Tue, Oct 17, 2023 at 08:57:46AM +0100, harsimransingh.tungal@arm.com wrote:
> From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
> 
> the configuration options corresponding to external system are removed
> from the kernel and the defconfig is generated with with savedefconfig
> bitbake task

This patch and the ones after it lack the Signed-Off-By line for each
commit.  I'll add it (and run throught CI), but please look out for
this in the future.

Thanks,
Jon

> ---
>  .../linux/files/corstone1000/defconfig        | 21 ++++++-------------
>  1 file changed, 6 insertions(+), 15 deletions(-)
> 
> diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
> index f6e6409c..8abcaed4 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
> +++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
> @@ -8,15 +8,9 @@ CONFIG_RELAY=y
>  CONFIG_BOOT_CONFIG=y
>  CONFIG_ARCH_VEXPRESS=y
>  CONFIG_CMDLINE="console=ttyAMA0 loglevel=9"
> -CONFIG_EFI=y
>  # CONFIG_SUSPEND is not set
> -CONFIG_EFI_BOOTLOADER_CONTROL=y
> -CONFIG_EFI_CAPSULE_LOADER=y
> -CONFIG_EFI_TEST=y
> -CONFIG_RESET_ATTACK_MITIGATION=y
>  # CONFIG_STACKPROTECTOR is not set
>  CONFIG_MODULES=y
> -# CONFIG_BLK_DEV_BSG is not set
>  # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
>  CONFIG_NET=y
>  CONFIG_PACKET=y
> @@ -28,8 +22,13 @@ CONFIG_IP_PNP_BOOTP=y
>  CONFIG_SYN_COOKIES=y
>  CONFIG_NET_SCHED=y
>  CONFIG_DEVTMPFS=y
> +CONFIG_EFI_BOOTLOADER_CONTROL=y
> +CONFIG_EFI_CAPSULE_LOADER=y
> +CONFIG_EFI_TEST=y
> +CONFIG_RESET_ATTACK_MITIGATION=y
>  CONFIG_SCSI=y
>  CONFIG_BLK_DEV_SD=y
> +# CONFIG_BLK_DEV_BSG is not set
>  CONFIG_NETDEVICES=y
>  # CONFIG_NET_VENDOR_ALACRITECH is not set
>  # CONFIG_NET_VENDOR_AMAZON is not set
> @@ -49,9 +48,9 @@ CONFIG_NETDEVICES=y
>  # CONFIG_NET_VENDOR_MICREL is not set
>  # CONFIG_NET_VENDOR_MICROCHIP is not set
>  # CONFIG_NET_VENDOR_MICROSEMI is not set
> +# CONFIG_NET_VENDOR_NI is not set
>  # CONFIG_NET_VENDOR_NATSEMI is not set
>  # CONFIG_NET_VENDOR_NETRONOME is not set
> -# CONFIG_NET_VENDOR_NI is not set
>  # CONFIG_NET_VENDOR_PENSANDO is not set
>  # CONFIG_NET_VENDOR_QUALCOMM is not set
>  # CONFIG_NET_VENDOR_RENESAS is not set
> @@ -90,11 +89,3 @@ CONFIG_LIBCRC32C=y
>  # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
>  CONFIG_DEBUG_FS=y
>  CONFIG_PANIC_TIMEOUT=5
> -CONFIG_STACKTRACE=y
> -CONFIG_EXTSYS_CTRL=y
> -CONFIG_MAILBOX=y
> -CONFIG_ARM_MHU_V2=y
> -CONFIG_RPMSG=y
> -CONFIG_RPMSG_CHAR=y
> -CONFIG_RPMSG_ARM=y
> -CONFIG_RPMSG_CTRL=y
> -- 
> 2.25.1
> 
> 

