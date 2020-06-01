Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web12.48913.1591048527580135108
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Jun 2020 14:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fB+nLKnI;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: jpewhacker@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id nu7so404095pjb.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 01 Jun 2020 14:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=rUTAksnY6BXuFb2aSEPmlY9bu8NweKvx2U4WScCBQoI=;
        b=fB+nLKnIYBHrXxj7XV52+peIIshi8/NuQT/v1cKEfVaEMJ6h9qnq5Tw4On9H/ptt6B
         3Oi+RSwo44ZB2z83pEylU06oLHRIosSf60+wOW/kDbwzZD0w1obFpIhsg+00sFeCi0dw
         zs2QHBEn9vFR2aWz/PtPB4stTgh13Hb6qxLXetBEIrpPaVcezbT9S6xqAT+pNamj8OGn
         IaIFhc1JAklJPP3AqoUucfbxdHAxGOnNqSR9k1NHp0jHTp7v+6F6xJDt9tPHAHlcnQsn
         JPOe4YnWGHp2CJte4P1E2NjxejIEPfSDKDytD4MnDsI2lqbjl1oUi73UGdIqrpAJQ1LU
         6aSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=rUTAksnY6BXuFb2aSEPmlY9bu8NweKvx2U4WScCBQoI=;
        b=T+Ky96pCX0fLf3/3W9+5x9EvrfZExWzcvAOEL5Y0Tq/ECIL1WdCH60cKMR7x1JB4mA
         YI1LP2xfngt3e1tfRA3JoxUltKJ0pwrDfJ5rTEyrD0gdQYAp6EDhLOePR1TEgwqk+yJY
         oUM1lYYT9cGEha/3MKthxbT2yg3LUyQtz8mppvN/pBJ/5tZB+QYhQ0BrnZK2pQhsJ6OA
         nBqWuguDxbYg5yRZfKdulRuwKQQcUgvzNSXNh3XQvCuuueBHm8KimnX0/BH7sao3lP4L
         qHWfcD12lw6PM0sh+O2AprYFddh5deg+CylpRkZiOuCiBw74bNH/aOc1ty7jYWQd0bXe
         RVew==
X-Gm-Message-State: AOAM5332RGV1s/P+Oo7DDQkGH7e6e6s8bx30gK57lMymcabCe8FkbE1B
	FADeRPquC/JBcWTIQzE8E7HaTzHGjNo=
X-Google-Smtp-Source: ABdhPJzRZcutjiDWuHg0G4lP7Y14o4S6NFcTrx4cYQQBU7ecLzs6j5elLiG48ohS9R/yyGsBI3nugQ==
X-Received: by 2002:a17:90b:4010:: with SMTP id ie16mr1609524pjb.138.1591048526820;
        Mon, 01 Jun 2020 14:55:26 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:ec76:791a:e792:c8c8? ([2605:a601:ac3d:c100:ec76:791a:e792:c8c8])
        by smtp.gmail.com with ESMTPSA id nl8sm448222pjb.13.2020.06.01.14.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2020 14:55:26 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [meta-arm][PATCH] meta-arm: Remove meta-python dependency
To: Jon Mason <jdmason@kudzu.us>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 meta-arm@lists.yoctoproject.org
References: <20200529151427.20272-1-JPEWhacker@gmail.com>
 <90DD68A5-0834-4C82-8A06-BC3972756CA3@arm.com>
 <6d6ccf5c-f134-1a15-e5eb-8f5e10d03832@gmail.com>
 <09986319-6338-471F-A0C1-5096F5ED7AA3@arm.com>
 <CAJdd5Gag=0HF8+5KiF0DoLG1WZs+0ngbnT7G8CS1dFa=ydqjoQ@mail.gmail.com>
 <20200601213141.GA31505@kudzu.us>
Message-ID: <a6576f43-1722-3f32-dbd0-3d4ad0dd346f@gmail.com>
Date: Mon, 1 Jun 2020 16:55:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200601213141.GA31505@kudzu.us>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 6/1/20 4:31 PM, Jon Mason wrote:
> On Sat, May 30, 2020 at 01:39:49PM -0500, Joshua Watt wrote:
>> On Fri, May 29, 2020, 10:37 AM Bertrand Marquis <Bertrand.Marquis@arm.com>
>> wrote:
>>
>>>
>>>> On 29 May 2020, at 16:32, Joshua Watt <JPEWhacker@gmail.com> wrote:
>>>>
>>>>
>>>> On 5/29/20 10:21 AM, Bertrand Marquis wrote:
>>>>>> On 29 May 2020, at 16:14, Joshua Watt via lists.yoctoproject.org
>>> <JPEWhacker=gmail.com@lists.yoctoproject.org> wrote:
>>>>>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>>>>>> ---
>>>>>> meta-arm/conf/layer.conf | 3 +--
>>>>>> 1 file changed, 1 insertion(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
>>>>>> index d96e9f1..1c241d4 100644
>>>>>> --- a/meta-arm/conf/layer.conf
>>>>>> +++ b/meta-arm/conf/layer.conf
>>>>>> @@ -11,6 +11,5 @@ BBFILE_PRIORITY_meta-arm = "6"
>>>>>>
>>>>>> LAYERDEPENDS_meta-arm = " \
>>>>>>      core \
>>>>>> -    meta-python \
>>>>>> "
>>>>>> -LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
>>>>>> +LAYERSERIES_COMPAT_meta-arm = "gatesgarth"
>>>>> Could you explain why you want to remove dunfell compatibility ?
>>>> dunfell doesn't have the required python recipes in oe-core, so it isn't
>>> compatible with it anymore.
>>>
>>> Nothing has been tested or is compatible with gatesgarth right now so this
>>> change will really have a breaking impact.
>>>
>> Right, you certainly wouldn't want to backport it to the dunfell branch;
>> this is just for master where the next release would be gatesgarth anyway.
>>
>> Also, with the qemu support I added, I think we have reasonable testing
>> coverage on meta-arm, and in particular enough to have high confidence in
>> this change.
>>
>> Finally, FWIW, upstream oe-core and meta-python have already made these
>> changes on their master branches, so it seems like we wouldn't want a
>> useless dependency on meta-python in meta-arm, *especially* if the idea is
>> to get other bsp layers to depend on meta-arm to consolidate things like
>> TF-A and optee.
> We currently have a requirement for dunfell compatability on the
> meta-arm master branch for Arm's BSP software releases (which will
> be YP based going forward).  To make a stable release for our
> customers, we need to draw a line between stablity of our dependent
> layers and the latest code in the meta-arm layer.  This especially
> relates to the BSPs Arm will be adding to meta-arm-bsp in this
> release.
>
> We do not have to keep dunfell support in master after the release of
> gatesgarth, but we will need it until then.  So, please stash this
> patch until October (which will be here sooner than you think).

Hmm, that's really unfortunate. That makes me think this layer is not 
actually intended to be a centralized location for ARM related things, 
and I'm probably not going to try and consolidate things from other 
layers here anymore. Not having a master branch that can be used with 
the master branch of OE-core really eliminates the possibility for me to 
use a BSP layer like e.g. meta-rockchip for upstream development and 
testing if that BSP layer depends on meta-arm and meta-arm is 
perpetually stuck on the last release.


>
> Thanks,
> Jon
>
>
>>
>>> Bertrand
>>>
>>>>
>>>>> Bertrand
>>>>>
>>>>>> --
>>>>>> 2.17.1
>>>>>>
>>>>>>
>>>
>> 
