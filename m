Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web08.27847.1603638090277475691
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 25 Oct 2020 08:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=U6vv3KSh;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f193.google.com with SMTP id 140so6098111qko.2
        for <meta-arm@lists.yoctoproject.org>; Sun, 25 Oct 2020 08:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eEzwiPy34FkBG7Rq+ocC30O1UF2UhcR7anpjEHsAl0Y=;
        b=U6vv3KSh1+HqXB2tbX6x6k0Xm9MGxAHQwZCgw84SiL+P4JIXEFArVy0fNoDXX69nBy
         He2Ii6W5aXHY3yhgsMBPEMpQRPqS5Ymzyo+sbQqZiiGD9wvASRg5zN1Btbp2bg8F0HHc
         osrs6Nrb+EEk153XuYZzilrcST+mcfpm7hPt2TZASzm8y+cOvE2vk7dL1AU61AG2VTZN
         ZbspdELm1O9z+9YrM07Te189f/9DyqDeCbSlg4TfQDCvAJienOPHiMWplhBwI5LmorJb
         vhNdqg8PFshSiYbsETFhp7bturNaC+k4dlU0xx5b/muhqttAD0il3WFdwxbVniU1DSkl
         FJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eEzwiPy34FkBG7Rq+ocC30O1UF2UhcR7anpjEHsAl0Y=;
        b=pf7EL6q3f5HBQ2x+j7mutYs5SNg14dRw+1JO8srkT1IFY9FBMLNnisnfaGU2Xo4kBk
         HWcW2Kyj3XooxSxPGk9WeYcEdqyr0WvdSpi0b3G9WaTKLt8JXo1bL5Y8In3E1x2xkB9r
         DMC2jBfm0WFHibRUsRzN490Na5hdtM2OEeb8YDzTx2D99mDpE6ZYI6K5S6Yf/zTqXM9D
         XdlK8FEuEd0FrjkMNnuV+wNNzRbjSIbnWEp5xUtnvdfwy3EwEjdtZd5ynyaG/HJMw30l
         Fj7zHRYG41gCXwzjJubFYI5kuYQrpg3rqtQhH7sCst+1fo03SZE8fFRT2sCFmpdthAei
         5qWQ==
X-Gm-Message-State: AOAM530enmDBv5OhnOHw1imOL50r+gmDG0kNb/QXboqEsKZKO5gSYOw+
	y27h3+TRb0HCCkJchjtFjYoTicJyd8x01jwGzdM=
X-Google-Smtp-Source: ABdhPJx6PdaRav0NbmNqtdxUUe9vyI57fa6E518uiisHvA3nTOauYPpXXQfDBYPDe9souM1kpCcNfg==
X-Received: by 2002:a37:668f:: with SMTP id a137mr13173577qkc.258.1603638089419;
        Sun, 25 Oct 2020 08:01:29 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id d129sm4697137qkg.127.2020.10.25.08.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 08:01:29 -0700 (PDT)
Date: Sun, 25 Oct 2020 11:01:26 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Cc: meta-arm@lists.yoctoproject.org, Lakshmi.Kailasanathan@arm.com,
	Ross.Burton@arm.com, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp/corstone700-test-app: adding test recipe for systems comms
Message-ID: <20201025150126.GE8073@kudzu.us>
References: <20201021171033.21198-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201021171033.21198-1-abdellatif.elkhlifi@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 21, 2020 at 06:10:33PM +0100, Abdellatif El Khlifi wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> This commit provides a recipe that generates a Linux userspace
> application used for testing the communication between Corstone700 cores.
> 
> Change-Id: I7c00653b0fcd6d9074510bbb70a838762aed0150
> Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  .../corstone700-test-app_1.0.bb               | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-arm-bsp/recipes-test/corstone700-test-app/corstone700-test-app_1.0.bb
> 
> diff --git a/meta-arm-bsp/recipes-test/corstone700-test-app/corstone700-test-app_1.0.bb b/meta-arm-bsp/recipes-test/corstone700-test-app/corstone700-test-app_1.0.bb
> new file mode 100644
> index 0000000..d2bfb19
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-test/corstone700-test-app/corstone700-test-app_1.0.bb
> @@ -0,0 +1,21 @@
> +SUMMARY = "CORSTONE700 systems communications tests"
> +DESCRIPTION = "This is a Linux userspace tool to test the communication between Corstone700 cores"
> +HOMEPAGE = "https://git.linaro.org/landing-teams/working/arm/test-apps.git"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://license.md;md5=e44b2531cd6ffe9dece394dbe988d9a0"
> +
> +SRC_URI = "git://git.linaro.org/landing-teams/working/arm/test-apps.git;protocol=https"
> +SRCREV = "ecd93a275d11cf08f670a97783110bd698250963"
> +PV .= "~git${SRCPV}"
> +
> +COMPATIBLE_MACHINE = "(corstone700)"
> +
> +S = "${WORKDIR}/git"
> +
> +do_compile() {
> +    ${CC} ${S}/test-app.c ${CFLAGS} ${LDFLAGS} -o ${S}/test-app
> +}
> +
> +do_install() {
> +    install -D -p -m 0755 ${S}/test-app ${D}${bindir}/test-app
> +}
> -- 
> 2.17.1
> 

> 
> 
> 

