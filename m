Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC6C4C32771
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 19:47:40 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web08.2255.1664394455790325195
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 12:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=XF4ERlwb;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id c11so8615794qtw.8
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 12:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=6q6ADP/WJyzjPWSjYtw6oxb/zhHqD2NrHNRGIYjzIaY=;
        b=XF4ERlwbfuCXksx7eBLeBhUrDRUdQNDYc4lKY2cxkQuyxTlkbFXNI7liO/y2XTYzHD
         ac0ZE+CebBHTperY+OEyVH32ETIPIATbBVeX38SMWcbwf68qJ4phrE37ep+wzPKVVppG
         Kryn8nNXbxmlzvqS4kZA3+KGuCD4J/0lWHsVv9AyafYFf4aYfrTM2F0ezSeQr3X87ypY
         ER8IDWt+w7SezhxBb++0rCDMzy84AS4v3efI7CaMFU3Oo80b3jreWgZc4Non2VsXnlHJ
         TGozzlr8sgytaoNDGUjOnxQMrkvpA5VxYyvj+zDxT5N5hutNoYNzwiiFeflp+UmhxgOa
         /0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=6q6ADP/WJyzjPWSjYtw6oxb/zhHqD2NrHNRGIYjzIaY=;
        b=qAUayCjv9cJ9Tgw0jm/OAdcLU+/vOKtjcDZ3K3haIo7clea6FK/4i1kpKt/wbycb0a
         X/2MpdE1DOTm7DqsTDBfgt/vcZwlof1XXEvdMo1vrrdZ51Ub1VRcZaEhQ6A2+orPVCnI
         y+w/TdtMDXbf0SJ/GmW9EpZZOKE3phE37Tzib8fuykepfZosAnrSs9QDRy3nOK18+jds
         nDqteZ4O/aKzEfzEydryg15i9VlXCdDdy46GxXj3BgZboIph8nfuQ1zzCoZn079CanCz
         epy9Cp4hD0KnbQ6rnCi6PE/9N3Jx2FpPBvhAxaFZVYYlOK/YHitSc20vYpR+yVzB17cq
         +n1Q==
X-Gm-Message-State: ACrzQf2fvsnRcvGZyppsD5MyQuSkUB0YRg4x9Md84fzuBhA2t8HA/+lb
	aZuO8LjW0d0Mb0QA62Y5Tz5XXg==
X-Google-Smtp-Source: 
 AMsMyM6S7GSQsG4RfL0klS/34lXaF01AZmhIR5fjpJQ0lC2zMsJ4HwuLmJZFAHK4pSpuWd3ghGslog==
X-Received: by 2002:a05:622a:296:b0:35d:52ee:2af3 with SMTP id
 z22-20020a05622a029600b0035d52ee2af3mr6265425qtw.72.1664394454740;
        Wed, 28 Sep 2022 12:47:34 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 i25-20020ac860d9000000b0035d08c1da35sm3717722qtm.45.2022.09.28.12.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 12:47:34 -0700 (PDT)
Date: Wed, 28 Sep 2022 15:47:32 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Davidson K <davidson.kumaresan@arm.com>, g@kudzu.us
Cc: meta-arm@lists.yoctoproject.org, Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/7] arm-bsp/tc: remove hafnium clang patch
Message-ID: <YzSk1FMklaRmmiZh@kudzu.us>
References: <20220928145036.47650-1-davidson.kumaresan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928145036.47650-1-davidson.kumaresan@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 28 Sep 2022 19:47:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3865

Did you intend to send this out?
Also, it says there are 7 patches but I only received 2.

Thanks,
Jon

