Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA4DC433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 16:07:44 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web09.9398.1652803656517068905
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 May 2022 09:07:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HxqcCXtq;
 spf=pass (domain: linaro.org, ip: 209.85.210.177,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-pf1-f177.google.com with SMTP id c14so17302970pfn.2
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 May 2022 09:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Adxcxn46zgZlOZzVZ6yZz3ymcwbmXZyBS545Omny5RU=;
        b=HxqcCXtqSoXLSkT1F9jxDr3SFN6VfD27ojm79wK7bxUQbCvlks6O6AFntddoE00GZT
         JLO5tfdwC84kx22DOs2tFZbfD2MwV9iHtCb1QyW3WXccOklOUDI2cQy4qf3f8GbgLPj9
         PC8pw2r80YP9P7KMeKIY7coTR8J2JsUg1G34sDk6+R48izpo76PwPko0n2J1xyYlE9E9
         d0yMvK7rOy0BLOaLYCIeob0e2BR3RwOvBMuDUrr8wM8mTfDOnpRpcZcV2Utg3vkMSAuM
         JB/lC40MVs7BQYCsN7YakC5h8Ehlw9Fcs0THHmLbzL4K9JR2VlM1G9NPpe+yI2YCLoth
         e1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Adxcxn46zgZlOZzVZ6yZz3ymcwbmXZyBS545Omny5RU=;
        b=lOlWuvFnweR7rKHYv6nhB2S2IDb7C9r/mTysFqgn3uDGl0dfShCv+zXDa9CUkSz61i
         /SFeAacZfoOtq++29hgg4Um0Rld5gW48NA4pc92jJfDKx9k/pYqI3hSrBFVCA4s1a91H
         rGiCC2mZ1sMe4q3SilJdXhbdUliC0UnIiPl048yw57PxJKeulimzcxV9oFnWeKHtpjoL
         WT4vBBfkvv31NgQhsmnQ8AYenNMycI5VWWml0MGG5rPvtYbR2KX4rUUHTGlEJnod5qik
         HzX1JKutuPX9ZzF1sOzALH/GwwfuW9eT30B/kyrS5tbIIVD8+HzLfmJQEjib8OEMICzp
         mi5g==
X-Gm-Message-State: AOAM533cozPk/iqWlUkcnrApDu1HxEhyzzEiabNUFz8gqK+s5iujBQBl
	I3VVu+Dhn2nn0zO/asJ/0TvWhUZdU3WX/QTgtaQECQ==
X-Google-Smtp-Source: 
 ABdhPJzzYy5fbj3ruuTPDqrGAZxNmm1x45tS2wNGbm5OkpdqFcdpYKdYH+JQsMid1mbF1kU+V2bWp7SIr8UUcvfe1tc=
X-Received: by 2002:a63:2a4f:0:b0:3c1:bf77:b81f with SMTP id
 q76-20020a632a4f000000b003c1bf77b81fmr19848542pgq.364.1652803655938; Tue, 17
 May 2022 09:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220517122818.3324458-1-ross.burton@arm.com>
 <165280103077.3622764.12744147075443410723.b4-ty@arm.com>
In-Reply-To: <165280103077.3622764.12744147075443410723.b4-ty@arm.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 17 May 2022 21:37:25 +0530
Message-ID: 
 <CAFA6WYOmbkbs4SUzKSMAtONPXxnKmPuP9KdrhomedkWRaoXZug@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/3] arm-toolchain/external-arm-toolchain: set
 the version in the recipe
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, Ross Burton <ross.burton@arm.com>,
 nd@arm.com,
	Denys Dmytriyenko <denis@denix.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 May 2022 16:07:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3423

+ Denys

Hi Jon,

On Tue, 17 May 2022 at 20:54, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Tue, 17 May 2022 13:28:16 +0100, Ross Burton wrote:
> > We need to support multiple versions of external-arm-toolchain, partly as
> > different versions have different layouts on disk, and partly because
> > 11.2 doesn't work on pre-Broadwell hardware.
> >
> > Rename this recipe so the version is in the filename, and dynamically
> > set PKGV instead of PV so PREFERRED_VERSION is easier to use.
>
> Applied, thanks!
>
> [1/3] arm-toolchain/external-arm-toolchain: set the version in the recipe
>       commit: ac83feb7cd16265d4e8ee0ed50dba903306867e5
> [2/3] arm-toolchain/external-arm-toolchain: add back 10.3
>       commit: 5fec85b41d7263dcc8aa15351beb7c19e2017849

Can you please revert these two patches? We don't need duplicates for
external-arm-toolchain recipe. The latest version supports both 11.2
and 10.3. So the only thing that's required is patch #3.

-Sumit

> [3/3] CI: use external-arm-toolchain 10.3
>       commit: 4c6ccb833c1ac379df3efa02136e03067d89ef3e
>
> Best regards,
> --
> Jon Mason <jon.mason@arm.com>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3420): https://lists.yoctoproject.org/g/meta-arm/message/3420
> Mute This Topic: https://lists.yoctoproject.org/mt/91162100/1777089
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>

