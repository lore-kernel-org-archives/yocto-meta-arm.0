Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web10.10387.1591104063346115331
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Jun 2020 06:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TIJ72rP1;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: jpewhacker@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id x207so3148019pfc.5
        for <meta-arm@lists.yoctoproject.org>; Tue, 02 Jun 2020 06:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=VwFXluK3/31BVWmnWI5EAtSpVimQFPrNRVBHpyrLjjY=;
        b=TIJ72rP1of6s/xRQS+7mIS1bTKoI6NVkB3nLk3y1LMYOO/uYszgtk3nlVPSNQ3jp2H
         G+RG+LYv2iUFw+vHvnsBFNfQoLVq4ytK2rbObpwRJ2Ri/tNuShoIv4Z9kRJ9us4HBT0P
         zKhLr0m48LlX9bY9Q1BgP6lXYHjmXCY+EMDN+xHOrkdZfE6j8oPGbnuiu3rSIn1GjEUq
         2M+rhh3XobhxHLhz/sWu3DAIybcLTF3y0mdaYTyM1eMioLwo0zCnvTm8Kxl42tRSsEY4
         rK8ZcyFcdAtPK76HFvavy0l3IiD/9Dt1lkmx0jH5ui2lC0/jZI3czRSC5E75Y/ucuf4P
         iO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=VwFXluK3/31BVWmnWI5EAtSpVimQFPrNRVBHpyrLjjY=;
        b=fW/OMjN1XSo3fURTXtRm0JPCfg+3VPLG1eJD/eU3kqanC+eMqVU/73Rwysxo4I+7zB
         83c3zlmrj8V/oEAy270uYh2IeWoON0WLvkt7km+GIseY18b+hAZblEb0+rl6ppPUDiii
         /DQhJr2jf+J9Npr0WvAmjlDYfIKf51n2agnp3nCLfBFSwfoxrw6bsb7yts2ggGHG6UGY
         g7eUzBXeDXLHJ/hDoT41oJapJIZU2UJlrN3J0XqF15/TqWNH2zEe1r46vcyH9Mdnt19o
         iwkd26cQlFMBs3ECVzc4PaJsjn/15TtoRW+kcbP0n11H6fins3g75Fnu6dbXGMk5YvcX
         O4Fg==
X-Gm-Message-State: AOAM5338Bkp43PHEtVcGqrFCUxafpgq11/9autqTWoZon5wc/8PGCG0X
	RC/hYhwW3V9Ig+nEZuH7p4Jsfr3c9Os=
X-Google-Smtp-Source: ABdhPJwF1sNJO2i5JHssr+cmDDZGh8w2nqNqyARs0A/rsvxi+BbrT0xZ9v9LRkNXucGSCMqxD6Z6Lg==
X-Received: by 2002:a65:450d:: with SMTP id n13mr16572578pgq.86.1591104062042;
        Tue, 02 Jun 2020 06:21:02 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:b01b:daad:c850:7bb9? ([2605:a601:ac3d:c100:b01b:daad:c850:7bb9])
        by smtp.gmail.com with ESMTPSA id v3sm2657347pja.8.2020.06.02.06.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2020 06:21:01 -0700 (PDT)
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
 <a6576f43-1722-3f32-dbd0-3d4ad0dd346f@gmail.com>
