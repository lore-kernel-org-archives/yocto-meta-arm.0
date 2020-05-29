Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web11.37229.1590766289404677784
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 May 2020 08:31:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a/v8lhF8;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id k18so2843519ion.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 29 May 2020 08:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=E2HeQRIeNfOsVh+v9wySdqoOBrw9AS94Pw6vemHEdsU=;
        b=a/v8lhF8lEq5FRgsTHizWJ83TaJqPJoJGRntfxHWfCiYDuoPp3f3467OJjXJKv9PRz
         Hz1WzNpwDwmrlFTKDNtDGzmFBoWeyidWKbFKPPK5+/DCKodupzazr8zIz4+WTSpH07Hd
         bh1p3pdbDvGMFbi8mRA7xAQ0XXkAcEy8FqB5fc0TiXX2X6RBpFGLmCRty05NAhHCkHHT
         c1mkxp6k32q+N3JwPzCP1hvocr2miDZ4uo2bsbsg3/4sL9HNOGF4X8ztRhJBqG1sft87
         4/WkAxcFQK7Ml0Ufe5zvuLBmukw2X5zjEXsvjHw0abJx2tINfehirVp9v6ZoYpRGdue1
         kpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=E2HeQRIeNfOsVh+v9wySdqoOBrw9AS94Pw6vemHEdsU=;
        b=mk67JaZjJ17l3V6PeMF9zVkzasGLY/IfzjFEQuMIW6ntWXF/2212LuxM+AB/pvi3x0
         mII8h7Ghx65z9uZxGr1ru4tYFCyTdARbveq+omZBJsBJv5YV/JcfW0PxSW4GXdjL0ce8
         8QKQEwWyt5UWPvUILHMyke2wLv5gjGH9yaBwmxrORC1zgro81Lvxowt9T/v3pKYUuK0T
         k9DWBLGnHokw4v6Dq7A32L7OJGoCCiC2AtToYHWVgj6DZYx6ZzyA9Sfb1tY8xqP3lRPa
         IrrftRIIw8keQS2ukutretWm4LEgiQqYe1j54k0K0WniqatYCI425goHgl6ZG5JGHlHT
         OPnA==
X-Gm-Message-State: AOAM531KpQFztWwrK+kgE1fM6ujdkZCcg7ZAB02NdzeyTU4VKWjN9+Rx
	tLGxvai7jk28CsIkmka8DUw=
X-Google-Smtp-Source: ABdhPJzNbAoD4B++ymp/Pif2K+0g1n6EV3grk9tV98wdIHYtbCWGpJu/hwJbOdCBS+352NBGJRURSw==
X-Received: by 2002:a05:6602:241d:: with SMTP id s29mr7195469ioa.129.1590766288843;
        Fri, 29 May 2020 08:31:28 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:2495:669d:5b93:9222? ([2605:a601:ac3d:c100:2495:669d:5b93:9222])
        by smtp.gmail.com with ESMTPSA id g4sm4882215ilj.45.2020.05.29.08.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2020 08:31:28 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [meta-arm][PATCH] meta-arm: Remove meta-python dependency
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
 nd <nd@arm.com>
References: <20200529151841.36120-1-JPEWhacker@gmail.com>
 <70C8CF45-C96B-459D-9CCE-BF5F0DB009D8@arm.com>
Message-ID: <a40228fd-7dc0-4f7a-a3f6-99d21e12a219@gmail.com>
Date: Fri, 29 May 2020 10:31:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <70C8CF45-C96B-459D-9CCE-BF5F0DB009D8@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/29/20 10:22 AM, Bertrand Marquis wrote:
>
>> On 29 May 2020, at 16:18, Joshua Watt via lists.yoctoproject.org <JPEWhacker=gmail.com@lists.yoctoproject.org> wrote:
>>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>> meta-arm/conf/layer.conf | 3 +--
>> 1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
>> index d96e9f1..1c241d4 100644
>> --- a/meta-arm/conf/layer.conf
>> +++ b/meta-arm/conf/layer.conf
>> @@ -11,6 +11,5 @@ BBFILE_PRIORITY_meta-arm = "6"
>>
>> LAYERDEPENDS_meta-arm = " \
>>      core \
>> -    meta-python \
>> "
>> -LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
>> +LAYERSERIES_COMPAT_meta-arm = "gatesgarth"
> Same here, why removing dunfell ?

Sorry I accidentally sent the same patch twice.


>
> Bertrand
>
>> -- 
>> 2.17.1
>>
>> 
