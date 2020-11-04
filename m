Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web11.11420.1604490049879920332
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Nov 2020 03:40:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=LCceIyUv;
 spf=pass (domain: burtonini.com, ip: 209.85.208.193, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f193.google.com with SMTP id m8so16565109ljj.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 04 Nov 2020 03:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZOQHneucS5tBPJC+n8xj+oVJPeHCoBis8/ZYGxr33N0=;
        b=LCceIyUvH2M/oA7xFVxvQeW1xn7To0Uu2aqpiGdmA/IeIpm3juZocpFFD0vttBDw75
         Q4vrGLf00TsihJyVvJGLOsVeLhBavQB0Z+yqchogRJp0f6bZgBsOR4SICyFqo7jAmEHt
         J7LdWk8jmGziLWiUMANdrJK6eW6ElOaFx4P/taqMjYVTcl7PI3eVdGLXu5sBG4X1Cgb6
         3U8vLd+/68qrxtoYf28UujCTyZkxwGlbhL85+WCYLITGTLdHwTrZa6ZEytlv/csJZATe
         RhA1ONJ5BNPJS1OL/p+TUL73uvvZ2LvpNKJi466bUsfQm0agh9pKqZepgMyTaQBbtlsW
         8cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZOQHneucS5tBPJC+n8xj+oVJPeHCoBis8/ZYGxr33N0=;
        b=Oz34tXP5cVWMLs4AzoxBarYAu7iSLiUL2YcLDGWI/LdvgRrDRou96M4q/ahtp8RAyD
         xvhMwm98jMdZvgUBX4f7O932oRDL4CP2dozhclnd1Y6loMDP/i6KmDeWUaE8GuE/iIBM
         2LLp1MBrvQR1za27393sqL5/gNMiUAHRUkIZaR1nP3rP/93il1NmilxU4ditiVNb7a9Z
         ZMzn/YCgrhhM+L2z4tvpu6mSdNQxbewQYbpZHjRr0KPH6SDrFOxNkc5lVsoe2kWfH1Ru
         vh2Gmqe3yYm5z7AISuRwDSjABhGedXGUzO/b0skbsDgM/1IhmeBs1V8n5rAHibl+rxw7
         AkkA==
X-Gm-Message-State: AOAM5335QcLP2Zg0y/sJsNPjTa0M/qsMTyEQ/TmQ4Y+s3cqnrnBPFblM
	5f7tU5p6VVZja0mOUoG6lg5mXabDfpE5y3cBala2Tw==
X-Google-Smtp-Source: ABdhPJxaP6dgko8vddoUaeg0tVv7TiN+UjBjp8to5umYHeDsQ/ECQzXTdOCpzLzFnvKh+MXrMhv4r8u8I3wb0lbbPCo=
X-Received: by 2002:a2e:b0cb:: with SMTP id g11mr10802501ljl.397.1604490048198;
 Wed, 04 Nov 2020 03:40:48 -0800 (PST)
MIME-Version: 1.0
References: <20201102153341.2844482-1-ross.burton@arm.com> <20201102153341.2844482-7-ross.burton@arm.com>
 <20201104011851.GD19155@denix.org>
In-Reply-To: <20201104011851.GD19155@denix.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 4 Nov 2020 11:40:37 +0000
Message-ID: <CAAnfSTswMSks6ppCkzo37O9Y_VbCSQvrgxU7Y_2wbLWtn4ssRw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 7/7] arm/optee: consolidate common variables
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2020 at 01:18, Denys Dmytriyenko <denis@denix.org> wrote:
> > -EXTRA_OEMAKE = " \
> > +EXTRA_OEMAKE += " \
> >      PLATFORM=${OPTEEMACHINE} \
> >      CFG_${OPTEE_CORE}_core=y \
> >      CROSS_COMPILE_core=${HOST_PREFIX} \
> >      CROSS_COMPILE_ta_${OPTEE_ARCH}=${HOST_PREFIX} \
> >      NOWERROR=1 \
> > -    V=1 \
>
> I noticed verbose building got disabled - any specific reasons?

See optee.inc:

> > +EXTRA_OEMAKE += "V=1 \

Ross
