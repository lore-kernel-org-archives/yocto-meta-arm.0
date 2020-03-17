Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web12.2364.1584439883230303209
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Mar 2020 03:11:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=euKGDNFS;
 spf=pass (domain: linaro.org, ip: 209.85.215.194, mailfrom: leo.yan@linaro.org)
Received: by mail-pg1-f194.google.com with SMTP id m5so11476703pgg.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 17 Mar 2020 03:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pG8yiTvanbgswOQxPfomSQlbFgDLCGgYwV2gQ+N0aIU=;
        b=euKGDNFSWjrd5d8DkIvhmmqSdEoAosWe3l0cl3p1vesB5Yiyc2Cumc9T9o/d0TH+Y0
         wR4CjYmfSzUAiM/4Im3Q4k/Tl4CiT5o6aTixUP2tJmdnALntFqA9eHowmLdZXj4rwiw8
         gCidWHz7gH0pFfH5HP/3Ts+xbec3efx5mnR5cWWh1e23QfYP/mg9HxyT740IOaHwusvV
         m2ktPH1FNkN/M4JV05aw+WMkshaqbMhirEfqcJjdiD/n7gcdkhGZaQoOQmGGZQCPwYCc
         vqXhC9gHpkcUIrkfQCloPV6dJyLpgwyx+dKW2fpKQ1q4+YX/WUi4kgkNI1eifJqfK2oN
         BVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pG8yiTvanbgswOQxPfomSQlbFgDLCGgYwV2gQ+N0aIU=;
        b=fwTvCY0V9HPP271QySkTA5wFoGusCmcY9SRWyEDRBgwQJy3h8PTm1ilkb1WdAhmoJH
         xzpmb7LB5T4QBxKX/vUGHmQfKQM5FHcHDNto1bLNxm4OwNfi9Xzkr1kOWaik8IOrn76r
         6M+IdxA/Z/3NZEr4wtBS0O0x5ClaUAryRzpzRGKraQ/Xjq5w9LVL6S3UsWiQy3RvT1dz
         h8f5XDKncNJsS095TtZ4V9Pc+380bSthN+nZbkziP1iM0DUS2hGKD7MpTkJyM9xXJcDV
         O08RhiqazOFvqlXeG7RixFqdoMBHPU4AcupLGqPPYLlVrqnQSmxcPhVMW+IV9sN4DkXm
         1ZVA==
X-Gm-Message-State: ANhLgQ1NOo+W4eRFAIwclcp5se4WSGBE1BGcfZldtJUtQYU6wmIvi+RL
	vGBSBwXQZMm+ve2LiwRdMbpGIZqVrkmnQQ==
X-Google-Smtp-Source: ADFU+vtmoCbHhfoqDoqQuwqHQgyxuvwXjoTy+zH2mywMfZZK5WlPEHYaxwSw7hU/ivsAayYOoY9k8Q==
X-Received: by 2002:a65:5a87:: with SMTP id c7mr3604696pgt.237.1584439882372;
        Tue, 17 Mar 2020 03:11:22 -0700 (PDT)
Return-Path: <leo.yan@linaro.org>
Received: from leoy-ThinkPad-X240s ([2400:8902::f03c:91ff:fe3f:32da])
        by smtp.gmail.com with ESMTPSA id 66sm2688949pfb.150.2020.03.17.03.11.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Mar 2020 03:11:21 -0700 (PDT)
Date: Tue, 17 Mar 2020 18:11:10 +0800
From: "Leo Yan" <leo.yan@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>, Scott Murray <scott.murray@konsulko.com>,
	Jon Mason <jdmason@kudzu.us>, Mike Leach <mike.leach@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [meta-arm] [PATCH v1 RESEND] OpenCSD: Support for Arm CoreSight decode lib
Message-ID: <20200317101110.GA14560@leoy-ThinkPad-X240s>
References: <15F996871B39719F.16592@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <15F996871B39719F.16592@lists.yoctoproject.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jon,

On Fri, Mar 06, 2020 at 02:37:20AM +0000, Leo Yan via Lists.Yoctoproject.Org wrote:
> This patch is to add recipe for OpenCSD, which is an open source
> CoreSight trace decode library and utility.
> 
> Also create a new folder recipes-devtools under meta-arm to place
> this recipe.
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

Gentle ping.

> ---
>  .../recipes-devtools/opencsd/opencsd_git.bb   | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta-arm/recipes-devtools/opencsd/opencsd_git.bb
> 
> diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_git.bb b/meta-arm/recipes-devtools/opencsd/opencsd_git.bb
> new file mode 100644
> index 0000000..0c3b483
> --- /dev/null
> +++ b/meta-arm/recipes-devtools/opencsd/opencsd_git.bb
> @@ -0,0 +1,28 @@
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
> +                LINKER='${CXX}' \
> +                LINUX64=1 \
> +                DEBUG=1 \
> +                "
> +
> +do_compile() {
> +    ( cd ${S}/decoder/build/linux; oe_runmake ${EXTRA_OEMAKE}; cd - )
> +}
> +
> +do_install() {
> +    ( cd ${S}/decoder/build/linux; oe_runmake PREFIX=${D}/usr install; cd - )
> +}
> -- 
> 2.17.1
> 

> 

