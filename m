Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.62796.1598905489867924253
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 31 Aug 2020 13:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=cUcsyZOd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id n18so5791580qtw.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 31 Aug 2020 13:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zjX9LCXxEOllQyQC1dS+lzxN79twlVSNQMxpyLlL71I=;
        b=cUcsyZOdISOoGZGyfCF8ylvkK0I69jBfLPsn98UKXT/5CWQFS2uztoAMqP0wpm/YQa
         7upWXS60saOUZWbo9dYPUPmIzHGRtaCdwaYOCSojknaLOxzUFpcuKRgypis1PiiIanKm
         h4RE97aHF7cY5jor7FYa4xxs8wYBHoav2uHczZkT/uFDKi03QKlUaXx+KP+EmtGByJTT
         D8rU0ZAM90G8M9PbKhaLYt+VCF86v0EG770ZfHQljMcE9FLQ8+9nkotniSnOAmlNvh6W
         QqOgjuFxl2BiOGfBJ6+BKyu9H3RpUL7lEZDCpYPAZX3FA0ZMndlBT2aapjAp7r3Xg8HZ
         Ajng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zjX9LCXxEOllQyQC1dS+lzxN79twlVSNQMxpyLlL71I=;
        b=rHnEEUrA4ZP1ecY0r47xIZBwWuq1qK7rOOfpug64kQVu6wIMCAib6ydGTDOOVeFNBf
         7F+OgslZSWDAKy2r8skNyM7Ejp3mNy8AV+QpzYwIrnNfJUtovz5ve0OpOr7IdRnPC+kn
         3o2S2xpOkxU91MpTNwM3P/68J071xd+NVeCEFt6oy9bZD/GFzrWRqUJ2Myg5Q/GAFDuu
         dBo3IsZOo5QMX8V/Ji/+xgvV35/pKhooys2+aBSwYRaA14LT6v2jNmKc6iBMzfmvN515
         HAhRf6ThQOx9o6ZEEy+3jZQWdeeuNMyh8VAT+sUwLTO+ro0XA7nw6C/izvkjF2b9YTeB
         Q0fQ==
X-Gm-Message-State: AOAM531enCmBgN3peYNCjMSERvQg4bg59WYtKlp0xytlIA7QJif5FOvA
	csVQ8vLKrFCdUrr2u2NGGugK9A==
X-Google-Smtp-Source: ABdhPJzJ4XERAcMYOhez3fRF+ObLQN4XQgTolHMxRwJr+jV3U+YIjgAyUvfTDP99zQPCL8230WfM9w==
X-Received: by 2002:ac8:7118:: with SMTP id z24mr3064473qto.294.1598905489015;
        Mon, 31 Aug 2020 13:24:49 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id 71sm10626524qki.85.2020.08.31.13.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 13:24:48 -0700 (PDT)
Date: Mon, 31 Aug 2020 16:24:28 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org,
	nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm: trusted-firmware-a variable name misuse
Message-ID: <20200831202428.GA17615@kudzu.us>
References: <20200825023220.27193-1-jon.mason@arm.com>
 <20200825201141.GA24495@kudzu.us>
 <20200825211032.GT17660@denix.org>
MIME-Version: 1.0
In-Reply-To: <20200825211032.GT17660@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 25, 2020 at 05:10:33PM -0400, Denys Dmytriyenko wrote:
> On Tue, Aug 25, 2020 at 04:11:41PM -0400, Jon Mason wrote:
> > On Mon, Aug 24, 2020 at 10:32:19PM -0400, Jon Mason wrote:
> > > "processes" should be "processed" in trusted-firmware-a.inc, as it
> > > signifies if the relevant part has been installed/processed.
> > > 
> > > Change-Id: I2d1ffbb0c6d14d280b6f9c9cc45c04c7c32409a7
> > > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > 
> > Pulled into master.
> 
> Thanks! Again, sorry for making this typo in the first place :)
> Do you want to backport this to dunfell?

Done.  Also, I pulled back all of Ross's TF-A build race fixes to dunfell.

Thanks,
Jon

> 
> 
> > Thanks,
> > Jon
> > 
> > > ---
> > >  .../trusted-firmware-a/trusted-firmware-a.inc        | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > index 4956c4f..e1cffdf 100644
> > > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > @@ -136,7 +136,7 @@ do_compile_append_aarch64_qemuall() {
> > >  do_install() {
> > >      install -d -m 755 ${D}/firmware
> > >      for atfbin in ${TFA_INSTALL_TARGET}; do
> > > -        processes="0"
> > > +        processed="0"
> > >          if [ "$atfbin" = "all" ]; then
> > >              # Target all is not handled by default
> > >              bberror "all as TFA_INSTALL_TARGET is not handled by do_install"
> > > @@ -150,32 +150,32 @@ do_install() {
> > >              install -m 0644 ${BUILD_DIR}/$atfbin.bin \
> > >                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
> > >              ln -sf $atfbin-${TFA_PLATFORM}.bin ${D}/firmware/$atfbin.bin
> > > -            processes="1"
> > > +            processed="1"
> > >          fi
> > >          if [ -f ${BUILD_DIR}/$atfbin/$atfbin.elf ]; then
> > >              echo "Install $atfbin.elf"
> > >              install -m 0644 ${BUILD_DIR}/$atfbin/$atfbin.elf \
> > >                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
> > >              ln -sf $atfbin-${TFA_PLATFORM}.elf ${D}/firmware/$atfbin.elf
> > > -            processes="1"
> > > +            processed="1"
> > >          fi
> > >          if [ -f ${BUILD_DIR}/$atfbin ]; then
> > >              echo "Install $atfbin"
> > >              install -m 0644 ${BUILD_DIR}/$atfbin \
> > >                  ${D}/firmware/$atfbin-${TFA_PLATFORM}
> > >              ln -sf $atfbin-${TFA_PLATFORM} ${D}/firmware/$atfbin
> > > -            processes="1"
> > > +            processed="1"
> > >          fi
> > >          if [ -f ${BUILD_DIR}/fdts/$atfbin.dtb ]; then
> > >              echo "Install $atfbin.dtb"
> > >              install -m 0644 "${BUILD_DIR}/fdts/$atfbin.dtb" \
> > >                  "${D}/firmware/$atfbin.dtb"
> > > -            processes="1"
> > > +            processed="1"
> > >          elif [ "$atfbin" = "dtbs" ]; then
> > >              echo "dtbs install, skipped: set dtbs in TFA_INSTALL_TARGET"
> > >          elif [ -f ${B}/tools/$atfbin/$atfbin ]; then
> > >              echo "Tools $atfbin install, skipped"
> > > -        elif [ "$processes" = "0" ]; then
> > > +        elif [ "$processed" = "0" ]; then
> > >              bberror "Unsupported TFA_INSTALL_TARGET target $atfbin"
> > >              exit 1
> > >          fi
> > > -- 
> > > 2.17.1
> > > 
> > 
> > > 
> > 
> 
> > 
> 

> 

