Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A85C0C10F15
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 08:03:10 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web10.13229.1713772981451237509
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Apr 2024 01:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=B2TfnYm2;
 spf=pass (domain: linaro.org, ip: 209.85.222.51, mailfrom: sumit.garg@linaro.org)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-7eb7bfbc712so817207241.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 22 Apr 2024 01:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713772980; x=1714377780; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=05fDKgetoKQyjjdvpDCOwyvkdSUNKjsKVLiVkPDq8ok=;
        b=B2TfnYm2ciIK1slrT3L7s+XrVKFDA3vOyjqXg7mD0PZ4yUuzFT6dJR8NmT6iAxwwft
         kA2W6IGs1tSZzdzIjlCnHdmFUccbc9VsMsg8cxcZfKM3yoe1Vqn0oyJx0S1rA6GGvowz
         vLIMIz/0l1ObikwU6DOdDkOlWfRn0RfQsAzrWDsdkdcgk334gh54ilGyjHwp/xBAqsjf
         ynXzvaW6Zye3+Y4rx/ZNMaCRBaeQIhiXfNv6N1KivNKt/0b2eFCGqJfEVkwMNN1Ws4Vu
         K/Ru7YImV4pvUV7e+ZP/Uaq+EH+a+mPQ6ucBs5CjpMMj91Qm8FbIZE+csHihq59oSDad
         Aryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713772980; x=1714377780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=05fDKgetoKQyjjdvpDCOwyvkdSUNKjsKVLiVkPDq8ok=;
        b=pHtHBnWvUCro7A9OxyCxRMvaEt9mVNvJdCs6VeV5WJSIbLjvAw2UqsHbK/2eoHnVV7
         A2QZhxF+BBqrJlkLuNFNW2OtI/s0D9oNRWl7wap142IKUzr7Vcqt+suMASkLabZoBsUe
         0wRDeA0O6sIrZl42dR38maPMBSqLWTqgxD0lZgSw1jAPYbI+BhLAYwrZcDqRdM+youA0
         Req//F1vH+wvvds4rD3alLZauDimMVjDI+bqeWBQTa4YNjg/ywcMH4NpCVQ1xd8RE7l6
         PAoUfTJal4YIyPmw8iKYs72iQV5oUqSVSRaUR3OQKoF8dNyxFfGuNsaGwt/V0qdNTBWA
         DTVg==
X-Gm-Message-State: AOJu0YwHwbpo9jK0KsmWV2et5io2DB/SX7rKNdcjGo7/dHZN5EVZvbm9
	lcM4VLoEc9XCyEZK76sRCi5evQ9rQl7cUXfrucH1xFiydTWOYfXkr6L0dyuVsg+CY+/4IidDtN3
	9TtbWrxJg27dyEcGDqCi8tGBOQUH/bRrj/FMhhg==
X-Google-Smtp-Source: AGHT+IErqoXVoe8eHGH1M+7kRNqHRdMt7DETcKmLs6JzewcMmP1GZ9khySrFAoLBYeobGqs8jbjO9x8cAy/IaRSt8ss=
X-Received: by 2002:a67:e354:0:b0:47a:516d:61aa with SMTP id
 s20-20020a67e354000000b0047a516d61aamr10497752vsm.19.1713772980302; Mon, 22
 Apr 2024 01:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240417110722.283283-1-mikko.rapeli@linaro.org> <20240417110722.283283-2-mikko.rapeli@linaro.org>
In-Reply-To: <20240417110722.283283-2-mikko.rapeli@linaro.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 22 Apr 2024 01:02:49 -0700
Message-ID: <CAFA6WYMk9vA429qR4jQ=TW5Odj9T3mnFQF_yzVCTdYhPKCX04g@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 2/2] optee-ftpm: enumerate also without tee-supplicant
To: mikko.rapeli@linaro.org
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 22 Apr 2024 08:03:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5575

Hi Mikko,

On Wed, 17 Apr 2024 at 04:08, Mikko Rapeli via lists.yoctoproject.org
<mikko.rapeli=linaro.org@lists.yoctoproject.org> wrote:
>
> Userspace like systemd boot manager would need to know
> how to find TPM and fTPM devices for rootfs encryption.
> Thus expose an fTPM TA enumeration also without tee-supplicant

fTPM TA due to secure storage requirements needs a tee-supplicant to
be up and running for a successful kernel driver probe. So CI failure
is expected as you see in the other thread.

So it's a chicken and egg situation for your rootfs encryption
use-case. I suppose once the RPMB subsystem [1] makes its way into the
mainline kernel then the dependency on tee-supplicant can be dropped.

[1] https://lists.trustedfirmware.org/archives/list/op-tee@lists.trustedfirmware.org/thread/6A62HMDQST2O3T2UGGN6UPXZKLKLUNM4/

-Sumit

> so that early boot managers can start tee-supplicant and
> wait for the fTPM device before continuing with TPM2
> use cases.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  .../optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch
> index 7c61105b..175875c1 100644
> --- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch
> +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch
> @@ -21,7 +21,7 @@ index 92c33c1..e83619d 100644
>   #define TA_UUID                     TA_FTPM_UUID
>
>  -#define TA_FLAGS                    (TA_FLAG_SINGLE_INSTANCE | TA_FLAG_INSTANCE_KEEP_ALIVE)
> -+#define TA_FLAGS                    (TA_FLAG_SINGLE_INSTANCE | TA_FLAG_INSTANCE_KEEP_ALIVE | TA_FLAG_DEVICE_ENUM_SUPP)
> ++#define TA_FLAGS                    (TA_FLAG_SINGLE_INSTANCE | TA_FLAG_INSTANCE_KEEP_ALIVE | TA_FLAG_DEVICE_ENUM )
>   #define TA_STACK_SIZE               (64 * 1024)
>   #define TA_DATA_SIZE                (32 * 1024)
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#5555): https://lists.yoctoproject.org/g/meta-arm/message/5555
> Mute This Topic: https://lists.yoctoproject.org/mt/105574761/1777089
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>

