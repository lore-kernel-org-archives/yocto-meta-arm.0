Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB39C433EF
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 09:24:34 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.4516.1641288273662677050
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jan 2022 01:24:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bLvLXk56;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 v10-20020a05600c214a00b00345e59928eeso15786330wml.0
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jan 2022 01:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=zES/tK4L1GfACVNbc9p87h1x84+XJh2u85UuEjDt6l8=;
        b=bLvLXk56iWRr4k2Jh6g49jibGK1qENM3I3RFDCmxLEKEtjrelSwbrNqF+Lyh13ey7N
         rNqeandWcMUPpaG5I3BfkHLGtcVedC53PxrA3tyCHk7n0ZL79mmIWmC5LtnBHQ1ZuZuh
         QoYuGccXPf9LS+jYROA/54QTYhK5S8Q1FuZSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=zES/tK4L1GfACVNbc9p87h1x84+XJh2u85UuEjDt6l8=;
        b=QyexRAErqwZwzJQ8exKf4O6QAJeRzxEwgFVpSylYnC8/tH9Gb4junliMMbTYYP2H9e
         Jxefs+dE6EFj5W5FqvUHfVWbYystASZw4NR5YZskYGsuYFV/lHynpB/Vk3idwjejgDky
         Lp4jW5BZfuRKXxZHjgM/b+XcEMWXeKjqpp7LwFHfpLRfs8osswYn0FLayLJ0n8WO6fT+
         nfrGzndwF0u7WIyka84wgt7kHnob55NVgYY4gveVqErwYARcf0fe2H4E1glW4xtoRJb8
         eFXFIM9HSKCsUg5X7yVmR66jpF3p0xu6tAf9j+XzWsBe9MBfGq+pya3TUVS17flSebN6
         Mg6A==
X-Gm-Message-State: AOAM5311fJHfoXX78en6XzCNxktJnVf7X4Cx1vYZqwtusSYYFEmZdsSV
	bHmxC+tTSr0Vw72e68ghRfQh3w==
X-Google-Smtp-Source: 
 ABdhPJyU4Q7y9Dg/npy5M4MbO5yz2Tr4fY9wkI7XlSgPMOLtb3p8sIQZVmySwH4Io/QQeFq6z8hXJQ==
X-Received: by 2002:a1c:1b15:: with SMTP id
 b21mr41753846wmb.174.1641288272060;
        Tue, 04 Jan 2022 01:24:32 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:da22:f51:54c3:4a4f?
 ([2001:8b0:aba:5f3c:da22:f51:54c3:4a4f])
        by smtp.gmail.com with ESMTPSA id
 i8sm47034104wry.108.2022.01.04.01.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 01:24:31 -0800 (PST)
Message-ID: 
 <283cdfc898038fee9465d4f24bd0113ec712dbb1.camel@linuxfoundation.org>
Subject: Re: [meta-arm] building gcc-arm-none-eabi from source
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: meta-arm@lists.yoctoproject.org, Stefan Herbrechtsmeier
	 <Stefan.Herbrechtsmeier@weidmueller.com>
Date: Tue, 04 Jan 2022 09:24:29 +0000
In-Reply-To: 
 <CANNYZj8tSvxroUxXHk0nZBp80o2D13vEizHVaSkn6D2AUizdKw@mail.gmail.com>
References: 
	<CANNYZj-5B_GUxmYUagqeEtJjDM3iyn0p26Xb6djnEUd1rPAv4w@mail.gmail.com>
	 <5f41546b0c3c904e9e5cca962fda4c6b48b5ee93.camel@linuxfoundation.org>
	 <CANNYZj8tSvxroUxXHk0nZBp80o2D13vEizHVaSkn6D2AUizdKw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jan 2022 09:24:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2776

On Tue, 2022-01-04 at 08:55 +0100, Alexander Kanavin wrote:
> On Mon, 3 Jan 2022 at 23:27, Richard Purdie <richard.purdie@linuxfoundation.org>
> wrote:
> > Can't you just use the normal OE gcc compiler with the right flags passed in
> > to
> > disable the auto library pieces? or if that doesn't work, use an OE built
> > baremetal compiler?
> > 
> 
> 
> The normal compiler would then no longer be suited for native compilation on the
> target, right?

I was wondering if you could use the normal compiler but just with some extra
flags, e.g. -Wl,-nostdlib to disable the standard libraries. You could use
wrapper scripts around the standard toolchain if needed and the extra options
were problematic. There isn't a huge difference between the target
compiler/linker and the baremetal one.

> The baremetal compiler would have to be set up in a cross-canadian fashion -
> existing cross-canadian pieces cannot be used as they're made for SDK builds.
> I'm not sure how to do it without making multiple copies of the recipe for each
> canadian target, and then having to support and update them in a private layer.
> 
> Basically both options seem worse to me from maintenance and testability
> perspective than just building the vendor toolchain from source, but maybe there
> is something specific to them I'm not seeing?

It is true that you'd need a different target variant for the second option I
mentioned.

I did have something slightly similar with extensions to the gcc/binutils
recipes for a cross AVR toolchain that runs on an arm target. I found some
copies here, based on daisy which whilst old, gives the idea:

https://git.yoctoproject.org/poky-contrib/commit/?h=rpurdie/daisy&id=f58f90257a5af3e6b6974090e62cad9d90d53ae5

I definitely have something more recent locally too (pyro, can't remember if I
made it to dunfell with that code), I can dig that out if it is interesting. I
thought somewhere I had a BBCLASSEXTEND recipe which added multiple cross
compiler arches on target but I can't find that one :/.

Cheers,

Richard



