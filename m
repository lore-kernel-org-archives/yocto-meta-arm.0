Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web12.281.1594057688862564556
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Jul 2020 10:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XRF4lB5R;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id s26so3631049pfm.4
        for <meta-arm@lists.yoctoproject.org>; Mon, 06 Jul 2020 10:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gQuv8nCEvQcO+tpxspmFgyf/lKz0gnhqrrSaBiQaoo8=;
        b=XRF4lB5RxNAGv0dJT/5KKAfR7QQrdhv6zYnQwyo3ys2JdfeidivbGrbTnrrMY6PUv+
         oyQO7dFqfw8rASm2cm3Cnb1iWv9Tn/VSoJifkxf4B/QzPC3HyB77YzJGbuYveLO9VQxr
         YE+jiDDjMxDYDNp5K82roOyD9PfPYfweTJgM2n3Idu35nn8kHNJkagzexfjXlkX0fCnr
         tXy+3DJHU6Bd2GuwMdturiBfn77w3fBuaR4dOXnYNgLVABZ7c+9IIt2YQSDlAjaCaA94
         KIRfRCP0wNQu71I8iP3U35celoZQ7ROxCVXm2XsXDpgom8YQhuSjCduZgB5ZY6IlGLJp
         Ruxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gQuv8nCEvQcO+tpxspmFgyf/lKz0gnhqrrSaBiQaoo8=;
        b=K7vWvGM6BXocSffyiUaBG0RVX9feq1rFXb0scLDj+vf8RMvAAtk2b7n+PkTWdUGY9h
         n8Bz9OlgvizGeSjPD2l0jihyLasymgLbiiylg8HjHPSbf4JRCVAp7kUvGPZPKTRG63QL
         x/ZXfpHems8oPBI2YlE9ZwLZa2Jw+sJYfoloDd6aUJnry3b8vWSeqx7soceu5Rz7Bt58
         jKZkumA+4/cuT87VnpmTQoyBLeofcuNHgdrjf6RpyLYbaDxFzEtNWz/L7/PrBptQ0nlB
         wj4YkhC/v50oUvwRHWZmopS43cAZLMuKdkXx7i2Nld5vzWsRYe6iJX/bs79xXL7zDWPi
         SDrw==
X-Gm-Message-State: AOAM5311bPB3UnaK4lTvcdAM53Vj+RqVCP9tqapEDAxysEc5E6G9eLwK
	htOf5z8Cu+u1/YoYMSxgX2iP+XZz/nI=
X-Google-Smtp-Source: ABdhPJzLdWjj8yt6xJVvjFXQTPgN2IKr00An/7SWx2hEdF9qroI2MdT/NUegaBQebbHetBvXbJPOoQ==
X-Received: by 2002:a63:7c5:: with SMTP id 188mr42472890pgh.48.1594057684216;
        Mon, 06 Jul 2020 10:48:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:61e6:5be1:19c9:154e? ([2601:646:9200:4e0:61e6:5be1:19c9:154e])
        by smtp.gmail.com with ESMTPSA id u2sm18789007pfl.21.2020.07.06.10.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2020 10:48:03 -0700 (PDT)
Subject: Re: [meta-arm][PATCH] meta-arm: Use dynamic layer magic to build trusted-firmware-m
To: Ross Burton <ross@burtonini.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: meta-arm@lists.yoctoproject.org
References: <20200703145233.2494070-1-raj.khem@gmail.com>
 <70b0c7092890fb9841969d1d0df52b2c9fcccac6.camel@linuxfoundation.org>
 <CAAnfSTvvrndnMZo9s4RwNLLp8iaB3JHuotKgmNgLQVFJKCdmrA@mail.gmail.com>
 <CAAnfSTvZ9GO_hWOJ2Q7=fUQd3EV0b6bVe8T1SdBCwJtrH=4=mg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <8b760e33-101f-3931-147d-c77ca5fac0bb@gmail.com>
Date: Mon, 6 Jul 2020 10:48:03 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAAnfSTvZ9GO_hWOJ2Q7=fUQd3EV0b6bVe8T1SdBCwJtrH=4=mg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 7/6/20 5:30 AM, Ross Burton wrote:
> Update: Richard has merged the fix.  Hopefully that now results in a
> green build!
> 

this does not fix the problem for other distributions which are using 
meta-arm as dependency. this patch would still be better option IMO to 
avoid this dependency when not needed.

> Ross
> 
> On Mon, 6 Jul 2020 at 12:07, Ross Burton <ross@burtonini.com> wrote:
>>
>> On Sun, 5 Jul 2020 at 21:15, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> On Fri, 2020-07-03 at 07:52 -0700, Khem Raj wrote:
>>>> trusted-firmware-m needs arm binary toolchain to build from another
>>>> layer, this is the only recipe thus far and its better to hide it to
>>>> majority users who may not be using trusted-firmware-m and thusly
>>>> meta-arm-toolchain, folks who need to use trusted-firmware-m should
>>>> explicitly add it to layer mix
>>
>> My fault: the layer ordering wasn't quite as important before, but it
>> is now.  Testing a fix to autobuilder-helper now.
>>
>> Ross
