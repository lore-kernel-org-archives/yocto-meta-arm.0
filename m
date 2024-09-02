Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E07CA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 17:53:43 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.5003.1725299613066105244
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Sep 2024 10:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Jsyvtqks;
 spf=pass (domain: linaro.org, ip: 209.85.167.178, mailfrom: javier.tia@linaro.org)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3df13906bcdso1869091b6e.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 02 Sep 2024 10:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725299612; x=1725904412; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v7CZ66F9GsxXkkDevXx1VJC88IG5EXmdktNA6nDfo28=;
        b=JsyvtqksmhOhw+lvgfXedX5aeB9BrAevAgkdImyVGWJkb93TdIJftXN4g2hJNk4akE
         iEP6umdnu/Dhkbv+tJw/k+YysLoS0ezzLYu320lcLsa8BIIgNnNoGh51WZ+xoKg1PKOv
         80/MFVy4on0ROR57MWHLKwqOr6h20OgyOUxLs67EsR+VROk/ovM/111OkF1tOH+yjP8M
         GoXWGveyM+4948iI0waEV9Oc386tvZm2nlU16lRZWkmAcnoug1eKCyEdfLqYULJw7/Et
         gELNX0QPngfJiYx7K1B1eEcUIWA9syoRxS91JFt0PKWv4/4DqbnlxuDzFHfj6r6KPdXr
         onWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725299612; x=1725904412;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7CZ66F9GsxXkkDevXx1VJC88IG5EXmdktNA6nDfo28=;
        b=FIP2ike77SFVbJm2+pRz8sgyVD+koDj2L1gDjmTVoLMBvVTJeyeBusL/q3am6/wS+d
         ltIOOhEJ5ioBK/KgMFe6n4F4mYSh/Or5uGYzsBO5hT8eDckHKJsWrwjecNOOziqz56Vc
         Vg0OhC1GBDOEb5fydNDbqboVaBp5CGeLnqUPI+N/VmfKWOWehU5xW3Ygxm9IQi8pRTQh
         WXQ0xyzqZo5afoFjexW8Sh836mmCiECezfy9Sw/1NyUtS89RsfxoSA2UwJhUU+vl0JNt
         v/XlEbNrVzC/9PkoKihoXoV4XsOrNKtM+FSWJYL9nvoY86dZxgdGHM3ejr1Ip0SdXyGu
         oN3g==
X-Gm-Message-State: AOJu0YxYo1zhXtK7Yqdgq+uRvLGgHaJEdQvHy8aDilQ2pl8g02m20iy9
	k7BPrOUH1m891A6jSzlXbH0mmiYpKRosPfZyRipxGfypkRnIFFbkcY6d9GuaeRw=
X-Google-Smtp-Source: AGHT+IGWY2T72SMq7JjFo24pTYhus7SSVrHMCGiTSBXjs6Kr2xUVtceC9fJlgiVD0kNo2EC0SbgYiQ==
X-Received: by 2002:a05:6808:1998:b0:3d9:e090:5e1e with SMTP id 5614622812f47-3df1b6f1bbdmr8408447b6e.7.1725299611956;
        Mon, 02 Sep 2024 10:53:31 -0700 (PDT)
Received: from [192.168.8.164] ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45682cac1e2sm41574041cf.36.2024.09.02.10.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 10:53:31 -0700 (PDT)
Message-ID: <78d9fd35-7594-41c4-9092-b3d011814dd6@linaro.org>
Date: Mon, 2 Sep 2024 11:53:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/13] qemuarm64-secureboot: Add UEFI Secure Boot
To: Jon Mason <jdmason@kudzu.us>, Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Ross Burton <Ross.Burton@arm.com>
References: <20240829163209.47945-1-javier.tia@linaro.org>
 <ZtE3MqOM2D40ei5r@kudzu.us> <ZtFiZjM7pRqSNm2l@nuoska>
 <ZtHIJUfxF7xwDM-Q@kudzu.us>
Content-Language: en-US, es-MX
From: Javier Tia <javier.tia@linaro.org>
Autocrypt: addr=javier.tia@linaro.org; keydata=
 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
 WdJQjTu3/NJR54YogRY=
In-Reply-To: <ZtHIJUfxF7xwDM-Q@kudzu.us>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 02 Sep 2024 17:53:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6048

Hi,

On 8/30/24 7:24 AM, Jon Mason wrote:
> On Fri, Aug 30, 2024 at 09:10:46AM +0300, Mikko Rapeli wrote:
>> Hi,
>>
>> On Thu, Aug 29, 2024 at 11:06:26PM -0400, Jon Mason wrote:
>>> Looks like this series is not building for me.  I'm seeing the
>>> following error:
>>>
>>> ERROR: /builder/meta-arm/build/../poky/meta/recipes-kernel/linux/linux-yocto_6.10.bb: Unable to get checksum for linux-yocto SRC_URI entry db.key: file could not be found                     | ETA:  0:00:12
>>> The following paths were searched:
>>> /builder/meta-arm/build/../meta-arm/uefi-sb-keys/db.key
>>> ERROR: Parsing halted due to errors, see error messages above                                                                                                                                  | ETA:  0:00:14
>>> ERROR: /builder/meta-arm/build/../poky/meta/recipes-core/systemd/systemd-boot_256.5.bb: Unable to get checksum for systemd-boot SRC_URI entry db.key: file could not be found
>>> The following paths were searched:
>>> /builder/meta-arm/build/../meta-arm/uefi-sb-keys/db.key
>>> ERROR: /builder/meta-arm/build/../poky/meta/recipes-kernel/linux/linux-yocto_6.6.bb: Unable to get checksum for linux-yocto SRC_URI entry db.key: file could not be found
>>> The following paths were searched:
>>> /builder/meta-arm/build/../meta-arm/uefi-sb-keys/db.key
>>>
>>> I've not looked into it, but it's being seen on mulitple setups and is
>>> trivial to replicate with:
>>> kas build ci/qemuarm64-secureboot.yml:ci/testimage.yml
>>
>> I think this is the secure boot key generation. You should run
>> meta-arm/uefi-sb-keys/gen_uefi_keys.sh in meta-arm/uefi-sb-keys before
>> building, or have some other way of distributing the keys to build machines.
>>
>> This could be part of a recipe but that would be fully non-reproducible.
> 
> Honestly, I don't even look at the patches if it doesn't pass CI.  It
> not generating keys as part of the build seems like a deal breaker.
> 
>> Maybe there is some kas way of running this script before bitbake build
>> if the key files are not there?
> 
> It is possible, but trying to add it is going to be difficult based on
> the rewrites that would be necessary based on the way the
> .gitlab-ci.yml file is laid out.
> 
> Also, are we expecting a developer to know to run this and do this
> every time, or are we expecting to generate the keys once and reuse
> them?  Even if the latter, i think generating them as part of the
> build is logical (perhaps with a detection for existing keys in the
> directory or something).
> 
> Is it not possible to have some kind of bbappend on u-boot that adds a
> dependency on gen-uefi-sb-keys.bb and calls the script?

I have added the keys generation as part of qemu64sb build. If keys are found, it will skip the keys generation. Also, it fixes the CI build error because of a design error in the keys generation. As long as the keys are the same, it will guarantee build reproducibility.

Pending to send patch series v5 addressing rest of Jon's comments.

» Javier Tia 🖋

