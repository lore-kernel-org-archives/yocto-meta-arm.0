Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F23C52D7C
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 01:43:08 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.4142.1724290984939690282
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Aug 2024 18:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QB6+j9qJ;
 spf=pass (domain: linaro.org, ip: 209.85.219.174, mailfrom: javier.tia@linaro.org)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e1674508eb9so388423276.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 21 Aug 2024 18:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724290984; x=1724895784; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7klmjXYch8GNaZN1wEzo461fb1uc8XjLt42gnCiFheA=;
        b=QB6+j9qJ+/5hVgL5dcEtbz6bpKLKltGVmvylslXEW7WDq8MvwAZdIuLxaU8cZj1OVP
         oY742XEnq0xQLjRu/ZK4HSFCgc+vZ8uwdVO9YraqurPUed8GSBMfHpHz9wLSLs9JnRaQ
         JEi/TnXxujpEsihM/OGfCjC+5+m6mBlFbmi34mLTK9r30r80OQEhsMGp1gYK2dcfMjN9
         kTlEuNAGlHeciIAyLP4mtIqZjO1MixwIBjGs1JLmzWhTGNs+vF7b3jecJv46Bq8shUcc
         tE+k3iKd/Lz9t5gAHOl6Gl7kqZkvnPMHJY0wcBsNqcrfbOzKq5EVEKBpfya0UKHnHvnu
         +LsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724290984; x=1724895784;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7klmjXYch8GNaZN1wEzo461fb1uc8XjLt42gnCiFheA=;
        b=dnjPseM7bsEy+LjGAb5QJfceY1Oqyb8bk9zv8NQ+OtAQeQmbEhqTL9WKASBfUSm6oW
         AA6AwtSnRct7SyXl/X7/cVrTrF+qXfjWXYH3wbped/VXMT9gjBJx/vr8dkPiDHWCO/Fj
         AJdiHvOiQUG5rKjqjSGOjjBIC4rqbOVPXICETTseLwEW5Nh1xF0cgoiDc2gpvyZ8jmHK
         8U0XMhgj871iPRMTlUbzMbAPowQFoqi3liHebg6uxMxt4ETh90hqws0LpNC8Y90L10hI
         N/M2yYAXjoHSl012Bpw0i1HvUfLpKooqj5gVMINklOfnmm14neY7H4sBYGt5jFWb3ILG
         xY7g==
X-Gm-Message-State: AOJu0YzYGzA0aFl5lHAFkTIYiFOaqbVwDSMXeXlLxD3Au/bczE80f8xj
	/sHs/Tks+93uct3GyA2zo+rIShRxUoM6sTM7QAXJUWxSh1w+n9nxAxNGRjqDEa0=
X-Google-Smtp-Source: AGHT+IGzT0FVaOwZhG4/BSTU2d66uplYnvxC1s9lZ4xY+qwtp3miVSgAgCuPLW0p+e65vrXbYAwmnQ==
X-Received: by 2002:a05:6902:1a44:b0:e0e:8941:c37f with SMTP id 3f1490d57ef6-e166553a1f9mr4820336276.46.1724290984038;
        Wed, 21 Aug 2024 18:43:04 -0700 (PDT)
Received: from [192.168.8.164] ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39a752e50sm738957b3.39.2024.08.21.18.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 18:43:03 -0700 (PDT)
Message-ID: <52c3cee7-9ee4-43cc-becd-b60ac0c20e6b@linaro.org>
Date: Wed, 21 Aug 2024 19:43:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/14] qemuarm64-secureboot.yml: Set branch to
 scarthgap
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Ross Burton <Ross.Burton@arm.com>,
 Jon Mason <jon.mason@arm.com>
References: <20240819190429.2897888-1-javier.tia@linaro.org>
 <20240819190429.2897888-15-javier.tia@linaro.org> <ZsWRAt4LHGd68rQT@nuoska>
Content-Language: en-US, es-MX
From: Javier Tia <javier.tia@linaro.org>
Autocrypt: addr=javier.tia@linaro.org; keydata=
 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
 WdJQjTu3/NJR54YogRY=
In-Reply-To: <ZsWRAt4LHGd68rQT@nuoska>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Aug 2024 01:43:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5988

On 8/21/24 1:02 AM, Mikko Rapeli wrote:
> Hi,
> 
> On Mon, Aug 19, 2024 at 01:04:29PM -0600, Javier Tia wrote:
>> UEFI Secure Boot is broken in master. Set to the latest stable OE 
>> branch.
> 
> What exactly is broken on master? On my build with this series 
> everything worked with master commits:

Every time I tried to boot the kernel, I was getting an authentication error. However, after clearing out all repos and cloning them, that is no longer the case. Perhaps there was an upstream problem that was resolved.

$ kas build ci/qemuarm64-secureboot.yml:ci/sstate-mirror.yml:ci/testimage.yml
...
2024-08-21 19:24:11 - INFO     - Repository poky checked out to 94993b0ef4d670cbfee517b703e356de461078a9
2024-08-21 19:24:11 - INFO     - Repository meta-openembedded checked out to fc0264f0fd424e18c364d18cbce69eae386c8995
2024-08-21 19:24:11 - INFO     - Repository meta-secure-core checked out to ae48c2372a346eee842e94e0a230944977bc5293
...
SUMMARY:
core-image-base () - Ran 73 tests in 21.193s
core-image-base - OK - All required tests passed (successes=16, skipped=57, failures=0, errors=0)
NOTE: Tasks Summary: Attempted 4266 tasks of which 3983 didn't need to be rerun and all succeeded.


Thanks,

» Javier Tia 🖋

