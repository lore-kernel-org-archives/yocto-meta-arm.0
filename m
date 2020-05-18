Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web11.1215.1589839612832344836
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 May 2020 15:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IhHUa8u7;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id k6so12451402iob.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 18 May 2020 15:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=EvDV5U8DQNsqg82KS2RL5sBnz4TA20qJTvTCmiuQh/E=;
        b=IhHUa8u7qK2Qjr9KLqBMY5KF/h5s6bXiTvVs/rsedA5lq90RH+JJnwRU6TR8yWOH43
         LC3IDLO3Em1dQc7tMrWDQ7sR0Pjy9tj2Ec+/XJHuBoSRqETQhfYyy3pbgSIZU9onZrdH
         VBjAfcxSE6S+twFjybqU+1arkOlnXH7c5ecAN54BFqFVfwHeEVpgrSynKMcesswfPceV
         8ktV16F3p+ZYYDEQE/Vt52w+VBvm1f0aU4g89QLUp6QqIBAiGiyIX0Lx6x2yxEHtTCQ6
         RmaWibCOXb/TkfKiwl48W2dYOUroLOw4DTRcnzZxlu9sVnoZrfPkFuQU2caIutKiW5yH
         jYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=EvDV5U8DQNsqg82KS2RL5sBnz4TA20qJTvTCmiuQh/E=;
        b=ET2Mjf9c+X13xn4pbAquZ1wgewIi+e4GKvk8pyRF99w6BeqczDsR0o8LweBrrIfNcr
         ltgIb5rKfOxVvoJt1Bjw4xuIwxkkjtc/2tsvZ4u9TafYRZ3eUuAEDQTglrbF/K3A5/SD
         2/kgCxqW1/0AdchNnyxQ4bgF8xAZqnRPFdMyEXOb+qfQj+WGDbSWY6dfP5b2VYhm/8Fk
         k6a6oFPfJfN2R0VsF2uWAjhmJEf7tE3lgkEopG1kYieisHBsYqru1PW+EPnz2u0EXloe
         nKSf7JQ3OxdeGcx4aZr5n+NQ8CY0fvGDTbGttTlDAS8dhcbuXBw1tHTpvrPBvqacZNEY
         rwuQ==
X-Gm-Message-State: AOAM532XUyEZL5tQgyo3WkKj3C0CMar7HFrc0uyZXcuXgoYTent1kdEL
	wHnDDZpEI9RaV3Z6+jc5GZeU623ifoY=
X-Google-Smtp-Source: ABdhPJz5aiDBPYw8cIY5GhUkqHSg2JT5el8tY7a4lBZzojLOGuS6s9Ix2pQ1N9vmABjn3VPoFC9rvg==
X-Received: by 2002:a02:6243:: with SMTP id d64mr17382424jac.135.1589839610888;
        Mon, 18 May 2020 15:06:50 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:3995:b857:4ddd:5854? ([2605:a601:ac3d:c100:3995:b857:4ddd:5854])
        by smtp.gmail.com with ESMTPSA id d8sm4323728iob.41.2020.05.18.15.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 15:06:49 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [meta-arm][PATCH v2 2/3] optee-client: Add sysVinit service
To: William Mills <wmills@ti.com>, Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org
References: <20200513221134.30072-1-JPEWhacker@gmail.com>
 <20200515160240.16395-1-JPEWhacker@gmail.com>
 <20200515160240.16395-3-JPEWhacker@gmail.com>
 <20200517164423.GJ11927@denix.org>
 <450fe96c-56f2-f392-b719-3fd30bf458df@ti.com>
 <2530da10-ae67-3f05-8afb-f3130cb9510c@gmail.com>
 <20200518185843.GM11927@denix.org>
 <09567703-1e04-ee36-f6a8-f8a60b10592b@ti.com>
Message-ID: <7c1ad105-4850-aced-26a4-61dd6e8c52b4@gmail.com>
Date: Mon, 18 May 2020 17:06:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <09567703-1e04-ee36-f6a8-f8a60b10592b@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/18/20 4:57 PM, William Mills wrote:
>
> On 5/18/20 2:58 PM, Denys Dmytriyenko wrote:
>> On Mon, May 18, 2020 at 01:03:01PM -0500, Joshua Watt wrote:
>>> On 5/18/20 12:04 PM, William Mills wrote:
>>>> On 5/17/20 12:44 PM, Denys Dmytriyenko wrote:
>>>>> On Fri, May 15, 2020 at 11:02:39AM -0500, Joshua Watt wrote:
>>>>>> Adds a sysVinit service to start tee-supplicant so that the optee-client
>>>>>> package can be used on distros where systemd is not used. Also does some
>>>>>> cleanup of the recipe including:
>>>>>>   1) Using @path@ tokens for replacemane in the .service file instead of
>>>>>>      paths
>>>>>>   2) Replacing tokens in the .service file after it is installed instead
>>>>>>      of editing the source file in ${WORKDIR}
>>>>> Overall looks fine. Quick question - if both sysvinit and systemd are in
>>>>> DISTRO_FEATURES - will it start tee-supplicant twice? This was never clear
>>>>> to me - I see some recipes go the extra mile to check the DISTRO_FEATURES
>>>>> and only install/enable the service accordingly, while some completely rely
>>>>> on the corresponding bbclass.
>>>>>
>>>> I had to look into this on ubuntu/debian recently.
>>>> systemd's sysvinit emulation will skip any sysvinit script that has the
>>>> same name as a *.service file.
>>>>
>>>>  From [1]:
>>>> """
>>>> systemd-sysv-generator generates the service units that run the van
>>>> Smoorenburg rc scripts from /etc/init.d, if it doesn't find a native
>>>> systemd service unit by that name already existing in the other six
>>>> locations.
>>>> """
>>>>
>>>> I don't know if that is systemd default or Debian enhancement but OE
>>>> should follow that rule if it does not already IMHO.
>>> systemd.bbclass and update-rc.d.bbclass work together to do the
>>> correct things based on the existence of the "sysvinit" and
>>> "systemd" DISTRO_FEATURES, so its fine to include both in a recipe.
>> So, if both are included and have the same name, systemd will skip the
>> sysvinit emulation and load the correct service only once, correct?
>>
>>
> Yes that is my understanding of how it works at run time, at least on
> debian.  Even if the user was to hand create both an sysinit script and
> a service file with the same basename, systemd will ignore the script in
> favor of the service file.  (sysvinit has know how to ignore service
> files since the 1970's :)
>
> Joshua: is what you are talking about in the classes a runtime selection
> or a rootfs build time selection?  Perhaps we are double covered?

Build time. systemd.bbclass sets INHIBIT_UPDATERCD_BBCLASS = "1" if 
"systemd" is in DISTRO_FEATURES and "sysvinit" is not, 
update-rc.d.bbclass does nothing if that is set, and setting 
INIT_MANAGER = "systemd" removes(*) "sysvinit" from DISTRO_FEATURES and 
adds "systemd", so it pretty much automatically prefers the systemd 
service files if possible.


* Well, sets DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"

>
