Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web11.1316.1589229727844891928
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 13:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i70cN0N3;
 spf=pass (domain: gmail.com, ip: 209.85.166.194, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f194.google.com with SMTP id m5so10026036ilj.10
        for <meta-arm@lists.yoctoproject.org>; Mon, 11 May 2020 13:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=7kRcdcIEyZJUebh4QImxtIfKh82XjFhy0/fLxBZ7K60=;
        b=i70cN0N3n/NGq4Q0x1xTBLjSoXBFNvJ1P8kJRyv+0tJMIL/BhhgRbcHYYYPVYSHTOC
         lsjEAXkRuRJ1mL0+KlDAqQ+M7os76pCDxVuuDkfzwCpkQuorbSyHvICRZTTaFK3ZiQtE
         v2crBO+2CB+NWN4UeKaIy95UvwsqajqRno954LvMYkoFrSGLHGts1tZYJ59VwTu8VpYk
         CxEmi0Idma9gpicc1w+hw6H1kGvMGWMSpuMyocxhkI4fi8TiYI/8sR4UQQxHI4H0M+cw
         qsFsuI0KyZEMfW7W5v6CXANe5o2bd/nkoR+rRkXFBfWz7rMkkAvl9ofNCPtyiQ7TiRmF
         eOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=7kRcdcIEyZJUebh4QImxtIfKh82XjFhy0/fLxBZ7K60=;
        b=mfa3pyA4uAmrVSQn5895QmJnse0t/JqHtBp7j+peyforPvu6EJZkQ2EZMo+UWiO5W7
         +JDTekDjEJ6JdtQbWHa7fTStLK5V3tBzJF6pLjJvZ+ei9uqqgnaIiT8MrJ2arv6691kp
         iGQIVGgYVP7nZmvMOoenWiKaDkgTK0NzC4m8sVoxfPpsRwR2OKI/cmz1XLIhF2/dBm53
         bF9yzGpZaY+dYYo8Hwf8WpOy8yTkwVW5Y5kXTKixbfmgTyhBx9pnrypH1Ut1Kb6M5cT8
         vP+hxRehap8NOqeQU1yPnEr64XbFLJrJ5y5O9WH1kSdZmcqHbOUUo1v2HDGZcAvZvDHe
         Ipuw==
X-Gm-Message-State: AGi0PuYsATVcPr7NL/Xv7zFfDesvdaB60mwRScG9deLo269gABUMBcM2
	iWqs6mxS8WVLwwjMkI+BAGM=
X-Google-Smtp-Source: APiQypJbZ98WRFPhnCe9p40nnly8SJzPoEhzmuevrS7AsWqnsRoZDuLTDJ/Ra64+M6KiWvVNrn1S9Q==
X-Received: by 2002:a92:bb55:: with SMTP id w82mr4413846ili.211.1589229727204;
        Mon, 11 May 2020 13:42:07 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:ac13:ea07:8c16:df2d? ([2605:a601:ac3d:c100:ac13:ea07:8c16:df2d])
        by smtp.gmail.com with ESMTPSA id c11sm2929110ilg.20.2020.05.11.13.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2020 13:42:06 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [meta-arm] Sharing TF-A with multiple BSP
To: Khem Raj <raj.khem@gmail.com>, Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, openembedded-core@lists.openembedded.org
References: <2fb20adc-6d54-fefc-dfe7-007ee02fc01d@gmail.com>
 <160E09F2270E9334.31760@lists.yoctoproject.org>
 <20200511174807.GL11927@denix.org>
 <CAMKF1sp+ywOQF0YbBC3H7Jv=1J-Vw+5U8Q36spFk4cf7VKi_8Q@mail.gmail.com>
Message-ID: <472db5aa-2441-c213-d86b-f19db77304dc@gmail.com>
Date: Mon, 11 May 2020 15:42:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp+ywOQF0YbBC3H7Jv=1J-Vw+5U8Q36spFk4cf7VKi_8Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Looping in OE-core. Specifically, would there be any push back to adding 
pycryptodomex and pyelftools to oe-core?


On 5/11/20 1:00 PM, Khem Raj wrote:
> On Mon, May 11, 2020 at 10:48 AM Denys Dmytriyenko <denis@denix.org> wrote:
>> + Khem
>>
>> [apparently, nobody follows the list, so need to round up everyone interested] :)
>>
> Admittedly I don't follow and this layer shows up because I need
> meta-ti just for beaglebone
> which does not use optee, so not that interesting but I am on
> receiving end of this.  I agree
> option 5 is best and if, we could also move the recipe to meta-oe at
> least that can be a lesser
> common place if not core.
>
>> Please see below for possible discussed options. IMHO, #5 would be ideal.
>>
>>
>> On Mon, May 11, 2020 at 01:37:30PM -0400, Denys Dmytriyenko wrote:
>>> On Mon, May 11, 2020 at 09:47:49AM -0500, Joshua Watt wrote:
>>>> Continuing the outcome from a discussion that was on the OE-core
>>>> mailing list, I've started converting some of the BSP layers I work
>>>> on to use the trusted-firmware-a recipe from meta-arm as the
>>>> canonical source of ATF instead of each of the implementing their
>>>> own recipe. So far this has gone well except for one annoyance I've
>>>> found: meta-arm has a layer dependency on meta-python, specifically
>>>> for the optee recipe. Normally, this wouldn't be such a big deal,
>>>> but in a ideal world there will now be a lot of BSP layers that
>>>> depend on meta-arm to provide ATF, and it seems annoying to have to
>>>> make all of those layers (transitively) depend on meta-python.
>>> Yeah, I raised this issue over a month ago - unfortunately, nobody replied
>>> or acknowledged...
>>>
>>>
>>>> I can think of a few possible options:
>>>>
>>>> 1) Do nothing because no one other than me thinks this is a problem :)
>>> Don't flatter yourself... :) :D J/k
>>>
>>>
>>>> 2) Use BBFILES_DYNAMIC to make optee optional based on the presence
>>>> of meta-python
>>>>
>>>> 3) Use PACKAGECONFIG to remove the python parts of optee (if that's
>>>> even possible). They can be automatically added back if meta-python
>>>> is present via BBFILES_DYNAMIC.
>>> I don't think those are optional - they are used during the build to
>>> sign some parts. And also for ELF manipulations.
>>>
>>>
>>>> 4) Remove the hard requirement of meta-python from meta-arm; it's
>>>> only needed to build optee so the users can figure it out?
>>>>
>>>>
>>>> Anyone else have any ideas or thoughts?
>>> I can think of couple more options:
>>>
>>> 5) there are only 3 python modules needed - pycrypto, pycryptodomex (actually
>>> a replacement for pycrypto, so upstream can drop first one) and pyelftools.
>>> Could probably try to make a case of moving them to OE-Core?
>>>
>>> 6) Like optee was inside own sub-layer meta-optee within meta-linaro, can look
>>> into separating it into meta-optee within meta-arm.
>>>
>>>
>>>> Thanks,
>>>> Joshua Watt
>>>>
>>> 
