Return-Path: <jerome.forissier@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759DFC43217
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 15:37:01 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.9099.1665502620612567675
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 08:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=RoHYscEX;
 spf=pass (domain: linaro.org, ip: 209.85.221.48,
 mailfrom: jerome.forissier@linaro.org)
Received: by mail-wr1-f48.google.com with SMTP id u10so22226805wrq.2
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 08:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=twc6Pqlyp3uEg3IrhWKN4ZlQHl6voHigNP4KD0PrSDM=;
        b=RoHYscEX68LtUUcmrrwIj7t/46axyWQ8AqOgvwW3dpyAxY18nuJ0Rd5pg9bsfFM4fi
         atON3+gRtniBNTDKFjz9htZuOIDIMcBI8ZZxAgW+ZwuV6dFqejtMOrjiZKlDK5sKClHW
         Gl/2SgzcLnmd1rYG7QcnwLUMdUWku1IdXmhworPsgA+PZJ1ljbYUe8SxTzxr1ux6ZLwC
         TlvcpELIlpyc7K1fLgxV0PCCZAKim3nhWev46h7DVIYtNX3apIkUGNlRHcOmFbIfCMac
         +ZVx+Jwo8JQGpz6+GD7Uhdiy+5SBgZNNePdpQRUQWK4fPvd1TH3yrzK3rlbfqhbcP3Tn
         S+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=twc6Pqlyp3uEg3IrhWKN4ZlQHl6voHigNP4KD0PrSDM=;
        b=g77+deiqAjqtMajb+Uj3r07MZdEtFkWWaLq7xxBrR+L4yV53hlhs+MlkkZMPqM8oek
         WsiVFbfW/TFEybrDh7ywmyV6u0qyHEX7sK1lvioL79+031jQlWTjA3jz2AnlYtz52/R6
         8gIpVY2eZy0ouoyvuj4sieu7/JUHBqMxyMDtamI3/DJcaxIXsNvb+yXwInmm7lS11mUx
         5dLvPGouRhrX1qMr4XANKxETjTxdZKxY3lO5DpVNYa5Z49g+WKHwkOcnb1Vk9PYR96BT
         c5LjRwQZNyRAL1i8kiiI8g5QvmGg24ivWdkLKj3+lEd7EhdiK6tVWBsERfc6Cdsm7E/G
         JPkQ==
X-Gm-Message-State: ACrzQf2UCFq1RjcwQ95CJd2CAgDI8ZdYW9NzlnNLmrRuDQr4JuOtil4G
	PYhI5LoShTWXig6GT6mF0wp2NA==
X-Google-Smtp-Source: 
 AMsMyM4XF92LfxEYCqTjXrJ+a5R+IBL597kSInrqttrHOyrtVRdzkjhXUk0MgVyGZP8edsoVQFJAQA==
X-Received: by 2002:a5d:46c6:0:b0:22e:4b9a:3f02 with SMTP id
 g6-20020a5d46c6000000b0022e4b9a3f02mr15710159wrs.516.1665502618949;
        Tue, 11 Oct 2022 08:36:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:81d:2f40:4c48:85c9:2b91:a85e?
 ([2a01:e0a:81d:2f40:4c48:85c9:2b91:a85e])
        by smtp.gmail.com with ESMTPSA id
 u16-20020adfdd50000000b002238ea5750csm14522929wrm.72.2022.10.11.08.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 08:36:58 -0700 (PDT)
Message-ID: <7a65a5c1-6732-fe98-86a3-df130c80fa88@linaro.org>
Date: Tue, 11 Oct 2022 17:36:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [meta-arm] [PATCH] CI: restrict compression threading
To: Jon Mason <jdmason@kudzu.us>
Cc: Ross Burton <ross.burton@arm.com>, meta-arm@lists.yoctoproject.org
References: <20221011130710.1638676-1-ross.burton@arm.com>
 <e38df151-ce95-aee9-e929-c10f6403bd15@linaro.org> <Y0WHKMltz+974fJV@kudzu.us>
Content-Language: en-US
From: Jerome Forissier <jerome.forissier@linaro.org>
In-Reply-To: <Y0WHKMltz+974fJV@kudzu.us>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Oct 2022 15:37:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3953



On 10/11/22 17:09, Jon Mason wrote:
> On Tue, Oct 11, 2022 at 03:26:36PM +0200, Jerome Forissier wrote:
>>
>>
>> On 10/11/22 15:07, Ross Burton wrote:
>>> On large systems, using all of the CPUs and 50% of the RAM when xz
>>> compressing packages is actively harmful because it will happily use up
>>> to that limit.
>>>
>>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>>> ---
>>>  ci/base.yml | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/ci/base.yml b/ci/base.yml
>>> index 3f644c1e..3619b8f2 100644
>>> --- a/ci/base.yml
>>> +++ b/ci/base.yml
>>> @@ -30,6 +30,9 @@ local_conf_header:
>>>      CONF_VERSION = "2"
>>>      BB_NUMBER_THREADS = "16"
>>>      PARALLEL_MAKE = "-j16"
>>
>> That is arguably wrong already, because it restricts performance on >16 core
>> systems. I for example routinely build on a 32-core Aarch64 and 36-core
>> x86_64 machines. Yocto builds are painful enough that I don't want to spend
>> more time than necessary due to wrong settings ;-)
> 
> Are you running Gitlab CI on meta-arm too?  I thought I was the only
> one running it outside of Arm internal.

No, not meta-arm directly, but some layer [1] which used meta-arm as a template
[2] and includes meta-arm as well as other things.

[1] https://gitlab.com/Linaro/trustedsubstrate/meta-ts
[2] https://gitlab.com/Linaro/trustedsubstrate/meta-ts/-/commit/52985d29fb0332d9479d838a86e098f54be1bef6

> 
> I dislike this for the same reasoning.  We're discussing making this a
> Gitlab CI variable, with a default that doesn't do the limiting.

Sounds like a good idea.
  
>>> +    XZ_MEMLIMIT = "25%"
>>> +    XZ_THREADS = "16"
>>> +    ZSTD_THREADS = "16"
>>
>> Another hard-coded limit which can't be optimal on all systems obviously.
>> I am talking about the thread limits -- the memory limit is relative so it's
>> probably reasonable.
>> What's the problem with the default? You said "actively harmful", what
>> does it mean? Performance drop? By how much? What happens if you introduce
>> only the XZ_MEMLIMIT?
> 
> This was using 256 cores on our internal build servers,

256 cores!? I'm jealous :) And don't tell how much RAM you have! :D
 
> which was
> slowing our CI pipelines significantly.  I'll investigate doing the
> gitlab ci variables sooner now.

Cool, thanks.

-- 
Jerome

