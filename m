Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web11.9876.1584514760438248650
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Mar 2020 23:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=cgWE/xXj;
 spf=pass (domain: linaro.org, ip: 209.85.216.66, mailfrom: leo.yan@linaro.org)
Received: by mail-pj1-f66.google.com with SMTP id ck23so781060pjb.4
        for <meta-arm@lists.yoctoproject.org>; Tue, 17 Mar 2020 23:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=+y36pF4cqHZz8bYycKf6Ncb0UwtTIFE2RHBPxbS/BFw=;
        b=cgWE/xXjmGpMTmV4mzbdjWNwSXNmOovHMi6g99PFYSvF0/8i9qmV7D6IRI/e2CdcWW
         HZxzvrm7f+g/6ZHPY+NxWhITSvVamDavdqzn4UIp1VdNj+gSSKC7WshAA6VgLULd2kxJ
         Yd1JYUN9vDPGrA0iKXYOcLjert0yaWwwhrfH8A5FM3m97PfAQOBLprKyNpjNXTE6yOGn
         FLQ/F0okq/V/+DxbvgEA5OXBNEPArIgr7oaNbLO8lw7NwaviZwT5nzdUOF/Wm5rNZtrF
         Cmh9hddXvn8/4uUCwi8Erdwhf81ja0+AXS60WAblDN0lBnU9XYcb/0HDHIv0zOYAfR3h
         ARZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=+y36pF4cqHZz8bYycKf6Ncb0UwtTIFE2RHBPxbS/BFw=;
        b=hzHkDrDba00RWMJMCYi4oYRtY7eIEsBOA4acMLaSSH6CfkdlOWsfETddn9U8b//LYx
         rTFWpcmrY9Hw5XhKsov76LPqFN/YZLjQ3UTT/r0mW4+7P4PFWIoMBPzDqAsUJ3Ar0FCx
         NNKDPbGdx68Bjg7HzzylN3Tof+NfWyquIT34vc7+mhPMRuL1lFjkBNOQTW9BEfXVeyA9
         0Ru28MNIFN5KcOc0CoMCqU3+KBIiCU33IkpFFGzI5VI4g8dEGIseoprrP8Mn3vsLQ6u1
         avPxT2B6bNdQunoEguuGIO+zmlE0oXvmWGqSUhriyAvVc8syAw8MncMjqjhLaLsDPKvo
         LwTQ==
X-Gm-Message-State: ANhLgQ0Hy0RDx+vKn73vpBhE1DgnVFgTaB2FELwFdZq+6nrJ+gCsfhuo
	rxn+pY3CJ1F7xsaIAPPEpcZc5w==
X-Google-Smtp-Source: ADFU+vsoTob2FCeCW7hqDTb/xt0NivUcL+J7ozvd/WwYjCUCkTftScq336MMzfKh9X1oTuiZUUm92Q==
X-Received: by 2002:a17:902:b698:: with SMTP id c24mr2449419pls.131.1584514759510;
        Tue, 17 Mar 2020 23:59:19 -0700 (PDT)
Return-Path: <leo.yan@linaro.org>
Received: from leoy-ThinkPad-X240s ([2400:8902::f03c:91ff:fe3f:32da])
        by smtp.gmail.com with ESMTPSA id h23sm5200535pfo.220.2020.03.17.23.59.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Mar 2020 23:59:18 -0700 (PDT)
Date: Wed, 18 Mar 2020 14:59:12 +0800
From: "Leo Yan" <leo.yan@linaro.org>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	nd <nd@arm.com>
Subject: Re: [PATCH v2] OpenCSD: Support for Arm CoreSight decode lib
Message-ID: <20200318065912.GA26235@leoy-ThinkPad-X240s>
References: <20200318042807.32785-1-leo.yan@linaro.org>
 <E61973CF-73E0-478E-B71C-7D94F93999DE@arm.com>
MIME-Version: 1.0
In-Reply-To: <E61973CF-73E0-478E-B71C-7D94F93999DE@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Bertrand,

On Wed, Mar 18, 2020 at 06:52:11AM +0000, Bertrand Marquis wrote:

[...]

> > --- /dev/null
> > +++ b/meta-arm/recipes-devtools/opencsd/opencsd_git.bb
> > @@ -0,0 +1,28 @@
> > +SUMMARY = "OpenCSD - An open source CoreSight(tm) Trace Decode library"
> > +HOMEPAGE = "https://github.com/Linaro/OpenCSD"
> > +LICENSE = "BSD-3-Clause"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=ad8cb685eb324d2fa2530b985a43f3e5"
> > +
> > +SRC_URI = "git://github.com/Linaro/OpenCSD;protocol=http;branch=master"
> > +SRCREV = "03c194117971e4ad0598df29395757ced2e6e9bd"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +COMPATIBLE_HOST = "(x86_64.*|aarch64.*)-linux"
> > +
> > +EXTRA_OEMAKE = "ARCH='${TARGET_ARCH}' \
> > +                CROSS_COMPILE='${TARGET_SYS}-' \
> > +                CC='${CC}' \
> > +                CXX='${CXX}' \
> > +                LINKER='${CXX}' \
> > +                LINUX64=1 \
> > +                DEBUG=1 \
> > +                "
> > +
> > +do_compile() {
> > +    oe_runmake -C ${S}/decoder/build/linux ${EXTRA_OEMAKE}
> > +}
> > +
> > +do_install() {
> > +    oe_runmake -C ${S}/decoder/build/linux PREFIX=${D}/usr install
> > +}
> > — 
> > 2.17.1
> > 
> 
> Would it make sense to have this extending native ? This is a development tool so one might want to use this on his development host instead of the target.
> 
> Just add the following to your recipe:
> BBCLASSEXTEND = "native"
> 
> This would allow to build this for the dev host using “bitbake opencsd-native"

OpenCSD can be built for x86; makes sense for me.

Will do it.  Thanks for suggestion!

Leo