Message-ID: <ee46233b-fd2f-7a0c-66c1-a4b83e0faf98@gmail.com>
Date: Tue, 2 Jun 2020 08:20:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a6576f43-1722-3f32-dbd0-3d4ad0dd346f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 6/1/20 4:55 PM, Joshua Watt wrote:
>
> On 6/1/20 4:31 PM, Jon Mason wrote:
>> On Sat, May 30, 2020 at 01:39:49PM -0500, Joshua Watt wrote:
>>> On Fri, May 29, 2020, 10:37 AM Bertrand Marquis 
>>> <Bertrand.Marquis@arm.com>
>>> wrote:
>>>
>>>>
>>>>> On 29 May 2020, at 16:32, Joshua Watt <JPEWhacker@gmail.com> wrote:
>>>>>
>>>>>
>>>>> On 5/29/20 10:21 AM, Bertrand Marquis wrote:
>>>>>>> On 29 May 2020, at 16:14, Joshua Watt via lists.yoctoproject.org
>>>> <JPEWhacker=gmail.com@lists.yoctoproject.org> wrote:
>>>>>>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>>>>>>> ---
>>>>>>> meta-arm/conf/layer.conf | 3 +--
>>>>>>> 1 file changed, 1 insertion(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
>>>>>>> index d96e9f1..1c241d4 100644
>>>>>>> --- a/meta-arm/conf/layer.conf
>>>>>>> +++ b/meta-arm/conf/layer.conf
>>>>>>> @@ -11,6 +11,5 @@ BBFILE_PRIORITY_meta-arm = "6"
>>>>>>>
>>>>>>> LAYERDEPENDS_meta-arm = " \
>>>>>>>      core \
>>>>>>> -    meta-python \
>>>>>>> "
>>>>>>> -LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
>>>>>>> +LAYERSERIES_COMPAT_meta-arm = "gatesgarth"
>>>>>> Could you explain why you want to remove dunfell compatibility ?
>>>>> dunfell doesn't have the required python recipes in oe-core, so it 
>>>>> isn't
>>>> compatible with it anymore.
>>>>
>>>> Nothing has been tested or is compatible with gatesgarth right now 
>>>> so this
>>>> change will really have a breaking impact.
>>>>
>>> Right, you certainly wouldn't want to backport it to the dunfell 
>>> branch;
>>> this is just for master where the next release would be gatesgarth 
>>> anyway.
>>>
>>> Also, with the qemu support I added, I think we have reasonable testing
>>> coverage on meta-arm, and in particular enough to have high 
>>> confidence in
>>> this change.
>>>
>>> Finally, FWIW, upstream oe-core and meta-python have already made these
>>> changes on their master branches, so it seems like we wouldn't want a
>>> useless dependency on meta-python in meta-arm, *especially* if the 
>>> idea is
>>> to get other bsp layers to depend on meta-arm to consolidate things 
>>> like
>>> TF-A and optee.
>> We currently have a requirement for dunfell compatability on the
>> meta-arm master branch for Arm's BSP software releases (which will
>> be YP based going forward).  To make a stable release for our
>> customers, we need to draw a line between stablity of our dependent
>> layers and the latest code in the meta-arm layer.  This especially
>> relates to the BSPs Arm will be adding to meta-arm-bsp in this
>> release.
>>
>> We do not have to keep dunfell support in master after the release of
>> gatesgarth, but we will need it until then.  So, please stash this
>> patch until October (which will be here sooner than you think).
>
> Hmm, that's really unfortunate. That makes me think this layer is not 
> actually intended to be a centralized location for ARM related things, 
> and I'm probably not going to try and consolidate things from other 
> layers here anymore. Not having a master branch that can be used with 
> the master branch of OE-core really eliminates the possibility for me 
> to use a BSP layer like e.g. meta-rockchip for upstream development 
> and testing if that BSP layer depends on meta-arm and meta-arm is 
> perpetually stuck on the last release.


Sorry for going a little overboard here, I was a bit upset because one 
of my main goals had been to remove the meta-python dependency and I 
overreacted. I do still plan on contributing to meta-arm :)


One thing that might help is to define what the testing criteria for the 
community focused layers is. As an example: We have pretty good coverage 
with the recipes in meta-arm on qemu (we could even tie the op-tee tests 
into ptest). Is testing meta-arm changes on qemu sufficient to get them 
accepted to master?


>
>
>>
>> Thanks,
>> Jon
>>
>>
>>>
>>>> Bertrand
>>>>
>>>>>
>>>>>> Bertrand
>>>>>>
>>>>>>> -- 
>>>>>>> 2.17.1
>>>>>>>
>>>>>>>
>>>>
>>> 
