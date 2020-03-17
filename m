Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web11.6253.1584452730356733544
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Mar 2020 06:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=b05EvMd/;
 spf=pass (domain: linaro.org, ip: 209.85.214.196, mailfrom: leo.yan@linaro.org)
Received: by mail-pl1-f196.google.com with SMTP id t3so9639462plz.9
        for <meta-arm@lists.yoctoproject.org>; Tue, 17 Mar 2020 06:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Xaauq4PXYYJxUB4zpVq4+oQ/qQxxI+PrY7FicjUsyvU=;
        b=b05EvMd/RDdyGx2Chg5iXA8ou1sMXpe84Eu11MwSzsyQ50/bYB/AMXtprN0qiLTrad
         lK/rFV/v1Fk5PWbDecu6FZ5hzd+aZRCIg+F9p48lfPBW9628a6JyMmkWFGz02ufOg13F
         QhlqFdZGbs26vQitNn9kKjuXkHFUvzClstF6Swu/qJeoIBd2sB3rZ9c9vCpHuAnMNfRn
         bCRQEszgOxImA9HFd7Dvtk8AedJSY10K1O68Tz5n24GkonRLWA3VJsLVOxm9J1IQjCLB
         WkODbVo4MjtiU8xrhigLxiQ21+jyc30pgRywRS66BbXc8tIiqgBU+mBH2pUBkn4GghRf
         bnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Xaauq4PXYYJxUB4zpVq4+oQ/qQxxI+PrY7FicjUsyvU=;
        b=cHZ4AVWX8QVToXkKTIUWrzTyJwLKkaXj7WsA1WjuXnISZd6F72Uudzx9/qfNjav0ET
         7ctGd8k5lM+5Zq3B0+AMmMojLp/YF8uPGtARRnJM3IYbcq7wQFnOLZmJzBxee1c7fkp/
         IZ5t9TH32/vDS4WWeswMoZUOHbxAgmXOmVXnWhsjniyPEzosWFWloZmbe5nrIdra57Iy
         8tJiBCQpMaG15L5QPm8v74gaxGDqVDluj+i7CC3h7j3WGs70ZDnn2/Kh4h464h3oGnQ+
         STNc/HgIgIBCD8KT6iOSMK9gxYi68vlWfRr2jUH8sZhV3Zje8qGhmQKYHaQsAY5FLZEA
         CjAA==
X-Gm-Message-State: ANhLgQ0eaAcLG6eEFNT/jse6CTP3+inNX8I2t3tPaHWVdsI6osyqHzrw
	NSX3dUud2iGks7emsTv1FTfkskH6w+bFaj+W
X-Google-Smtp-Source: ADFU+vtC+XpnNMyqIWMNPXkMBlfAABjkILEb0ziSdc9p7pkzpGoDkozJ00A2sGyxb3hBokEdLAQTQQ==
X-Received: by 2002:a17:90a:9501:: with SMTP id t1mr5531834pjo.108.1584452729488;
        Tue, 17 Mar 2020 06:45:29 -0700 (PDT)
Return-Path: <leo.yan@linaro.org>
Received: from leoy-ThinkPad-X240s ([2400:8902::f03c:91ff:fe3f:32da])
        by smtp.gmail.com with ESMTPSA id e30sm2962430pga.6.2020.03.17.06.45.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Mar 2020 06:45:28 -0700 (PDT)
Date: Tue, 17 Mar 2020 21:45:21 +0800
From: "Leo Yan" <leo.yan@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Leo Yang <Leo.Yang@arm.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH v1 RESEND] OpenCSD: Support for Arm CoreSight decode lib
Message-ID: <20200317134521.GC14560@leoy-ThinkPad-X240s>
References: <20200306023720.24723-1-leo.yan@linaro.org>
 <D89CBCAF-1ED4-4579-A899-809FD9C83502@arm.com>
MIME-Version: 1.0
In-Reply-To: <D89CBCAF-1ED4-4579-A899-809FD9C83502@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 17, 2020 at 01:40:23PM +0000, Bertrand Marquis wrote:
> 
> > On 6 Mar 2020, at 02:37, Leo Yan via Lists.Yoctoproject.Org <leo.yan=linaro.org@lists.yoctoproject.org> wrote:
> > 
> > Also create a new folder recipes-devtools under meta-arm to place
> > this recipe.
> > 
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > ---
> > .../recipes-devtools/opencsd/opencsd_git.bb   | 28 +++++++++++++++++++
> > 1 file changed, 28 insertions(+)
> > create mode 100644 meta-arm/recipes-devtools/opencsd/opencsd_git.bb
> > 
> > diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_git.bb b/meta-arm/recipes-devtools/opencsd/opencsd_git.bb
> > new file mode 100644
> > index 0000000..0c3b483
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
> > +    ( cd ${S}/decoder/build/linux; oe_runmake ${EXTRA_OEMAKE}; cd - )
> > +}
> > +
> > +do_install() {
> > +    ( cd ${S}/decoder/build/linux; oe_runmake PREFIX=${D}/usr install; cd - )
> > +}
> 
> I suspect both those will not catch make error if it happens.
> You should not do this in a sub-shell.
> 
> I would suggest to rework this to do:
> oe_runmake -C ${S}/decode/build/linux ${EXTRA_OEMAKE}
> 
> And adapt the same in install.

Thanks for the suggestion, Bertrand!  I will try this in tomorrow and
respin new patch if don't find any exception :)

Thanks,
Leo
