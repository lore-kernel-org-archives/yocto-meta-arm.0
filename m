Return-Path: <romain.naour@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D910FD149C9
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 16:48:11 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.319.1729874887170671620
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Oct 2024 09:48:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Spoc/+wZ;
 spf=pass (domain: smile.fr, ip: 209.85.167.48, mailfrom: romain.naour@smile.fr)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539e7e73740so2054056e87.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 25 Oct 2024 09:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1729874885; x=1730479685; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BSqkOUBna1APxAYZ4oPzOmrb6jeYDTESPk41Us20qqA=;
        b=Spoc/+wZQRCci6FYW8MyAaCwxnpyiPbJ2dJ96SnlwZFiI3fP9o21oQL/E64B8kG8j+
         /z1JuAIYzzErqgA1FjCuavLU7GVJquTAAZrDP0pVt+DSRMQGEBbs7yRG/QOQWPKgfNaf
         BnwVLjB7RihIYamiCLnpncNV/1IJUNSKduibw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729874885; x=1730479685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BSqkOUBna1APxAYZ4oPzOmrb6jeYDTESPk41Us20qqA=;
        b=gBcSMODXQsHYU6Rt8vCXSj/klCKKgza28XWOJCpuYwS4QjlJXC2n2pX4GrnGPsRd3W
         wdsqold5WzwY7zaIO9CvcHpLJiL8SPhx34X4piI5oED94pOKJSE05ymxGx/f0hH2NG0/
         iNJI2rVnfY+Z3wVmdmlu1vN0SC3miChrV2po90dZU/APtYBo6yuUS3y9ix4iIPbx2KOJ
         6bvDMbsc4/yvBbLszlGuU1GE8JdcM0X2mj0TYpQ4AS07gWh+np3prSwLKtma7vXKBjwE
         LKPI1gjaP9fwMrygINHKp3z3fteRNclTL/EVjFz5NMgUbaisgU810ExIvNBIeLLfG2Y0
         ubJw==
X-Gm-Message-State: AOJu0YwK+d/xBMJEAdeJ5E0aXJ/aSU5kn1zE7CAcltsmV6Q2BWNIsYQn
	3Ja5QJbP34aVYtCsXgs3unGXxVYiER1QRJkdZOmreTDHE/zCZclxs4jFOoDIxDo=
X-Google-Smtp-Source: AGHT+IE/+dU6cJTumbotiwcoeLZD/5ozIUijD4t4CK5/+yKd3S69Jq4h0O/sX1VK+7WSjGpyvckvbA==
X-Received: by 2002:a05:6512:224e:b0:53a:c16:a9e with SMTP id 2adb3069b0e04-53b1a37cd45mr6474363e87.51.1729874884916;
        Fri, 25 Oct 2024 09:48:04 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f? (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4319360d233sm22288575e9.45.2024.10.25.09.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 09:48:04 -0700 (PDT)
Message-ID: <f75ffd94-bf93-421c-8c0d-38a27c08927f@smile.fr>
Date: Fri, 25 Oct 2024 18:48:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CI: test external-arm-toolchain with usrmerge enabled
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, jon.mason@arm.com
References: <20241021143841.110336-1-romain.naour@smile.fr>
 <ZxbNYoVv2bZbPcI5@kudzu.us>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <ZxbNYoVv2bZbPcI5@kudzu.us>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Oct 2024 16:48:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6226

Hello Jon, All,

Le 21/10/2024 à 23:53, Jon Mason a écrit :
> On Mon, Oct 21, 2024 at 04:38:41PM +0200, Romain Naour wrote:
>> We want to test meta-arm-toolchain layer with usrmerge enabled [1]
>> since it produce some breakage with current external ARM toolchains [2].
>>
>> Instead of using a custom setting (poky + usrmerge enabled), use the
>> existing poky-altcfg provided by Yocto. poky-altcfg uses systemd as
>> init system and imply usermerge being enabled since Yocto scarthgap
>> (new systemd v255 requirement) [3].
>>
>> Note: It must be a 32bit machine, since there are currently no aarch64
>> host toolchains for aarch64 (some gitlab runner used by meta-arm are
>> aarch64 host) [4].
>>
>> [1] https://docs.yoctoproject.org/scarthgap/ref-manual/features.html?highlight=usrmerge#distro-features
>> [2] https://lists.yoctoproject.org/g/meta-arm/message/5557
>> [3] https://git.openembedded.org/openembedded-core/commit/?id=802e853eeddf16d73db1900546cc5f045d1fb7ed
>> [4] 4bfa191ada5c44baaa1f4b8aabbeb314961c0134
>>
>> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> 
> This change fails CI.  

Indeed, the CI doesn't cover all external-arm-toolchain use case and this patch
is meant to reproduce the issue reported on the mailing-list [1].

Now that the scarthgap is released and used to release new vendor SDK, end users
will encounter this issue when systemd (imply usrmerge) and
external-arm-toolchain are used.

I'll respin the patch series addressing the meson/qemu-user runtime issue, but
any help is welcome.

[1] https://lists.yoctoproject.org/g/meta-arm/message/5557

Best regards,
Romain

> 
> meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> is trying to copy 3 files which do not exist.
> 
> cp: cannot stat '/builder/meta-arm/build/toolchains/arm/lib/gcc/arm-none-linux-gnueabihf/13.3.1/include/ssp': No such file or directory
> cp: cannot stat '/builder/meta-arm/build/toolchains/arm/lib/gcc/arm-none-linux-gnueabihf/13.3.1/include/sanitizers': No such file or directory
> cp: cannot stat '/builder/meta-arm/build/toolchains/arm/lib/gcc/arm-none-linux-gnueabihf/13.3.1/include/quadmath*': No such file or directory
> 
> See https://gitlab.com/jonmason00/meta-arm/-/jobs/8143315096
> 
> It's fairly trivial to duplicate locally.  Just run:
> ./ci/get-binary-toolchains
> kas build ci/qemuarm-secureboot.yml:ci/external-gccarm.yml:ci/poky-altcfg.yml:ci/testimage.yml
> 
> Thanks,
> Jon
> 
>> ---
>>  .gitlab-ci.yml | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index f211ea97..0e9ad688 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -295,7 +295,8 @@ qemuarm-secureboot:
>>          TOOLCHAINS: [gcc, clang]
>>          TCLIBC: [glibc, musl]
>>          TESTING: testimage
>> -      - TOOLCHAINS: external-gccarm
>> +      - DISTRO: [poky, poky-altcfg]
>> +        TOOLCHAINS: external-gccarm
>>          TESTING: testimage
>>        - KERNEL: linux-yocto-dev
>>          TESTING: testimage
>> -- 
>> 2.45.0
>>
>>


