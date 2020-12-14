Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.30454.1607921212981266602
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 13 Dec 2020 20:46:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=PD9+viD2;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id r24so26847729lfm.8
        for <meta-arm@lists.yoctoproject.org>; Sun, 13 Dec 2020 20:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GQBsIF8Fpy6QwmChAsvCEAZMb3WqO6Iu8BA4TnYEMWU=;
        b=PD9+viD2soKUoUjHMDugLMUldmpe5ZehAXQMxDufalkVh0JuMAhn+SZdayQVeSTnld
         q8NgmYTkt1wGwc5pH0JwDbbfDDreNZfykfRTI11fB2xs+BXOcQjQq0IPzl4ICIg6isPl
         bU6GCVIUcIuUbvKh6eDzZIzMP9SLD7XISSizuCtWtr3ubBskIuEgvPdPLwSiv9KRbbqL
         L+qWEdIrW5hQ1iVHtH8FLfbH2tNiFWkFaj47uGMyQ3MbHvnkHZI6COntIN+pbzmFQY0h
         8cesITkDKqhTpa27HQNAGRafBMsfbhwhXV/bTCm2Qfp8zslgjuOMtFvsMjBR+7cG5Mld
         34iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GQBsIF8Fpy6QwmChAsvCEAZMb3WqO6Iu8BA4TnYEMWU=;
        b=PMb5qKMUGKyuOfHZaTBpqLlUwcAliiu90dA2aTQnLScdG74py7ZZ9ptPXJ6D5sTirV
         6zxpd4HDzSl+QkhNW1FSXaFOw/TxRCxJYLpuHQHJwzPZOu7U8Isf3WQsTTge2IojOenO
         i0CZZAJXB164/vsyvmRDvdIEpIdoEYTHMkGrA3YyBF6BPvBNNW6tIreVKV/eCWMNpALx
         CwVg9/A8SC9P61vtMswUYH1/dHfbmR6YIUKonyz0k8obgViwWuZ3dJoxpXMd496ULm0k
         W3fcbBPevYhgK/wnLTHVBvnDLEMx7NAmZpbFlWBikIoqxm0lnFaQwV+HyMi8MyWxn84P
         jQ5A==
X-Gm-Message-State: AOAM532TIWlWuW5xF6i5r4OWJmh+xYalLYp4r09HIPqQIy1t3qSdnJR1
	h7bcpgLjgzjgUbDMPbEUm1+BWasjzTU5PrzUkWlOHw==
X-Google-Smtp-Source: ABdhPJzuMjwNQpfqcqeur4RN88HbY2B/tOj4aR5x+bps05JENM0KUkpsU3wN1u4Ccd7aRh3AF5CcBy+6/8uRw3q7Mqw=
X-Received: by 2002:a2e:961a:: with SMTP id v26mr10333248ljh.314.1607921210313;
 Sun, 13 Dec 2020 20:46:50 -0800 (PST)
MIME-Version: 1.0
References: <20201209160139.GF12460@kudzu.us>
In-Reply-To: <20201209160139.GF12460@kudzu.us>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Mon, 14 Dec 2020 10:16:39 +0530
Message-ID: <CAFA6WYPu-DQseJV+X_TXKPoTx4PSSyK+iXzouXjNLTU10_fo=Q@mail.gmail.com>
Subject: Re: meta-arm-toolchain updates and removal of legacy versions
To: Jon Mason <jdmason@kudzu.us>
Cc: Denys Dmytriyenko <denis@denix.org>, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Hi Jon,

On Wed, 9 Dec 2020 at 21:31, Jon Mason <jdmason@kudzu.us> wrote:
>
> Hey Sumit and Denys,
> We are in the process of updating recipes for the meta-arm hardknott
> release.  The intention of doing so early is to give everything
> sufficient time to soak and test (and downstream users time to complain
> if we break them).  To this end, I see that there are updated versions
> of the external toolchains, and I wanted to know:
>
> 1.  Is anyone currently working on updating the recipes to the very
> recently released version
> (https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads)?
>

There are two ways to use GNU-A Arm toolchain in OE:

1. As pre-built external toolchain

-> Ideally the latest 10.2 release should work out-of-box without any
need for changes but requires testing.

2. As built from source

-> This requires support to be added for 10.2 release. I would like
this support to be added but currently I am busy with some other high
priority work and I could try to schedule this work next month. In the
meantime, contributions are pretty much welcome and I would be happy
to review patches and provide feedback.

> 2.  Are there any plans to remove the versions that are no longer
> in-use/supported?
>

I would be in favor of removing older toolchain version support from
master branch. As we should always try to use the same or closer major
version to the OE base toolchain and there's always a possibility of
breakage while using an older toolchain with the OE master.

>
> Everyone else,
> Related to #2, what versions are people using that they would like us
> to keep (or add if not currently present in meta-arm-toolchain)?
>
> I don't want to break anyone or remove useful functionality, but I do
> have concerns that there could be uncorrected GCC CVEs present in
> older toolchains, and by continuing to make them available, we are
> enabling this exposure.
>

Agree, let's wait till beginning next month. If we don't hear any
requirements for the older versions then I will go ahead and remove
them.

-Sumit

> Thanks,
> Jon
