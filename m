Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.5253.1591338282957887662
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Jun 2020 23:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VdufE29Q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id d128so7880313wmc.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 04 Jun 2020 23:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=RpZ1hFCEUqaXuKvBG/dGd0WSZNK9pDz3Z/3Jv39a960=;
        b=VdufE29QC6CAUHxRxFaKI+XUhVwtEalpWWCx3FegU8FwasMeacty5kNYkIet0gnyOG
         aW3YeFkSZaCDJZdE3R2oQLSp8MrxoqPti5ebtGRc8YMG7/GASGewKtfwXnox+vJ3n8hn
         5LWyLM9cN1Z6GSbzfDFbySB209fbeIEGBYF2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RpZ1hFCEUqaXuKvBG/dGd0WSZNK9pDz3Z/3Jv39a960=;
        b=ajXyMBgXqtJc3wPf/mv4B2TZEBQHQPEzXAQai6p8wgYW63onzav62/kJLj1g22gWq5
         7TdwhXInknxcE+UZeIWWAxSKhW+ldBBC/5MJR1RWg3ESz8S8CwxZm2fpGW9QZFPKGOI2
         EiDrQLY/eidgck+t/bUbOVv1Cu0KxQIRXFVWBEPNhO6eTjiN6I7S2igHR57rx1dI/kRt
         HVXlAfFzAA5/qrDqhi89OHM0YZU6z1JpDd8hm+GzxJ7fwZcNBuBfDgTGYgQPDnKt++n6
         1jqWypdLe1S/nORheWqyjMiGrKbwWcenmkzJVeagiU4pOi3bnSfu3uriFh6qlLMrojlf
         F3ow==
X-Gm-Message-State: AOAM5327OOoAeIAc3AXwYH/ADdzEpRk67ZK0KmH8JfIy0XQUfoVvndKy
	dkU7UKh+mh+gN8RohlQUZRdz4A==
X-Google-Smtp-Source: ABdhPJwxDJ3kAOGrkowfmx7llwWY8aOBOLGwk+Spc35PCyua0vrMR6LOYKqnAQ7ZQ7Irocc5pL1VKQ==
X-Received: by 2002:a7b:c0c8:: with SMTP id s8mr1114090wmh.134.1591338281418;
        Thu, 04 Jun 2020 23:24:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id l17sm9473010wmi.3.2020.06.04.23.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 23:24:40 -0700 (PDT)
Message-ID: <a29c212701e775eba31176cba697fdb30ba0c96a.camel@linuxfoundation.org>
Subject: Re: [meta-arm] [PATCH 0/4] external-arm-toolchain: Add support for SDK generation
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>, Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, pbarker@konsulko.com, wmills@ti.com, 
	daniel.thompson@linaro.org
Date: Fri, 05 Jun 2020 07:24:39 +0100
In-Reply-To: <20200604231042.GI17660@denix.org>
References: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org>
	 <1615797D4B360D3B.26163@lists.yoctoproject.org>
	 <20200604231042.GI17660@denix.org>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-06-04 at 19:10 -0400, Denys Dmytriyenko wrote:
> On Thu, Jun 04, 2020 at 07:00:14PM -0400, Denys Dmytriyenko wrote:
> > On Tue, Jun 02, 2020 at 04:34:50PM +0530, Sumit Garg wrote:
> > > Patch #1 and #2 adds impprovements in external-arm-toolchain
> > > recipe in order to
> > > support SDK generation. SDK generation has been tested using:
> > > 
> > > $ bitbake core-image-base -c populate_sdk
> > 
> > This just ensures that external-arm-toolchain doesn't get in the
> > way of SDK 
> > generation by avoiding any conflicts. The only re-use here is
> > glibc. The rest 
> > of pre-built Arm toolchain gets thrown out and rebuilt from sources
> > - gcc, 
> > binutils, gdb/gdbserver are all built from sources as TCMODE was
> > not set and 
> > falls back to "default". Sure, pre-built Arm toolchain doesn't
> > provide all 
> > possible SDKMACHINE binaries, but for 90% cases of x86_64, there's
> > very little 
> > re-use...
> 
> And I wonder is the resulting SDK was even tested:
> 
> $ . environment-setup-armv7at2hf-neon-oe-linux-gnueabi
> 
> $ arm-none-linux-gnueabihf-gcc -o hello hello.c 
> hello.c:1:10: fatal error: stdio.h: No such file or directory
>     1 | #include <stdio.h>
>       |          ^~~~~~~~~
> compilation terminated.
> 
> $ arm-none-linux-gnueabihf-g++ -o hello++ hello.cpp 
> hello.cpp:1:10: fatal error: iostream: No such file or directory
>     1 | #include <iostream>
>       |          ^~~~~~~~~~
> compilation terminated.

If you've done "bitbake core-image-base -c populate_sdk" to build it,
you can do "bitbake core-image-base -c testsdk" to test it as we have
basic automated QA tests for that.

Cheers,

Richard






