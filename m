Return-Path: <jerome.forissier@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DFCC19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 15:54:38 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.13670.1660060475851921372
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 08:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=son/91yH;
 spf=pass (domain: linaro.org, ip: 209.85.208.50,
 mailfrom: jerome.forissier@linaro.org)
Received: by mail-ed1-f50.google.com with SMTP id z2so15716689edc.1
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 08:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=1u8o0cduaqWx/Hlrp6OPQkRF5Na5sJRfBzMyJwdRL80=;
        b=son/91yHS64Zso0pw9gYmQsxLSP4JI4XTGLeyQix7hUaqQiZj2nZbSRkLcdmfQwoIg
         yJdJbbb128W4ntLeTYSqDNIZZQXHsj0WeXak5w8L1pPxPZylJ1oHnABdY/2J+/gAvoA3
         NphU95iL3i8I3aDp4dCnL1mI44m/Etjgm5PPAlQUwr0yMRG7RDdZPCNM14YW0Ksw0tKa
         lUDbJvS6utNw72D8cpPepQW9ibN7y1raC7xgvUAo9mau+9SOjZ9mRbOCpbGq7fdBtFnG
         t5l7AOPlBDAzSp0RiczpfW7oMI3imVjDzTvaONPj7O2hBBv6fKRBwW418SIXR49m0I1U
         ck0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=1u8o0cduaqWx/Hlrp6OPQkRF5Na5sJRfBzMyJwdRL80=;
        b=HPgkWxTMUJ2A+tpvpqwodcCJzFcARhlYeKMMFTDuVc3RqtafYdI6zvGy/me0Z1PDrG
         xwYS1bEHvbavoNokz1KNq86Hje3nUeyZChPqc6MpGcWeCU/iE/3aEISoGeRFTKP9H7wg
         bMCN8N7jbfWA7u3gE8fEw9W0q47YO9A+GsaFXIZa1SGlEzIjbofqOIeynDrylpRTYCt9
         CLpld+XcpA5MaJzFO1C07skXCFwj41f3zd5PNFrRUDnN4oJh+4xIrlXZtTJoJrYglT8k
         VM1vLCT8UK56xFomf/RygV5x4+MnbXFPqgZWpMEvtmX7gu27QeraGmgPatPG2yGuMjtE
         PkiQ==
X-Gm-Message-State: ACgBeo38fZsGhuhAopDUaAywpKch1TdnmrVxFXGKMlb6+khoJw9Zri97
	ScXUoUUTU3AaAlwDOf8Mkt4yc1IHEBeM1DAd
X-Google-Smtp-Source: 
 AA6agR4lR7ECAT7KZL2eHOr/ZjcWZ8yTH+99bNcsVNnvSjdtl7/tU5t15LgVTAkBP9oRuXnwIhe/rA==
X-Received: by 2002:a05:6402:270d:b0:43a:67b9:6eea with SMTP id
 y13-20020a056402270d00b0043a67b96eeamr22363085edd.94.1660060473570;
        Tue, 09 Aug 2022 08:54:33 -0700 (PDT)
Received: from [10.7.3.4] ([82.180.148.108])
        by smtp.gmail.com with ESMTPSA id
 z4-20020aa7cf84000000b0043d5ead65a6sm6153772edx.84.2022.08.09.08.54.32
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Aug 2022 08:54:33 -0700 (PDT)
Message-ID: <f0b7dcfe-3dfe-366d-a938-b33cc866609a@linaro.org>
Date: Tue, 9 Aug 2022 17:54:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-arm] [PATCH] optee: use CFLAGS{32,64} to pass --sysroot
Content-Language: en-US
To: meta-arm@lists.yoctoproject.org
References: <1709B7B7818BCB78.24612@lists.yoctoproject.org>
From: Jerome Forissier <jerome.forissier@linaro.org>
In-Reply-To: <1709B7B7818BCB78.24612@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Aug 2022 15:54:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3669

On 8/9/22 17:42, Jerome Forissier via lists.yoctoproject.org wrote:
> Since upstream OP-TEE 3.16.0, CFLAGS32 and CFLAGS64 can be used to set
> the sysroot option that previously required the LIBGCC_LOCATE_CFLAGS
> patches.
> 
> Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
> ---
>  meta-arm/recipes-security/optee/optee-os_3.14.0.bb | 2 ++
>  meta-arm/recipes-security/optee/optee-os_3.16.0.bb | 5 -----
>  meta-arm/recipes-security/optee/optee.inc          | 3 ++-
>  3 files changed, 4 insertions(+), 6 deletions(-)

Forgot to mention: this targets the kirkstone branch. Sorry about that.

-- 
Jerome

