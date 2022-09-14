Return-Path: <jerome.forissier@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE47EECAAD8
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 09:00:22 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.4033.1663146010700481501
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Sep 2022 02:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uMzRr9tk;
 spf=pass (domain: linaro.org, ip: 209.85.208.53,
 mailfrom: jerome.forissier@linaro.org)
Received: by mail-ed1-f53.google.com with SMTP id b35so21252476edf.0
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Sep 2022 02:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=dt2EZuA4Pd/p7JB7UX/UONy+fA0b0/KnSEbdMrR40fc=;
        b=uMzRr9tkShl1m8MvN5U1OFwyoX2rimYw5KfcxA27lTptBtwUFHRRvfqP6p/wmyMr2t
         0QePOrehOGqXF/Tc2HHkmO17zA4wyvVarrEAvaINcDK7IqtMo54J8l2dcmrCCugEgH78
         ToC5naLt3d62uuUKBOm4zuMijprGP/4C2b8bhSfzMN+R7+/pQBVLlwtdlgsiL/0tjsXC
         fqmkIYhdUcQtijIXfHLckfnv4E8RAyMy6k9zJakP+qOMSC9UeqV4PVKXCRgABxqkVGZl
         5WuHJEkGLEqTc9wFyZYmEANdlCFfT6KCd7GTMCXhME88GX5FHJ2P0TtBzEnGT0Q3FUvi
         a/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=dt2EZuA4Pd/p7JB7UX/UONy+fA0b0/KnSEbdMrR40fc=;
        b=UWWukNwd0YRiptVpbCjJzsDbqxRjVZYmJHII3THoEoLhswCV/zn9b7XV2UQ6K1o8fJ
         Cj3sh+bpjh+e8PpQLTVRXsquafq4FSoexJfulUq1XApmdFRqHab9XX4fUHI0hRP3+BpZ
         /j1XSY4Nf5yHwttR/+lsTQ2tEVQWtkPIjg1lWho5jLa+Pse2qvyKyO1Tvh0aPSzK9eaD
         6QemzUKWwtDelUbWk0FaUxGARHvtgXIejsNE4UURF3N+LBHHvzHZXQmc6m6dajt/JGfg
         Hcaq7AilzSPj8x53lz4OEcx8iV9Elzx8tfwEIcNJF6mVzRmEUgWyo9kHOEJoNr9hSJr7
         6M/g==
X-Gm-Message-State: ACgBeo0KxoE+WvU9TIFGc1L52IGixFVnNRIP+KpdbsaaUv+BvekXRXvo
	M7o+IRnYaNPcDQkGF0s9HhZJfg==
X-Google-Smtp-Source: 
 AA6agR5+yQk1ksg+5pjLyZBxj2Yv4ymogeHhh0zh2W6LAOU4A8E36K4HZC/tFUEtI8seRHO+dQLH9w==
X-Received: by 2002:a05:6402:2690:b0:452:3a85:8b28 with SMTP id
 w16-20020a056402269000b004523a858b28mr7611579edd.158.1663146008908;
        Wed, 14 Sep 2022 02:00:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3cb:7bb0:4a24:2150:28c2:77ff?
 ([2a01:e0a:3cb:7bb0:4a24:2150:28c2:77ff])
        by smtp.gmail.com with ESMTPSA id
 m17-20020a1709062b9100b0073c0b87ba34sm7359415ejg.198.2022.09.14.02.00.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 02:00:08 -0700 (PDT)
Message-ID: <a39cdd06-d005-53ec-be28-918df417fea1@linaro.org>
Date: Wed, 14 Sep 2022 11:00:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-arm] [PATCH] arm/optee-os: refresh patch to remove fuzz
Content-Language: en-US
To: Ross Burton <ross.burton@arm.com>, meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
References: <20220907104216.582351-1-ross.burton@arm.com>
From: Jerome Forissier <jerome.forissier@linaro.org>
In-Reply-To: <20220907104216.582351-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Sep 2022 09:00:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3776



On 9/7/22 12:42, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../0010-add-note-GNU-stack-section.patch     | 32 +++++++++----------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/meta-arm/recipes-security/optee/optee-os/3.18/0010-add-note-GNU-stack-section.patch b/meta-arm/recipes-security/optee/optee-os/3.18/0010-add-note-GNU-stack-section.patch
> index 95d5e676..fd5f08f2 100644
> --- a/meta-arm/recipes-security/optee/optee-os/3.18/0010-add-note-GNU-stack-section.patch
> +++ b/meta-arm/recipes-security/optee/optee-os/3.18/0010-add-note-GNU-stack-section.patch
> @@ -1,4 +1,4 @@
> -From 38bf606653ee08b10db6bb298e369cb3a9cdcda9 Mon Sep 17 00:00:00 2001
> +From 91bf1c53442e0151ecc8a4f87c4e16c89fb1fad6 Mon Sep 17 00:00:00 2001
>  From: Jerome Forissier <jerome.forissier@linaro.org>
>  Date: Tue, 23 Aug 2022 12:31:46 +0000
>  Subject: [PATCH] arm32: libutils, libutee, ta: add .note.GNU-stack section to
> @@ -36,12 +36,12 @@ Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/5499]
>   7 files changed, 14 insertions(+)
>  
>  diff --git a/lib/libutee/arch/arm/utee_syscalls_a32.S b/lib/libutee/arch/arm/utee_syscalls_a32.S
> -index 6e621ca6..af405f62 100644
> +index d416c270..99e518c2 100644
>  --- a/lib/libutee/arch/arm/utee_syscalls_a32.S
>  +++ b/lib/libutee/arch/arm/utee_syscalls_a32.S
> -@@ -7,6 +7,8 @@
> - #include <tee_syscall_numbers.h>
> - #include <asm.S>
> +@@ -13,6 +13,8 @@
> + #define UNWIND(...)
> + #endif

Is this intended?

-- 
Jerome

