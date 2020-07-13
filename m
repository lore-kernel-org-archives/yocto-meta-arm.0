Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web12.1278.1594660168581467626
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Jul 2020 10:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YQNZQMlc;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id m16so4582567pls.5
        for <meta-arm@lists.yoctoproject.org>; Mon, 13 Jul 2020 10:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GyzHid8kwtK+vg7w6tAeddNBK8sFMlVelBbXkk/JWOM=;
        b=YQNZQMlcWJ6RXirwHY1jTD04rVeKimCd6vRuWHWwyT9iP/Y1+374VrWpaXWVqGs3/A
         tq3AiT33bEhU0CIHGiZJ3B25Q2GZn5f6QaoOiYwlBci5tJOUMXbKfQZH+kAxxH3APnAb
         G5rfXZSRm0+9wnqk+zK5Fv0lu5ZfHk9wLYoaZUZAge/2lh39UBit/9s/18+9bHMSLfew
         skBAF0c4TqW2VUwz38LhiCSHApQ/7Rzcktv4WBkkyUCFVGIGH9rZpEXFhuc0ZOCSyNO/
         U4cFDi2u6sJie2V4qf2cenw+mhpK4PLxyNtanmADPAqiFjv+/A/Ex/I7ff7x8KgyPQ0O
         E28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GyzHid8kwtK+vg7w6tAeddNBK8sFMlVelBbXkk/JWOM=;
        b=sWbVCa7fJ38XaJqgHciQlSU+Kf3XAQco0lU/UjdmyfJfQA5lmmX95XVDFaHjYBlDX6
         Mz1pnES8BB2Eb7TnnjjChEXif0j7q2yhYSx5DyUiLy700la5HrlbqwO8ZgCeJ4xfOKSF
         RaPdkfb3+t55AZHjdRbizETCeFF2Z6AVMwb+w6b+j+ChTFRnZnL0rdU+/4Zrsc6lFti7
         bNDl2h68fJ3Z0oAGUVtAqPq0QDoiGWD2nQwWuZ8oUouA1jgBfmWB5KxFf5xZPHSoJlUC
         cLofsZ47FSMFyab68vu+F1dsDvGeVzr/X4oo/eMyTqtYJZdmKU3rhr3rl7tOSebmmQ5Y
         0FRQ==
X-Gm-Message-State: AOAM531VSXiFtqtg7e/j2HghKddY2qKB5dzkSndusfEFh2eKEKZFB+CI
	sVb3XCpYD6btS04O3mAFldATp+IaALQ=
X-Google-Smtp-Source: ABdhPJxpw0ZJUpRrRp6LhDzpX4KZWpz1Qz8lPt+Dn5IWDgM/JrK2IXpqUOQO+vPeYbSpxuIFvSlnsQ==
X-Received: by 2002:a17:90a:26a4:: with SMTP id m33mr394779pje.124.1594660167690;
        Mon, 13 Jul 2020 10:09:27 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:5886:34b9:1392:15a2? ([2601:646:9200:4e0:5886:34b9:1392:15a2])
        by smtp.gmail.com with ESMTPSA id m9sm149214pjs.18.2020.07.13.10.09.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 10:09:27 -0700 (PDT)
Subject: Re: [meta-arm][PATCH] meta-arm: Use dynamic layer magic to build trusted-firmware-m
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
References: <20200703145233.2494070-1-raj.khem@gmail.com>
 <CAAnfSTsByeHUS9daP_L7M9qF8AhMdPVP9i+ri9b1ZzV8VCkfGw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <78278e53-6dd3-b238-2c9a-6ac3c0757095@gmail.com>
Date: Mon, 13 Jul 2020 10:09:26 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAnfSTsByeHUS9daP_L7M9qF8AhMdPVP9i+ri9b1ZzV8VCkfGw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 7/6/20 2:23 PM, Ross Burton wrote:
> On Fri, 3 Jul 2020 at 15:52, Khem Raj <raj.khem@gmail.com> wrote:
>> +BBFILES_DYNAMIC += " \
>> +    arm-toolchain:${LAYERDIR}/dynamic-layers/arm-toolchain/*/*/*.bb \
>> +    arm-toolchain:${LAYERDIR}/dynamic-layers/arm-toolchain/*/*/*.bbappend \
> 
> What I dislike about dynamic layers is how nested everything gets.
> How about something more like:
> 
> BBFILES_DYNAMIC +=
> "arm-toolchain:${LAYERDIR}/with-arm-toolchain/recipes-*/*/*.bb"
> 
> One less directory level, and all of the dynamic layers are at the
> top-level alongside the recipes.
> 
> I'm also still unsure why there's so much pushback towards adding
> arm-toolchain.  It doesn't do anything by simply adding the layer, if
> you don't build tf-m it won't get used at all, and I want to get rid
> of it anyway (using multiconfig to build a gcc).  Can you explain why
> this dependency is so important to you?  I'm obviously not
> understanding something, and I'm on the record for hating on binary
> toolchains over many years!
> 

So I have added meta-arm-toolchain to distro ( ever to reluctantly ) and 
it did not break anything so I intend to keep that change, therefore 
this patch is no longer required for my usecase and can be ignored.

> Ross
> 
