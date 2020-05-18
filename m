Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web12.945.1589838750164434573
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 May 2020 14:52:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pt3STW9a;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id k18so12452150ion.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 18 May 2020 14:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=gq0NykYoyYNrgLd6JNDEx3f5GwkOWnFJc25Fd9N24i8=;
        b=pt3STW9aFOc5GjsW0QS8Ru+dWY5L4tnJaJx6Tv0PN5paoNgHDYvSMJDQIbnGwXYBtQ
         McDkJKY1pMZ9DyUxBDfhnJTXws62ZIx2J8nmQ+AE/rVCfgiXnYR5LPjbZFfik9EZTvxi
         rDXpM0CwNYB2rlhOAcED+4G6XX1bgvjJzDQohIXj4W0QtVxhDjmYYYxLijEmcSQ5wJPq
         mjq+EKt2AxlH0JWfRft+lseLPcJuOqVw9vSRq5tVIOTY+vL8e7GEDo8GlFEjfTAn6g0K
         S5ELwQmL80ULBwcBpDPl9PeU2krP4cA8zC4uM6nq5nDbEohG7OZq0/IRGekWhN4fZoN7
         wCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=gq0NykYoyYNrgLd6JNDEx3f5GwkOWnFJc25Fd9N24i8=;
        b=RGPxlD3zjv09QDPd0rjzXPINss06hLVzUpDdPGc2/AmNsUdqEltshMysXPZ9CkUoSS
         TfX3Wev6CzN192icUDTHkLXWPnETz0DghxNHO4lQg+3q3UzuLzHXWEJ5RC5LtqF4up3f
         Bndc9j4NPHOH46je1QaVj02kg1rwjC6L6gKlzBcuSkD6Yp/unSDsFuJGi6Yr9irmw1ej
         mmCmY4nU5DRnvvrjjD3+mooDcEGx92XOvE/1QZsuw24TwbGpoVileTTbZsieKBoQ96ss
         fo/TnzATqccN+oLVPCVxBTRfxpLcKcH1FcsIAKSt8tGAUw1rCMdtvkCLw21QZNmL9Vbn
         S7bA==
X-Gm-Message-State: AOAM532e0ZrtTs/EH0uKmhlXJ6al0AuWXpGUTNwJnx+YGO7zLwJZnn2p
	gzCVsjlB8cLdVUY2E3Vbly2YrBI5LTs=
X-Google-Smtp-Source: ABdhPJwHSSQy2ronLhTwngyHarDWoByc2fRf8ft8AY9lY83gLAKyEV9FXgVEjL6y0TewiLl7Z5QC6A==
X-Received: by 2002:a6b:5d08:: with SMTP id r8mr16337624iob.180.1589838749212;
        Mon, 18 May 2020 14:52:29 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:3995:b857:4ddd:5854? ([2605:a601:ac3d:c100:3995:b857:4ddd:5854])
        by smtp.gmail.com with ESMTPSA id f17sm4380088iol.26.2020.05.18.14.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 14:52:28 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [meta-arm][PATCH v2 2/3] optee-client: Add sysVinit service
To: Denys Dmytriyenko <denis@denix.org>
Cc: William Mills <wmills@ti.com>, meta-arm@lists.yoctoproject.org
References: <20200513221134.30072-1-JPEWhacker@gmail.com>
 <20200515160240.16395-1-JPEWhacker@gmail.com>
 <20200515160240.16395-3-JPEWhacker@gmail.com>
 <20200517164423.GJ11927@denix.org>
 <450fe96c-56f2-f392-b719-3fd30bf458df@ti.com>
 <2530da10-ae67-3f05-8afb-f3130cb9510c@gmail.com>
 <20200518185843.GM11927@denix.org>
Message-ID: <4b53b469-a827-2f5b-0a8a-1bb3b18d333d@gmail.com>
Date: Mon, 18 May 2020 16:52:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518185843.GM11927@denix.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/18/20 1:58 PM, Denys Dmytriyenko wrote:
> On Mon, May 18, 2020 at 01:03:01PM -0500, Joshua Watt wrote:
>> On 5/18/20 12:04 PM, William Mills wrote:
>>> On 5/17/20 12:44 PM, Denys Dmytriyenko wrote:
>>>> On Fri, May 15, 2020 at 11:02:39AM -0500, Joshua Watt wrote:
>>>>> Adds a sysVinit service to start tee-supplicant so that the optee-client
>>>>> package can be used on distros where systemd is not used. Also does some
>>>>> cleanup of the recipe including:
>>>>>   1) Using @path@ tokens for replacemane in the .service file instead of
>>>>>      paths
>>>>>   2) Replacing tokens in the .service file after it is installed instead
>>>>>      of editing the source file in ${WORKDIR}
>>>> Overall looks fine. Quick question - if both sysvinit and systemd are in
>>>> DISTRO_FEATURES - will it start tee-supplicant twice? This was never clear
>>>> to me - I see some recipes go the extra mile to check the DISTRO_FEATURES
>>>> and only install/enable the service accordingly, while some completely rely
>>>> on the corresponding bbclass.
>>>>
>>> I had to look into this on ubuntu/debian recently.
>>> systemd's sysvinit emulation will skip any sysvinit script that has the
>>> same name as a *.service file.
>>>
>>>  From [1]:
>>> """
>>> systemd-sysv-generator generates the service units that run the van
>>> Smoorenburg rc scripts from /etc/init.d, if it doesn't find a native
>>> systemd service unit by that name already existing in the other six
>>> locations.
>>> """
>>>
>>> I don't know if that is systemd default or Debian enhancement but OE
>>> should follow that rule if it does not already IMHO.
>> systemd.bbclass and update-rc.d.bbclass work together to do the
>> correct things based on the existence of the "sysvinit" and
>> "systemd" DISTRO_FEATURES, so its fine to include both in a recipe.
> So, if both are included and have the same name, systemd will skip the
> sysvinit emulation and load the correct service only once, correct?

Correct. It takes a bit of chicanery to convince a build to include both 
the init script and the systemd service file, but even if you do it 
still only starts the systemd service.


>
>
>>> This is not clear in the man pages [2][3].
>>>
>>> [1]
>>> https://unix.stackexchange.com/questions/233468/how-does-systemd-use-etc-init-d-scripts
>>>
>>> [2]
>>> http://manpages.ubuntu.com/manpages/bionic/man8/systemd-sysv-generator.8.html
>>>
>>> [3]
>>> https://www.freedesktop.org/software/systemd/man/systemd-sysv-generator.html
>>>
>>> Bill
>> 
