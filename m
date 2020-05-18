Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web10.657.1589824985702477104
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 May 2020 11:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kI54FSJW;
 spf=pass (domain: gmail.com, ip: 209.85.166.66, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f66.google.com with SMTP id k18so11682573ion.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 18 May 2020 11:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=2YpiyQBI+X5wXrwmyXcUXiCAkR3KHMDSz6ZwwhXO7yQ=;
        b=kI54FSJWnLjmCSpFkH/MLy018GTorHg639XtGSPFxblMsjvcN64eLncPFC3m6oc9nC
         Bp51toULwfkoIUWcyg+j3zsXJhvrc7WRJ8X/YLJjiODkb74ImSFZdFf96EzEN7zlndY1
         gdl5x2AWm3UFd8iymKa4973iIKbRkUA4DqaWFMi2unaK9B+zJXZF2+Q0ITT2WVd2SGDT
         CR4biKDcUXixtwBfMZbFZLyeFBFsJyCznBV4xqAFlZmXud5pdxQuAXN+2VYLXeUDGPOC
         kPI1vyCB2TgWg2pquRGXDr/GBI1CPKnQT2OzynfurnJfdSdH2RkOhM/fFk9ZncV97SBq
         23Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=2YpiyQBI+X5wXrwmyXcUXiCAkR3KHMDSz6ZwwhXO7yQ=;
        b=lmn29WG0n2fL/iyn/4GX91rjuc20f1JKp0CoxeI6yxwGeyzb1xO3chbVyE3OnkCDJb
         SAgFpZUQxDtNKLfMbz7Ir/vUpWBUQmm+jcXPH98a4qITG45asKK745/oEijyt2lJHSd/
         tcDy1Pps9rHup+FN7EcpvtiNWNLb+oGNcwcpGAM9mqNyNZAC96K6Dh4RmWdyNmfvmQcf
         dDtUCPh1Qh4RMzsgqv5LE3ajULu0WD2PdLfoOJZQR4TN26CwgA6LAu9VAh5MERNw8sD0
         NB/Nnns1W83vq5DJaTyOb/chRVCpMEjVi9IJ1nxJTwbJRMvVCfZuERx2oGRUNHrYIu9Y
         HLRw==
X-Gm-Message-State: AOAM531Khz/kQZLnTdwAz+BQWgSA7yvnZHJDFv9q5eiupRKRTtXxYwkG
	42ddWV7U8z32ZSV+N/FlrBH6T7Dj748=
X-Google-Smtp-Source: ABdhPJwg7ZbegPDTgwmb1Ycjb4i3hTFFSxneNWKcAo3Kx+Ca1lfI/nBnUt+NN/vOzaV8GKlNrMy95w==
X-Received: by 2002:a05:6638:68f:: with SMTP id i15mr17165094jab.136.1589824983948;
        Mon, 18 May 2020 11:03:03 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:3995:b857:4ddd:5854? ([2605:a601:ac3d:c100:3995:b857:4ddd:5854])
        by smtp.gmail.com with ESMTPSA id z24sm3798011ioe.18.2020.05.18.11.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 11:03:02 -0700 (PDT)
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
Message-ID: <2530da10-ae67-3f05-8afb-f3130cb9510c@gmail.com>
Date: Mon, 18 May 2020 13:03:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <450fe96c-56f2-f392-b719-3fd30bf458df@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/18/20 12:04 PM, William Mills wrote:
>
> On 5/17/20 12:44 PM, Denys Dmytriyenko wrote:
>> On Fri, May 15, 2020 at 11:02:39AM -0500, Joshua Watt wrote:
>>> Adds a sysVinit service to start tee-supplicant so that the optee-client
>>> package can be used on distros where systemd is not used. Also does some
>>> cleanup of the recipe including:
>>>   1) Using @path@ tokens for replacemane in the .service file instead of
>>>      paths
>>>   2) Replacing tokens in the .service file after it is installed instead
>>>      of editing the source file in ${WORKDIR}
>> Overall looks fine. Quick question - if both sysvinit and systemd are in
>> DISTRO_FEATURES - will it start tee-supplicant twice? This was never clear
>> to me - I see some recipes go the extra mile to check the DISTRO_FEATURES
>> and only install/enable the service accordingly, while some completely rely
>> on the corresponding bbclass.
>>
> I had to look into this on ubuntu/debian recently.
> systemd's sysvinit emulation will skip any sysvinit script that has the
> same name as a *.service file.
>
>  From [1]:
> """
> systemd-sysv-generator generates the service units that run the van
> Smoorenburg rc scripts from /etc/init.d, if it doesn't find a native
> systemd service unit by that name already existing in the other six
> locations.
> """
>
> I don't know if that is systemd default or Debian enhancement but OE
> should follow that rule if it does not already IMHO.

systemd.bbclass and update-rc.d.bbclass work together to do the correct 
things based on the existence of the "sysvinit" and "systemd" 
DISTRO_FEATURES, so its fine to include both in a recipe.


>
> This is not clear in the man pages [2][3].
>
> [1]
> https://unix.stackexchange.com/questions/233468/how-does-systemd-use-etc-init-d-scripts
>
> [2]
> http://manpages.ubuntu.com/manpages/bionic/man8/systemd-sysv-generator.8.html
>
> [3]
> https://www.freedesktop.org/software/systemd/man/systemd-sysv-generator.html
>
> Bill
