Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B530DC3DA61
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 20:57:39 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.4620.1721336249994821300
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jul 2024 13:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ua+XijCl;
 spf=pass (domain: linaro.org, ip: 209.85.219.182, mailfrom: javier.tia@linaro.org)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e03a9f7c6a6so1278005276.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jul 2024 13:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721336249; x=1721941049; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z8FeovTmJNP1/8px8l2SrybRYTo2c6OsJWimRDsjE00=;
        b=ua+XijClUKSXbOrnInf6AZ57Wwrx38Pc1mcyBJnXYaCxE09IyRWLSfJtDJTsQxCgRE
         NecI2l4K6IKYjBCXx+iJlNzlixzofh8HjJrsjO/HLwqOpBAGbOBIpbmw86xA5AMderHx
         4q7xl0J49rvnUadrlQhypgUYZeKbjyadWzap/+pYt3DCppFlJ4rBmpy+t3lDaBR4qIJ9
         8iqerN/CkXGD0O8OK7qDYQt3Vb5HwH67xHd3skdbIrvjOd7Y244DKGz/QGrgrq8GG08g
         Y+lhzjkw8HYRXqv0CJ7a2x870Wd41WqfwTjCSTPzNXeUcG9hFr5EQdOzRb2zkBCRKd7P
         gTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721336249; x=1721941049;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8FeovTmJNP1/8px8l2SrybRYTo2c6OsJWimRDsjE00=;
        b=dXM4CGex0BZZJkWyyzwwtsbSoC/qrmcSVh0BuI8TaFfnDMxX/aQt8uxlOxMRQ5RBKE
         0VAN2FSeWDlll6fNezExQvjjBWYIXckMo8m5YwOPJXNw4/dSApOE5RnSiAOC4DsRSoG0
         WrzeYW46570JPp3UaEfzcYVYo/DOyXKEw98+cNqXleXncL2xOCpp0wiJp85MQLg5ZgOk
         iSlRNyNmgLJ82maWGjd4r6AdWscQfFaFpYB6BHanAMKhVb5zA4ZppG69Rzy+xXHatgtS
         4q+SzFBn4xtKWHjAlcPRcHQKkSb9om9M9Y2sMGmLsFUgo+EIAoh7FyQt6w2CU4e5NY6B
         JXQA==
X-Gm-Message-State: AOJu0YzODOlYz4PRRxW3K5YdbQGCUByRKhk7vCGMzRJT8vHrWogOCNz8
	VjJuxMc6k35p4x4eg2zI0+HG0sQ7n5SqIt5FIQEEBtT0N7zqEJOd5MMmbFZ6jdc=
X-Google-Smtp-Source: AGHT+IG1x/TZNS5AuqLCSA1dyH/7dgaX5cp0bwUSvHy49wXjNGR7HdVcmoWfplCgz90Dv88qnt2Xcg==
X-Received: by 2002:a05:6902:1247:b0:e05:f3da:6583 with SMTP id 3f1490d57ef6-e05f3da681dmr6405014276.43.1721336249194;
        Thu, 18 Jul 2024 13:57:29 -0700 (PDT)
Received: from [192.168.8.164] ([190.171.102.111])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e08609eb939sm10462276.28.2024.07.18.13.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 13:57:28 -0700 (PDT)
Message-ID: <0f706d98-b022-45e0-9b7d-29a399ffb8bc@linaro.org>
Date: Thu, 18 Jul 2024 14:57:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arm] [PATCH] qemuarm64-secureboot: Enable UEFI Secure Boot
To: Ross Burton <Ross.Burton@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
 Mikko Rapeli <mikko.rapeli@linaro.org>
References: <20240715204517.781716-1-javier.tia@linaro.org>
 <3D6EA368-454B-44CD-9087-7233A4091763@arm.com>
Content-Language: en-US-large, es
From: Javier Tia <javier.tia@linaro.org>
Autocrypt: addr=javier.tia@linaro.org; keydata=
 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
 WdJQjTu3/NJR54YogRY=
In-Reply-To: <3D6EA368-454B-44CD-9087-7233A4091763@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Jul 2024 20:57:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5907

Hi,

On 7/17/24 9:29 AM, Ross Burton wrote:
> On 15 Jul 2024, at 21:45, Javier Tia via lists.yoctoproject.org <javier.tia=linaro.org@lists.yoctoproject.org> wrote:
>> Introduces uefi-secureboot machine feature.
>>
>> Ideally, these changes would be submitted to meta-secure-core, but the
>> code currently doesn't support ARM.
> 
> Can you explain what is missing in meta-secure-core, and why we don’t just fix that instead of adding duplicated code into meta-arm?
> 
Technically, it is possible to add these changes. The original plan was to incorporate these changes into meta-arm, as we at Linaro were unaware of the existence of meta-secure-core.

The meta-secure-core's maintainer is willing to accept patches to add UEFI Secure Boot for ARM. [0]

>> Sample keys are added in order to be added in u-boot and sign grub and
>> Linux kernel image. A script is provided to generate new keys.
> 
> I’m _very_ hesitant to add “sample” keys to meta-arm, because “insecure by default” is a bad idea and someone will forget to swap them out in production.  Instead the model should be “tell me where your secure keys are, or I’ll generate by own _for this build_”.
>
Fixed in patch series v1.
  
>> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2027.04.bb b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2027.04.bb
>> new file mode 100644
>> index 00000000..8c8d5dd8
>> --- /dev/null
>> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2027.04.bb
>> @@ -0,0 +1,5 @@
>> +require recipes-bsp/u-boot/u-boot-common.inc
>> +require recipes-bsp/u-boot/u-boot.inc
>> +
>> +SRCREV = "3f772959501c99fbe5aa0b22a36efe3478d1ae1c"
>> +PV="2027.04"
> 
> Presumably this is actually 2024.07, and this should be added to oe-core instead of meta-arm.
> 
Fixed in patch series v1.

[0] https://github.com/Wind-River/meta-secure-core/issues/67

» Javier Tia 🖋


