Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.7404.1594202538667156507
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Jul 2020 03:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DQGRZIIE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id 22so2270127wmg.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 08 Jul 2020 03:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=KY3Vnwd4pQ7FaPozDxW9JxPLMAsMcShleheOhTHUrDc=;
        b=DQGRZIIEk6ODCC5vl3jbLO714IkL7srbzo5Nqtiy4j0mPmotNyTwYMu7EQJr6LpDcu
         owBD7/U05B+UKhc9Ez9wGyEtIiEjooLPuL96mdehWv1dJJrmsQyu98WgCBDZZF7ka9Zr
         uL/O8WiQOr6b++dHj1Re48Tn9Dl9iU2TM1v7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=KY3Vnwd4pQ7FaPozDxW9JxPLMAsMcShleheOhTHUrDc=;
        b=mS6FZ6/2ZUHEGevkWSRCZpcQMe0MRNvWbOuRYRa9yOw0OTSKqkVAFugFy0RtHhuSyE
         cXyKdv9dP05d9zy0C4L/cZiwgr8U/0burU7Ze7mg2s6d1M2jHDAcsBEqGi6aC6uzg4aY
         F/d+JarvDf0oveUknqCTyoxWnpf/kfLWpOXQViH/hRy3BG7NJyKg8s1JtFkjLIULeNWT
         g/C5P+tcGuIRjOHCvlu1iGVhxfZuWPyv7NI397d7Gfjc72OE1+kvE3cjwGhW27Ls+aDK
         lP8s/5NLVkXYOQcyGaJgykbuzvJyL3mNHqaEXw8b5f3+J1g2QqjDHY1B7+zINymlrGvd
         lwAg==
X-Gm-Message-State: AOAM532MtQ6crW9mAcQWB6xRccz4ZO9rVngMC3Iw/W2kUVtK66ugUQnY
	XcAstsPT0kOfp7VgH32ujSCB9g==
X-Google-Smtp-Source: ABdhPJymvhOLc9eOzfrSSWZ4q6hDxizruJ8y6skEqad/9idVIMvpveALnB5nKWzlijWYBFI1XBmHpg==
X-Received: by 2002:a1c:81c1:: with SMTP id c184mr8350284wmd.120.1594202537269;
        Wed, 08 Jul 2020 03:02:17 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id c206sm5547661wmf.36.2020.07.08.03.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 03:02:16 -0700 (PDT)
Message-ID: <7372fed9b3d2942e5b3b2a2e9cce9c3c55fea53e.camel@linuxfoundation.org>
Subject: Re: [meta-arm] [PATCH] arm-bsp: yocto-check-layer fixes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, Jon Mason
	 <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd <nd@arm.com>
Date: Wed, 08 Jul 2020 11:02:15 +0100
In-Reply-To: <CAP71Wjxp9P1T-gKehWz-eio7JD4H8_DhdvorEtiEf37L49cY2A@mail.gmail.com>
References: <20200704154301.15546-1-jon.mason@arm.com>
	 <CAP71Wjxp9P1T-gKehWz-eio7JD4H8_DhdvorEtiEf37L49cY2A@mail.gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-08 at 11:57 +0200, Nicolas Dechesne wrote:
> 
> 
> On Mon, Jul 6, 2020 at 11:39 PM Jon Mason <jon.mason@arm.com> wrote:
> > Changes necessary to get yocto-check-layer to pass
> > 
> > Change-Id: Ie9ea5047ab1344d14a585552277fdbd6b2bc48ab
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > ---
> >  meta-arm-bsp/README.md                                     | 1 +
> >  .../recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend  | 3 ++-
> >  .../recipes-kernel/linux/linux-yocto-arm-platforms.inc     | 7
> > ++++++-
> >  meta-arm/README.md                                         | 1 +
> >  4 files changed, 10 insertions(+), 2 deletions(-)
> >  create mode 100644 meta-arm-bsp/README.md
> >  create mode 100644 meta-arm/README.md
> > 
> > diff --git a/meta-arm-bsp/README.md b/meta-arm-bsp/README.md
> > new file mode 100644
> > index 0000000..490ddca
> > --- /dev/null
> > +++ b/meta-arm-bsp/README.md
> > @@ -0,0 +1 @@
> > +See ../README.md
> > diff --git a/meta-arm-bsp/recipes-core/init-ifupdown/init-
> > ifupdown_1.0.bbappend b/meta-arm-bsp/recipes-core/init-
> > ifupdown/init-ifupdown_1.0.bbappend
> > index 8b5120f..2c5f61a 100644
> > --- a/meta-arm-bsp/recipes-core/init-ifupdown/init-
> > ifupdown_1.0.bbappend
> > +++ b/meta-arm-bsp/recipes-core/init-ifupdown/init-
> > ifupdown_1.0.bbappend
> > @@ -3,5 +3,6 @@
> >  #
> >  # Enable second network interface on startup
> >  #
> > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > 
> > -FILESEXTRAPATHS_prepend_juno := "${THISDIR}/files/juno:"
> > +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> 
> hmm. don't these changes impact the metadata with or without this
> layer added? How can it pass the check-layer script?

I have to admit I saw this patch and was wondering that too. Unless the
recipe is already machine specific in core?

Cheers,

Richard