On Wed, Sep 28, 2022 at 08:20:30PM +0530, Davidson K wrote:
> From: Jon Mason <jon.mason@arm.com>
> 
> The newly added clang patch does not apply cleanly to the tc version of
> hafnium.  Since there are no plans to use clang on tc, remove it for
> this platform.
> 
> Also, use devtool to clean-up the clang patch in question.
> 
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  .../recipes-bsp/hafnium/hafnium-tc.inc        |  2 ++
>  .../0001-Fix-build-with-clang-15.patch        | 32 ++++++++++++++-----
>  2 files changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
> index 4545c829..75707e1d 100644
> --- a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
> +++ b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
> @@ -9,6 +9,8 @@ PV = "2.7+git${SRCPV}"
>  
>  FILESEXTRAPATHS:prepend:tc := "${THISDIR}/files/tc:"
>  
> +SRC_URI:remove = "file://0001-Fix-build-with-clang-15.patch"
> +
>  SRC_URI:append = " \
>          file://0001-feat-emulate-cntp-timer-register-accesses-using-cnth.patch \
>          file://0002-feat-emulate-interrupt-controller-register-access.patch \
> diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/0001-Fix-build-with-clang-15.patch b/meta-arm/recipes-bsp/hafnium/hafnium/0001-Fix-build-with-clang-15.patch
> index c376a9c6..f037d2b5 100644
> --- a/meta-arm/recipes-bsp/hafnium/hafnium/0001-Fix-build-with-clang-15.patch
> +++ b/meta-arm/recipes-bsp/hafnium/hafnium/0001-Fix-build-with-clang-15.patch
> @@ -1,4 +1,4 @@
> -From 1a84b72df8e749665733c3489f605264ccc63d73 Mon Sep 17 00:00:00 2001
> +From d96f696244e0869654004f49586b53811037db30 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Thu, 22 Sep 2022 19:13:49 -0700
>  Subject: [PATCH] Fix build with clang-15
> @@ -8,15 +8,19 @@ Remove unused variable suites_in_image
>  
>  Upstream-Status: Pending
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
>  ---
> - test/hftest/common.c                                    | 2 --
> - test/vmapi/arch/aarch64/gicv3/gicv3.c                   | 2 +-
> - test/vmapi/arch/aarch64/gicv3/inc/gicv3.h               | 2 +-
> - test/vmapi/arch/aarch64/gicv3/timer_secondary.c         | 2 +-
> - test/vmapi/el0_partitions/services/interruptible.c      | 2 +-
> - test/vmapi/el0_partitions/services/interruptible_echo.c | 2 +-
> - 6 files changed, 5 insertions(+), 7 deletions(-)
> + test/hftest/common.c                                         | 2 --
> + test/vmapi/arch/aarch64/gicv3/gicv3.c                        | 2 +-
> + test/vmapi/arch/aarch64/gicv3/inc/gicv3.h                    | 2 +-
> + test/vmapi/arch/aarch64/gicv3/timer_secondary.c              | 2 +-
> + test/vmapi/el0_partitions/services/interruptible.c           | 2 +-
> + test/vmapi/el0_partitions/services/interruptible_echo.c      | 2 +-
> + test/vmapi/primary_with_secondaries/services/interruptible.c | 2 +-
> + 7 files changed, 6 insertions(+), 8 deletions(-)
>  
> +diff --git a/test/hftest/common.c b/test/hftest/common.c
> +index 344ff24..175230a 100644
>  --- a/test/hftest/common.c
>  +++ b/test/hftest/common.c
>  @@ -67,7 +67,6 @@ void hftest_json(void)
> @@ -35,6 +39,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   			suite = test->suite;
>   			tests_in_suite = 0;
>   			HFTEST_LOG("    {");
> +diff --git a/test/vmapi/arch/aarch64/gicv3/gicv3.c b/test/vmapi/arch/aarch64/gicv3/gicv3.c
> +index 682bc4e..82582f0 100644
>  --- a/test/vmapi/arch/aarch64/gicv3/gicv3.c
>  +++ b/test/vmapi/arch/aarch64/gicv3/gicv3.c
>  @@ -42,7 +42,7 @@ static void irq(void)
> @@ -46,6 +52,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   {
>   	const uint32_t mode = MM_MODE_R | MM_MODE_W | MM_MODE_D;
>   	hftest_mm_identity_map((void *)GICD_BASE, PAGE_SIZE, mode);
> +diff --git a/test/vmapi/arch/aarch64/gicv3/inc/gicv3.h b/test/vmapi/arch/aarch64/gicv3/inc/gicv3.h
> +index 5faf3a8..f681e58 100644
>  --- a/test/vmapi/arch/aarch64/gicv3/inc/gicv3.h
>  +++ b/test/vmapi/arch/aarch64/gicv3/inc/gicv3.h
>  @@ -30,4 +30,4 @@ extern void *recv_buffer;
> @@ -54,6 +62,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
>  -void system_setup();
>  +void system_setup(void);
> +diff --git a/test/vmapi/arch/aarch64/gicv3/timer_secondary.c b/test/vmapi/arch/aarch64/gicv3/timer_secondary.c
> +index ebc4db3..8260e10 100644
>  --- a/test/vmapi/arch/aarch64/gicv3/timer_secondary.c
>  +++ b/test/vmapi/arch/aarch64/gicv3/timer_secondary.c
>  @@ -55,7 +55,7 @@ TEAR_DOWN(timer_secondary_ffa)
> @@ -65,6 +75,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   {
>   	const char message[] = "loop 0099999";
>   	const char expected_response[] = "Got IRQ 03.";
> +diff --git a/test/vmapi/el0_partitions/services/interruptible.c b/test/vmapi/el0_partitions/services/interruptible.c
> +index 0d00b16..3c3250d 100644
>  --- a/test/vmapi/el0_partitions/services/interruptible.c
>  +++ b/test/vmapi/el0_partitions/services/interruptible.c
>  @@ -43,7 +43,7 @@ static void irq(void)
> @@ -76,6 +88,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   {
>   	struct ffa_value received;
>   
> +diff --git a/test/vmapi/el0_partitions/services/interruptible_echo.c b/test/vmapi/el0_partitions/services/interruptible_echo.c
> +index b618cf2..636ebc9 100644
>  --- a/test/vmapi/el0_partitions/services/interruptible_echo.c
>  +++ b/test/vmapi/el0_partitions/services/interruptible_echo.c
>  @@ -32,7 +32,7 @@ static void irq(void)
> @@ -87,6 +101,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   {
>   	struct ffa_value received;
>   
> +diff --git a/test/vmapi/primary_with_secondaries/services/interruptible.c b/test/vmapi/primary_with_secondaries/services/interruptible.c
> +index cc1c1f9..c94093b 100644
>  --- a/test/vmapi/primary_with_secondaries/services/interruptible.c
>  +++ b/test/vmapi/primary_with_secondaries/services/interruptible.c
>  @@ -40,7 +40,7 @@ static void irq(void)
> -- 
> 2.34.1
> 
> 

