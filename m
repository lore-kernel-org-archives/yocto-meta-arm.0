Return-Path: <jerome.forissier@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C7D9C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 13:26:40 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.7163.1665494798543950468
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 06:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=zkFOKIsy;
 spf=pass (domain: linaro.org, ip: 209.85.221.45,
 mailfrom: jerome.forissier@linaro.org)
Received: by mail-wr1-f45.google.com with SMTP id bp11so8864013wrb.9
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 06:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qp+7+R+IKB0cpCjw6gUxLNaMHnN1UmqixeL0Ti4WXLM=;
        b=zkFOKIsy5RhQGzyvrkEQkNXUR4JHMkum1OYiYumRzmKzk/quJSQKHP1KrnNtKHbwZP
         3IOuGYMfs02GIPhQq7lFD4pxFfAZxK4KBx/R91dvU9qqQRW64XVmxDK8IruErWziW5KP
         bVsL8QuCIWeGj3bmDyDNU3XLzHGF+9j+zBZjkeGYR43J4f16VH3KCSPYhsZsxUFMpt1B
         PPIfAdvpjyubfexdDpiU7BqSDdwPnGA+8rWQd8QP8ucr68D0oH/T35LK8fVs/X/DRDJj
         FexBXi3xszUWkQPZk250sbuLBitOYnedsu+PGZXdXsuc60c/TTezPUtcCCuhUnBIsLcQ
         xa2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qp+7+R+IKB0cpCjw6gUxLNaMHnN1UmqixeL0Ti4WXLM=;
        b=pnT1yGJe2u2x0mdescqfvzPOQXAHRwVbk7wakz8OtEy7Y6otR+9UnO/s2o55osqeJv
         BBKhNWz9fKPD28+dOxYlzaMViuoTP/VhMDlWcPR0oZHO0SZXHAxhPChQyURmDRCmYbm5
         Cnv4g0yDGAXkn/fwHCHM4M42BclCZr3UF3wUEe43yV3TPglCoMLS3gRR9O+gaKSYZM6s
         FtzzUH1CpefahmdRI/PjSXAzB86TU35RCo6uV/NmBc8mZa2TgkpNAK/dZuqCjdWPTp44
         HIN7jXpYe8WYfpR/J1n9apfUM0YfvkkLMBGNagLJUE0Jx3UPfm9ZSmRFwp3zcrE02mqM
         H+hg==
X-Gm-Message-State: ACrzQf2jqIsB8LT0guRNLCqPJbAQu1UqrvaDgBd7LgcVVOZJvOkO2BSQ
	FtdZNSqcwk7v3LQMRy/tlMNGug==
X-Google-Smtp-Source: 
 AMsMyM7u6p9mA85jVlPMatyiWYGDWdGp0HQd+99+FHn9hFl3ccvempQ7GtCvP1/8U7SxiFbwHdFIZA==
X-Received: by 2002:a05:6000:912:b0:230:9113:1a09 with SMTP id
 bz18-20020a056000091200b0023091131a09mr6488000wrb.707.1665494796922;
        Tue, 11 Oct 2022 06:26:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:81d:2f40:4c48:85c9:2b91:a85e?
 ([2a01:e0a:81d:2f40:4c48:85c9:2b91:a85e])
        by smtp.gmail.com with ESMTPSA id
 p2-20020adfce02000000b0022a3a887ceasm11324301wrn.49.2022.10.11.06.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 06:26:36 -0700 (PDT)
Message-ID: <e38df151-ce95-aee9-e929-c10f6403bd15@linaro.org>
Date: Tue, 11 Oct 2022 15:26:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [meta-arm] [PATCH] CI: restrict compression threading
To: Ross Burton <ross.burton@arm.com>, meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
References: <20221011130710.1638676-1-ross.burton@arm.com>
Content-Language: en-US
From: Jerome Forissier <jerome.forissier@linaro.org>
In-Reply-To: <20221011130710.1638676-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Oct 2022 13:26:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3949



On 10/11/22 15:07, Ross Burton wrote:
> On large systems, using all of the CPUs and 50% of the RAM when xz
> compressing packages is actively harmful because it will happily use up
> to that limit.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ci/base.yml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/ci/base.yml b/ci/base.yml
> index 3f644c1e..3619b8f2 100644
> --- a/ci/base.yml
> +++ b/ci/base.yml
> @@ -30,6 +30,9 @@ local_conf_header:
>      CONF_VERSION = "2"
>      BB_NUMBER_THREADS = "16"
>      PARALLEL_MAKE = "-j16"

That is arguably wrong already, because it restricts performance on >16 core
systems. I for example routinely build on a 32-core Aarch64 and 36-core
x86_64 machines. Yocto builds are painful enough that I don't want to spend
more time than necessary due to wrong settings ;-)

> +    XZ_MEMLIMIT = "25%"
> +    XZ_THREADS = "16"
> +    ZSTD_THREADS = "16"

Another hard-coded limit which can't be optimal on all systems obviously.
I am talking about the thread limits -- the memory limit is relative so it's
probably reasonable.
What's the problem with the default? You said "actively harmful", what
does it mean? Performance drop? By how much? What happens if you introduce
only the XZ_MEMLIMIT?

Thanks,

-- 
Jerome

>      LICENSE_FLAGS_ACCEPTED += "Arm-FVP-EULA"
>    setup: |
>      PACKAGE_CLASSES = "package_ipk"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3948): https://lists.yoctoproject.org/g/meta-arm/message/3948
> Mute This Topic: https://lists.yoctoproject.org/mt/94257870/7094589
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jerome.forissier@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

