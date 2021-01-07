Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web09.8561.1610027799044081217
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Jan 2021 05:56:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=NbIq4LOt;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id m25so14620135lfc.11
        for <meta-arm@lists.yoctoproject.org>; Thu, 07 Jan 2021 05:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PY1bw90h+eTSzjMua72p0qMeoI47MoK3bIblV1Q2ex4=;
        b=NbIq4LOtq3NPzxmAFo885WAtnFGF1gZFo4LbzdFf1AF+dcWxVnZ6evqwVWXlMjG3g4
         IkkbbIRbh9wgAWU4mSJcVjo7Ht2+QA7BEpO+OvO9nm+KekW51kFiKNqVaF2OrSso0CBh
         34LkmS5YPcvmDJk8r7ft8D/oemRadfcP9e8yZCWAY/vLa4PgaYYTJMFF+uUG/6sb7TKe
         o2djBjqiHeACTFMhpAuV11jGY0gEG7ULtjuz5g/Kil11QE+12o/B22gonNWNUyPFUhEB
         nVu9c8r8AnUAsqi8UOzr4zxKTgnee2WnilcrJNiOBDs+iGnxa5HZS0C+lil4hzXSr0ky
         mq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PY1bw90h+eTSzjMua72p0qMeoI47MoK3bIblV1Q2ex4=;
        b=K9UeObqHVsJ6mXTB3dlmt9lA1lJCX+55NsMeaWTq/SYRtJQwvFBWr/CwqVG6oDNnMp
         XQY8xmm5ahNDAJqEbIn5eTmlY5ouYUc1O0l7YyjGQqfQAtZ7R0DESnZpKy+KqF+jdU9K
         mGZF0OwqNXp+qKhOeBseG4nt5J9WeRB2v95Fvk5oi0MD+sJxLyrmB6hHr4cThRAdRAng
         3tkVM+2D+T7vXBbR0nB0U5LuMht42mSev2N1RpEJqZeCcvEqZn82Hk/UbQWy9crrTTWk
         AUQBNRpI51fSLwF7QPx75gK66gCBsfN5IV8NaqMdoLEpx/O7KGg7vNGw7sCy6lt+GWqu
         ivIg==
X-Gm-Message-State: AOAM530zgalO6UQmOmiEk09USkNMgRV70ERK5YQHp5FgM4FklhFVh1bf
	vt6cZq/TSiTFaEAgaYyKHAqjJ3kTPoeCVcTRzudflA==
X-Google-Smtp-Source: ABdhPJzATlNfABeiZJckO9a8yVZ5b3aDtYHMZ6HwLLZG5I/VfO3ogY+EB4MuQ1iHC0hxoCCK9d2JQANJRUbXLKaXdqQ=
X-Received: by 2002:a2e:2242:: with SMTP id i63mr4200392lji.343.1610027795538;
 Thu, 07 Jan 2021 05:56:35 -0800 (PST)
MIME-Version: 1.0
References: <20201209160139.GF12460@kudzu.us> <16507BD31EF07BD0.20968@lists.yoctoproject.org>
In-Reply-To: <16507BD31EF07BD0.20968@lists.yoctoproject.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Thu, 7 Jan 2021 19:26:24 +0530
Message-ID: <CAFA6WYMvv7bD-fE08VL5gGODCJJzVrMuj+Pu2T-uXZPPdEtBzg@mail.gmail.com>
Subject: Re: [meta-arm] meta-arm-toolchain updates and removal of legacy versions
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Jon Mason <jdmason@kudzu.us>, Denys Dmytriyenko <denis@denix.org>, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Hi Jon,

On Mon, 14 Dec 2020 at 10:16, Sumit Garg via lists.yoctoproject.org
<sumit.garg=linaro.org@lists.yoctoproject.org> wrote:
> On Wed, 9 Dec 2020 at 21:31, Jon Mason <jdmason@kudzu.us> wrote:
> >
> > Hey Sumit and Denys,
> > We are in the process of updating recipes for the meta-arm hardknott
> > release.  The intention of doing so early is to give everything
> > sufficient time to soak and test (and downstream users time to complain
> > if we break them).  To this end, I see that there are updated versions
> > of the external toolchains, and I wanted to know:
> >
> > 1.  Is anyone currently working on updating the recipes to the very
> > recently released version
> > (https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads)?
> >
>
> There are two ways to use GNU-A Arm toolchain in OE:
>
> 1. As pre-built external toolchain
>
> -> Ideally the latest 10.2 release should work out-of-box without any
> need for changes but requires testing.

Pre-built GCC 10.2 toolchain works pretty well after this minor fixup [1].

[1] https://lists.yoctoproject.org/g/meta-arm/message/1590

>
> 2. As built from source
>
> -> This requires support to be added for 10.2 release. I would like
> this support to be added but currently I am busy with some other high
> priority work and I could try to schedule this work next month. In the
> meantime, contributions are pretty much welcome and I would be happy
> to review patches and provide feedback.

This [2] patch adds support for GCC 10.2 toolchain release built from source.

[2] https://lists.yoctoproject.org/g/meta-arm/message/1586

>
> > 2.  Are there any plans to remove the versions that are no longer
> > in-use/supported?
> >
>
> I would be in favor of removing older toolchain version support from
> master branch. As we should always try to use the same or closer major
> version to the OE base toolchain and there's always a possibility of
> breakage while using an older toolchain with the OE master.
>
> >
> > Everyone else,
> > Related to #2, what versions are people using that they would like us
> > to keep (or add if not currently present in meta-arm-toolchain)?
> >
> > I don't want to break anyone or remove useful functionality, but I do
> > have concerns that there could be uncorrected GCC CVEs present in
> > older toolchains, and by continuing to make them available, we are
> > enabling this exposure.
> >
>
> Agree, let's wait till beginning next month. If we don't hear any
> requirements for the older versions then I will go ahead and remove
> them.

This [3] patch drops support for legacy 8.x toolchain.

[3] https://lists.yoctoproject.org/g/meta-arm/message/1587

-Sumit

>
> > Thanks,
> > Jon
>
> 
>
