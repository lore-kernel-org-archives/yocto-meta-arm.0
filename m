Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web09.4976.1626940914618581920
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Jul 2021 01:01:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=PCMfzgYj;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id u13so7130426lfs.11
        for <meta-arm@lists.yoctoproject.org>; Thu, 22 Jul 2021 01:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eW8r39cR0ydmyL4nMN639YtniH2q769Ht8mTbhoUorE=;
        b=PCMfzgYjTm5e8nuhNkADr2n+UghTufREVR0r4K4ixfRr8zz/fMGOv3BFWLUaNgEUBh
         /XOuCaFJzm1Q/85N1XknUE2rv0qhBTv4iY/5JFmIpjBvzwmm1h8EOX0IC54sgMtSjSq6
         1asOgY7cmMgeWNlUK+glfT+fhkTw37Q94ULeWokGYBChPoB8PnwelRj3VpveaAsMkqWc
         kGeUQGrIOoJR+5tKw4GBouB6uLR9xXAr49hHAs481i7Gtlp6cA001DocwZjPsGE09Ort
         0aX5WWfrRRLWUBHvlxBoeN650qlVbyunWfcI6uvuQjoMyDC4c3nJfgpdYNGuGMNvDiDl
         kohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eW8r39cR0ydmyL4nMN639YtniH2q769Ht8mTbhoUorE=;
        b=m4LFDlp0wFZRTa7T2m2lssgdwJLhC1/jkrf8iCfRIcHP6M3/vSCGA01oUOY5CbvmcE
         3akan/eZ8HbeapCCjDj05ewhg5lqDz19gGEQ2dv7b8Otq4/h/gCKkzArJfj2AuhppNwZ
         qR+L8Cv+xmVLDtvNZUC8pPFyjrapw5U8vK2dI0rlhAZNlFAIAHXsTTzBILFbSByCUxHN
         wE6CRM8SKNtosVBGnv+kdFYpFR/iTx3tj4xuOQNuk/ulh8ePgQIxdraGxEQ9PBC/a6bu
         R0FWwXBFihwaHXvMGFuzm+oxAu8CB9lduGA+Zwe3qNttSJ1qyxPsRH6E4Cyd2zc12hkV
         kmNQ==
X-Gm-Message-State: AOAM530E/wFnwWbn8xPRGuzEV46cAUsr9CXZYklyLzlEOxAprxCvsOnc
	X8vmk10ShibgONsKRbgzH9dTeD+i1kfP99uCaFrE/A==
X-Google-Smtp-Source: ABdhPJxWl0Vkv2KjWr1KDPjB3UF4H1YeKbBV0VXBZPDsqMaNCIgy1ix3fcZfUq2XsVakiIhwYmPvBzMM3hgZknSDPhM=
X-Received: by 2002:ac2:43a6:: with SMTP id t6mr28216285lfl.194.1626940912966;
 Thu, 22 Jul 2021 01:01:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210519074044.3376104-1-sumit.garg@linaro.org>
 <20210520152511.GA12500@kudzu.us> <CAFA6WYNYxagBS15HKGPnJSz=ZOubp7XrM6_g659cYCSmViBWYw@mail.gmail.com>
 <20210720144110.GA16077@kudzu.us>
In-Reply-To: <20210720144110.GA16077@kudzu.us>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Thu, 22 Jul 2021 13:31:41 +0530
Message-ID: <CAFA6WYM+HUH+StF2K58t2ZEP0_y2A2+b7tkPv9rX9mE4hTqmEg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm/qemuarm64-secureboot: Enable kernel TEE drivers
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, Patch Tracking <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Jul 2021 at 20:11, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Tue, Jul 20, 2021 at 11:24:21AM +0530, Sumit Garg wrote:
> > On Thu, 20 May 2021 at 20:55, Jon Mason <jdmason@kudzu.us> wrote:
> > >
> > > On Wed, May 19, 2021 at 01:10:44PM +0530, Sumit Garg wrote:
> > > > Add a config fragment to enable kernel TEE drivers.
> > > >
> > > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > >
> > > Added to master branch
> > >
> >
> > Thanks Jon, can you apply this to the hardknott branch as well?
>
> I had to rework it a little, due to the zone dma hacks ever changing.
> It's in hardknott-next branch and I'll push after it passes CI.
>

Thanks.

-Sumit

> Thanks,
> Jon
>
> >
> > -Sumit
> >
> > > Thanks,
> > > Jon
> > >
> > > > ---
> > > >  meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg      | 10 ++++++++++
> > > >  .../recipes-kernel/linux/linux-yocto_5.10.bbappend     |  5 ++++-
> > > >  2 files changed, 14 insertions(+), 1 deletion(-)
> > > >  create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg
> > > >
> > > > diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg b/meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg
> > > > new file mode 100644
> > > > index 0000000..3de03bf
> > > > --- /dev/null
> > > > +++ b/meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg
> > > > @@ -0,0 +1,10 @@
> > > > +CONFIG_HW_RANDOM_OPTEE=y
> > > > +CONFIG_TEE=y
> > > > +
> > > > +#
> > > > +# TEE drivers
> > > > +#
> > > > +CONFIG_OPTEE=y
> > > > +CONFIG_OPTEE_SHM_NUM_PRIV_PAGES=1
> > > > +# end of TEE drivers
> > > > +
> > > > diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
> > > > index b9995e0..3c3d36a 100644
> > > > --- a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
> > > > +++ b/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
> > > > @@ -14,4 +14,7 @@ SRC_URI_append_qemuarm64-sbsa = " \
> > > >      "
> > > >
> > > >  FILESEXTRAPATHS_prepend_qemuarm64-secureboot = "${ARMFILESPATHS}"
> > > > -SRC_URI_append_qemuarm64-secureboot = " file://zone_dma_revert.patch"
> > > > +SRC_URI_append_qemuarm64-secureboot = " \
> > > > +    file://zone_dma_revert.patch \
> > > > +    file://tee.cfg \
> > > > +    "
> > > > --
> > > > 2.25.1
> > > >
> > >
> > > >
> > > > 
> > > >
> > >
