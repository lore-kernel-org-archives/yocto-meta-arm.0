Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.4037.1626760474599790857
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Jul 2021 22:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=BHWO0WOW;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id u13so34041530lfs.11
        for <meta-arm@lists.yoctoproject.org>; Mon, 19 Jul 2021 22:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jNl7HYcHydcw24a6wudPSUe+GkXTkTq9X13jqcm1Sy0=;
        b=BHWO0WOWIkZTCQ758eRvFh6qybEwpeLF89SARy+7g+c0rR+KV/9AxKfWoffLuYGaAA
         zqVcgaO7Xk/aL0sOZocOuY1FXtXjHbvZ7YDTMZAjTKktX2T+BAl9VPMS/flYYXNm5jfR
         cltcmUM2tBwZxz/9V4LMhPDV/6D8k57X5tw9TPNR7Rl9315TRG5i0MFsRuN347pd8PL2
         tvlvvvRE17a5Ct6at/AA3OeTGeoeuaNZQn/XTeRje8qFw/YiCWmjoIjqaHDGeZEa0Tu4
         wnaX7JMo/MnBt3Lplb+Wk9KYC/LA1p4/RkHtFHE4cOHB80Nru9nwq+gxVqEjmPpyg80W
         fwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jNl7HYcHydcw24a6wudPSUe+GkXTkTq9X13jqcm1Sy0=;
        b=Xl/RKy8EEyHCX1/bKTYcnrn4ZyvL4drbSO2c/nxIV0rjxz8E/bATbr734Yv7knZhaw
         FObM0Uri60H8OfrYUIGJXOvAVUuZqXZFY1o2ulGF72SA9Kys3xkqK0mlp1xLC9ql/EXH
         J9Gl01apsU71Ba2FwQy/KStohdW/u6nU+zu0T1jLSOl5IL6Wf1luswLfnLAXmrocfHvO
         fZEt4UZaczWr6BVYrxZ/qjlIexXGSlMhPXmgqyJ0GiwUx+YqdCf19IVhNYjsF1oo3CSb
         V0VYMzCfDuT0o8cLpbJXZq/MRPW0+mYUBPL9omd6HlthQySLJ8lk4Eil7sqwU8MzhbcC
         CSOw==
X-Gm-Message-State: AOAM533BdLF7WCi9k4xIeig7te95WB8Y8KVD25SC3pvx5U3Dqd9oBK/l
	LpJzBoMSA35oR5fkrnN4+UuZf8OKP8lZtXjZAzyJyg==
X-Google-Smtp-Source: ABdhPJxqX6/PGTP4KWzKAZrZ/Jk7QJGXBJ29+8rFuPJps6mraTvA70EjQvIsr+RMopfhcvcZ7agcsRMPti4r6AVd08A=
X-Received: by 2002:a19:c757:: with SMTP id x84mr20858757lff.302.1626760472732;
 Mon, 19 Jul 2021 22:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210519074044.3376104-1-sumit.garg@linaro.org> <20210520152511.GA12500@kudzu.us>
In-Reply-To: <20210520152511.GA12500@kudzu.us>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Tue, 20 Jul 2021 11:24:21 +0530
Message-ID: <CAFA6WYNYxagBS15HKGPnJSz=ZOubp7XrM6_g659cYCSmViBWYw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm/qemuarm64-secureboot: Enable kernel TEE drivers
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, Patch Tracking <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 May 2021 at 20:55, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Wed, May 19, 2021 at 01:10:44PM +0530, Sumit Garg wrote:
> > Add a config fragment to enable kernel TEE drivers.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
>
> Added to master branch
>

Thanks Jon, can you apply this to the hardknott branch as well?

-Sumit

> Thanks,
> Jon
>
> > ---
> >  meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg      | 10 ++++++++++
> >  .../recipes-kernel/linux/linux-yocto_5.10.bbappend     |  5 ++++-
> >  2 files changed, 14 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg
> >
> > diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg b/meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg
> > new file mode 100644
> > index 0000000..3de03bf
> > --- /dev/null
> > +++ b/meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg
> > @@ -0,0 +1,10 @@
> > +CONFIG_HW_RANDOM_OPTEE=y
> > +CONFIG_TEE=y
> > +
> > +#
> > +# TEE drivers
> > +#
> > +CONFIG_OPTEE=y
> > +CONFIG_OPTEE_SHM_NUM_PRIV_PAGES=1
> > +# end of TEE drivers
> > +
> > diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
> > index b9995e0..3c3d36a 100644
> > --- a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
> > +++ b/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
> > @@ -14,4 +14,7 @@ SRC_URI_append_qemuarm64-sbsa = " \
> >      "
> >
> >  FILESEXTRAPATHS_prepend_qemuarm64-secureboot = "${ARMFILESPATHS}"
> > -SRC_URI_append_qemuarm64-secureboot = " file://zone_dma_revert.patch"
> > +SRC_URI_append_qemuarm64-secureboot = " \
> > +    file://zone_dma_revert.patch \
> > +    file://tee.cfg \
> > +    "
> > --
> > 2.25.1
> >
>
> >
> > 
> >
>
