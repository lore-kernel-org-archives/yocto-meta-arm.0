Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web12.528.1584651867847944948
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Mar 2020 14:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=IQtvkTIK;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.68, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f68.google.com with SMTP id cz10so1868574qvb.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 19 Mar 2020 14:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=PrIp1bhrzq8uM1JDg6Ez9STST2fB5fa5ZIXF+2PlX8g=;
        b=IQtvkTIK8ikjgkPDk+IwMoruX7tcPMtFvnRJ/t2GtD6yiNChdd47dSfTF1zs/BLQKh
         OpGt3yJ2muY7gcigFxgJTWFuZxUBTNbP/0AXpEGTt0pZKwDzq0TlHyKXrBmKdcoK8tvq
         O5eN2cWOrXAZfsPbxGenoQOm1xFdrzmYZXyVOnUy0k/h8H8fPtcAJHrOaoj41a4jE5Sd
         jQWeI4AQgb92DO2rJJ6vk1INsUtxi+YEJFe144XWgOXdhJdSnIu5IpJHlhntN/zQZWuM
         dhrtehiUPxkmYlsY+grKxsvRw4+DR6dfK05qOBcFWszV/OrO1MII6t/IlKGB8XBSQeZV
         RFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=PrIp1bhrzq8uM1JDg6Ez9STST2fB5fa5ZIXF+2PlX8g=;
        b=XvWbj16sucmAjaCQeB0gNIqdCwMHgf4Hki8xCagcnMAVMDvYs8mVCSUsLLgK73Yshp
         KCStyfXMNySXzNf6peHzctZoFWOmx42kGZUCFV8DWchoSiCwEJHekOYKmNs7bOMCAYNJ
         dagu8+AMqM8bkkkKfWHjZgILoY6UpOy2tEPQIQ/6WtaYBRwL507/KatPRhZIQRukO/RK
         Z7Cj9/g9jjBoKXm6hIyAVTkDHL5x9wY9elOKUueO83ihgSYfmSqpTcVwX8KabVqhYi76
         bAzmP08B2lsKH5FFWnI9RzkLSUruldrEIqHjr40boXyaMCVLNVVRPNBX3Cbiw0w4IZ1o
         80og==
X-Gm-Message-State: ANhLgQ0CwJTjX3Ia/JFmZ1Z8hZM463oxC8uczHDZSdXkKqh2Q8dU5PB4
	p6q4PsEGetPfRobr4A4ADECb7JS1vkXrzA==
X-Google-Smtp-Source: ADFU+vv2rFhXCl8TlVTL1hrutTt4Ue2OrOeQqHKzoMrIvOwyOUuJzJ8nNN476bVA2gLN27zTLb+A+Q==
X-Received: by 2002:ad4:53a2:: with SMTP id j2mr5051712qvv.145.1584651866648;
        Thu, 19 Mar 2020 14:04:26 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:4158:6bf7:f564:e8f1])
        by smtp.gmail.com with ESMTPSA id q26sm2297382qki.115.2020.03.19.14.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 14:04:26 -0700 (PDT)
Date: Thu, 19 Mar 2020 17:04:24 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Cc: "leo.yan@linaro.org" <leo.yan@linaro.org>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH v3] OpenCSD: Support for Arm CoreSight decode lib
Message-ID: <20200319210424.GA4731@kudzu.us>
References: <20200318071901.28503-1-leo.yan@linaro.org>
 <87CFF39E-1E6B-49FB-8897-2F452CC78904@arm.com>
MIME-Version: 1.0
In-Reply-To: <87CFF39E-1E6B-49FB-8897-2F452CC78904@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Mar 19, 2020 at 08:01:49AM +0000, Bertrand Marquis wrote:
> 
> 
> On 18 Mar 2020, at 07:19, Leo Yan <leo.yan@linaro.org<mailto:leo.yan@linaro.org>> wrote:
> 
> This patch is to add recipe for OpenCSD, which is an open source
> CoreSight trace decode library and utility.
> 
> Also create a new folder recipes-devtools under meta-arm to place
> this recipe.
> 
> v3: Added support native building (Bertrand Marquis).
> 
> v2: Refined recipe to use '-C' make option so can catch make error
>    (Bertrand Marquis).

Applied to the master branch of meta-arm.  Nit, in thw future, if you
can add comments like v2 and v3 under a '---', it would save me from
having to edit the commit message to remove them.  Git will
automatically remove everything between the first --- and the start of
the patch (and this is how the do comments like this in emails on
LKML).

Thanks,
Jon

> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org<mailto:leo.yan@linaro.org>>
> ---
> .../recipes-devtools/opencsd/opencsd_git.bb   | 31 +++++++++++++++++++
> 1 file changed, 31 insertions(+)
> create mode 100644 meta-arm/recipes-devtools/opencsd/opencsd_git.bb
> 
> diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_git.bb b/meta-arm/recipes-devtools/opencsd/opencsd_git.bb
> new file mode 100644
> index 0000000..f1d4cac
> --- /dev/null
> +++ b/meta-arm/recipes-devtools/opencsd/opencsd_git.bb
> @@ -0,0 +1,31 @@
> +SUMMARY = "OpenCSD - An open source CoreSight(tm) Trace Decode library"
> +HOMEPAGE = "https://github.com/Linaro/OpenCSD"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ad8cb685eb324d2fa2530b985a43f3e5"
> +
> +SRC_URI = "git://github.com/Linaro/OpenCSD;protocol=http;branch=master"
> +SRCREV = "03c194117971e4ad0598df29395757ced2e6e9bd"
> +
> +S = "${WORKDIR}/git"
> +
> +COMPATIBLE_HOST = "(x86_64.*|aarch64.*)-linux"
> +
> +EXTRA_OEMAKE = "ARCH='${TARGET_ARCH}' \
> +                CROSS_COMPILE='${TARGET_SYS}-' \
> +                CC='${CC}' \
> +                CXX='${CXX}' \
> +                LIB='${AR}' \
> +                LINKER='${CXX}' \
> +                LINUX64=1 \
> +                DEBUG=1 \
> +                "
> +
> +do_compile() {
> +    oe_runmake -C ${S}/decoder/build/linux ${EXTRA_OEMAKE}
> +}
> +
> +do_install() {
> +    oe_runmake -C ${S}/decoder/build/linux PREFIX=${D}/usr install
> +}
> +
> +BBCLASSEXTEND = "native"
> —
> 2.17.1
> 
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com<mailto:bertrand.marquis@arm.com>>
> 
> 
> 

> 

