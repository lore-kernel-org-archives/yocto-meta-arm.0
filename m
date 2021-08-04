Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.12017.1628096032826868963
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Aug 2021 09:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OZoyZAsn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id l18so2994599wrv.5
        for <meta-arm@lists.yoctoproject.org>; Wed, 04 Aug 2021 09:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=FGdggadqDz+XYPwGyQfq+FqhPscP3xzWz0Yq/82B8mc=;
        b=OZoyZAsnCWo4v58O88BgD+SXoh4NO1vIc9U2xZOphDunBmTW7/vUmO3LkUjsybMJFw
         QuthexCmYYcufhOUwgsndLBYONGeh5itTT5h8oBxu4jXSxEnRRwOTSstGi/xfjpwD6YV
         CP6AMI8uBZkU8GVDibtoZ7UiuTgSKXbvIOqu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=FGdggadqDz+XYPwGyQfq+FqhPscP3xzWz0Yq/82B8mc=;
        b=Iw2vwo6czUIAn/t3vDSKwoP3GgcQZvX6V6DbdHLFeNv8BlzDPggdCON2AOMvrpudxV
         PC6XrYmz0YAX1FAAeNCjSgCL0O/UJMhZhsIClcjC0o9drgmN22J2d5wxDpUoOENB/yOl
         uM9/3eibUWS3ht8fhQ8FIdwPbEkbFfDIjz6rcJJSG5Gha0bShiuiNRgnRkRWldZVYCdW
         NvaGNSN8bTsNmDudsyH0iMm4n6GTkz1KfwaYcENiwY8x3dIi9sYndvmi6kyd1BRZ1kYG
         9OunD2L4kSJz6uLKoJYc1S5WvgGjbQruQbGWtvz2z5UC2Aw5msfF7VbkJpYS0ccPRTbK
         +w2A==
X-Gm-Message-State: AOAM53105Ajci2ukZ41nqw7PoyGMWDmWSsYHGRD057aqtZc4mF9r+Aoz
	98kRQBZWKIlNFD0s8z8Dk4h9Eg==
X-Google-Smtp-Source: ABdhPJx2vpzBFD3ysodbKVE1ihY0JQjNVGZn86ai/T3GChFhAZWsQFVNg1y+FJghdBfegb+5Lvsciw==
X-Received: by 2002:a05:6000:10d:: with SMTP id o13mr343411wrx.88.1628096031002;
        Wed, 04 Aug 2021 09:53:51 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa? ([2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa])
        by smtp.gmail.com with ESMTPSA id v6sm3039802wru.50.2021.08.04.09.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 09:53:50 -0700 (PDT)
Message-ID: <662b6aa477fb2f082fe19b66dd945a20b540a723.camel@linuxfoundation.org>
Subject: Re: [meta-arm] [PATCH 0/3] Convert to new override syntax
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jon Mason <jdmason@kudzu.us>, meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>, Denys Dmytriyenko <denis@denix.org>, 
 Sumit Garg <sumit.garg@linaro.org>, Nicolas Dechesne
 <nicolas.dechesne@linaro.org>
Date: Wed, 04 Aug 2021 17:53:49 +0100
In-Reply-To: <20210804164145.1556-1-jon.mason@arm.com>
References: <20210804164145.1556-1-jon.mason@arm.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-08-04 at 12:41 -0400, Jon Mason wrote:
> In an effort to get this out ASAP, I'm bypassing Arm's internal review
> process.  So, there could be bugs in here or other stupidity on my part.
> 
> I have run this through Gitlab CI.  There are still a few tests not
> passing, which I believe are unrelated to this change.  Specifically,
> * check-layers no longer passes

That might be:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=356137bcf23eabaacbefddf265edb638e0f3fe1d

which has an option you can add.

> * corstone500 perf is not building
> * meta-zephyr machines are throwing errors implying that meta-zephyr
>   doesn't have the new override syntax fix
> * gem5-arm64-xen throws an error implying meta-virt doesn't have a fix
>   either
> * juno throws an error related to a new 5.4 kernel causing a patch not
>   to apply
> 
> Everything else is working and qemu based machines pass testimage.

Thanks for getting this sorted!

Cheers,

Richard

