Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web12.504.1592849048804745150
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Jun 2020 11:04:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MKZpiBRj;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: jpewhacker@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id m2so200388pjv.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 22 Jun 2020 11:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=M1ZPlRm+vstGE4I8MsLqjax1cC95gsE4ccxZl5u40Yc=;
        b=MKZpiBRjOYgr25JxokSyGGgKg1xAObT7wBv8RUu4WWJ5rFXzJ4vDbtLNIktakR9kr2
         r1LJanc0KTxNumBEI1IBC+LoQLyMo6hshoihTLddAHpK/976sanpSN37xSONJe+wGrd1
         QB3s+bI3ph8hmhbE5LfqyhYvQAbGfC6kNzwz0jq1VVLMT8ngqqRk2389q4pV/mlR1iGc
         aWgZJAxLM25au8UoJwu3MgVr01aZTn1jMB3V4iKVsQ1zAz77OpVFEiXX60DrJ52xPOGQ
         NVExinsaEIVoXCL0ai1bkSt00LrHZv8eNPQJpso4/3YhYqQEdfUE2ci4/tQDeWVZRyXs
         MjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=M1ZPlRm+vstGE4I8MsLqjax1cC95gsE4ccxZl5u40Yc=;
        b=fYndzijtgCYUq99vOv91HNcy6xzF6CBklefMPfEdkjsJLJM/kEeSJF5CJnjnqnU6oj
         6RreOHglzIvnNCDTVNjoQZyCa6qUPwrTA9VZRQ5CWl6H3hncnKo5iVcMRc+4q8iN9TIS
         rxjyet4UQxTxyJhnFV0TE2gi2hAjzC8TOtwsMfpicJvxClZq0b71jSxY0xWc/YOyCp5E
         pU96KjYGQLR7XA2TxHr2fzkHV6ckSZsXVLbfZjZBD/7wkCdZSkFT+Gd6ToxaIm3aeaoV
         EhlT1gaQrcfE0sLHkKUXRLWph2vtUVgiGCeU1Cjc3Lvxa8pLBFXwsZ4gm4924NEGmixw
         t0cQ==
X-Gm-Message-State: AOAM531iKRjxFKKX+lygFnq2d9C1BG8/7sqdfsY6xxli8yybGI4I89lv
	KmbhUjTzwOV/Q0Z71DtiyJQ=
X-Google-Smtp-Source: ABdhPJzKTYh/1dRxc2ktnonPgifEwhwtV8o0XHGFbqmBznd1rEkkUEjCSiugr/YegNGeJ0LWejbQIA==
X-Received: by 2002:a17:902:9882:: with SMTP id s2mr20552363plp.112.1592849048314;
        Mon, 22 Jun 2020 11:04:08 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:68be:1a7e:bc1:212b? ([2605:a601:ac3d:c100:68be:1a7e:bc1:212b])
        by smtp.gmail.com with ESMTPSA id m14sm11912775pgt.6.2020.06.22.11.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2020 11:04:07 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [meta-arm] [PATCH 4/6] arm: trusted-firmware-m: Add recipe
To: Denys Dmytriyenko <denis@denix.org>, Jon Mason <jdmason@kudzu.us>
Cc: Gabor Abonyi <gabor.abonyi@arm.com>, meta-arm@lists.yoctoproject.org,
 nd@arm.com
References: <20200622071401.2570-1-gabor.abonyi@arm.com>
 <20200622071401.2570-5-gabor.abonyi@arm.com>
 <20200622164936.GF17660@denix.org> <20200622172654.GC14044@kudzu.us>
 <20200622173611.GG17660@denix.org>
Message-ID: <e4cd2080-3747-9ead-d307-6394caba82d1@gmail.com>
Date: Mon, 22 Jun 2020 13:04:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200622173611.GG17660@denix.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 6/22/20 12:36 PM, Denys Dmytriyenko wrote:
> On Mon, Jun 22, 2020 at 01:26:54PM -0400, Jon Mason wrote:
>> On Mon, Jun 22, 2020 at 12:49:36PM -0400, Denys Dmytriyenko wrote:
>>> On Mon, Jun 22, 2020 at 09:13:59AM +0200, Gabor Abonyi wrote:
>>>> Adds a recipe to pull down the trusted-firmware-m repository and the
>>>> ones it depends on. The recipe can either use gcc-arm-none-eabi-native
>>>> or armcompiler-native Clang toolchain to compile the firmware.
>>>>
>>>> Change-Id: I37a4ba38982b5b1d387eccbb26bb5c79bddab0f7
>>>> Signed-off-by: Gabor Abonyi <gabor.abonyi@arm.com>
>>>> ---
>>>>   meta-arm/conf/layer.conf                      |   1 +
>>>>   .../trusted-firmware-m/trusted-firmware-m.inc | 118 ++++++++++++++++++
>>>>   .../trusted-firmware-m_1.0.bb                 |  25 ++++
>>>>   3 files changed, 144 insertions(+)
>>>>   create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
>>>>   create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
>>>>
>>>> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
>>>> index 3341972..10a7951 100644
>>>> --- a/meta-arm/conf/layer.conf
>>>> +++ b/meta-arm/conf/layer.conf
>>>> @@ -11,5 +11,6 @@ BBFILE_PRIORITY_meta-arm = "6"
>>>>   
>>>>   LAYERDEPENDS_meta-arm = " \
>>>>       core \
>>>> +    arm-toolchain \
>>> This may be problematic...
>> Yes, this was flagged as a potential problem internally.  Fortunately,
>> meta-arm-toolchain currently has no other layer dependencies.  So, it
>> shouldn't hurt too much.  Ccing JPEW directly on this, since his
>> insight has been helpful in the past.
>>
>> TF-M requires Arm's LLVM/Clang based toolchain to compile, which is
>> the second patch of this series.
> One of the options is to move TF-M to meta-arm-bsp...

Ya, I wouldn't want to mandate meta-arm-toolchain here. You could either 
move it to meta-arm-bsp as Denys suggested or possibly use BBFILES_DYNAMIC?


>
