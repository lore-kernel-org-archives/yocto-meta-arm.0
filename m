Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web12.19161.1596204404424475911
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 31 Jul 2020 07:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=eYe+Wil6;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.65, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f65.google.com with SMTP id j10so7460286qvo.13
        for <meta-arm@lists.yoctoproject.org>; Fri, 31 Jul 2020 07:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VH/hNE7LEnXprDx9M1B6r7PICW29iCRj0LkPaftPuEU=;
        b=eYe+Wil6b9whlR81SMUkxHx3IffrkRlwFQ1gQvfUVcHId/CoOM6QxiDg4tvHdArLGY
         lVC/8gOwNE1iHjg0B3Wemyrl8/Fx+ISGQKeSHN7EbyQyXDdw/sdylZB7f7F+OqJ7eTzw
         WH+WWGz8xI2i6M+AH5Y/crwlGLK5ptLn1OFAhMkIzcgXrdY4a+9PNWYR0o6//rPR7rWm
         1bhpBmhEu+MSJWCNHbfUkFX8/JoyH5zlqVZ4BGfZ+AxXvKbTsAgM4BnomHr3s0X/qF87
         0vLGZgdUdUcfixZAXDNn3Dhc7aOBJ9h48DFw/IPAJHfM9EntS70YDjhzA3Uj+Q8RV/2h
         bbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VH/hNE7LEnXprDx9M1B6r7PICW29iCRj0LkPaftPuEU=;
        b=jcl4a2IxjHW2QCIZv5/eOwFx2dXFjGbjA7bqPahnkqHoJTLYZ9UBfkNsTKD/1VhKyp
         CYLlED403XQc+Mhty6R6XyFjhbdG3butkQ3pFLzV/Z/QMDWbf9E2TNcnybQd67jX69tR
         jLQvTthzb9DcyxxUL7fxsaEiWP6kmwRyZn0iVYW6E3F67JHK67/Ma027Nj1YwJJa2ZKc
         KUX6IJpG8fTzrD0RzGzcVht/IHfdlVRbp1qYDEw2qBE1PFujAu9Qv1bGB6aUD0oZiWh5
         lbY2Be/TpHnYNrsa3M0vnsdB7ogTe7tkaBh71qcNGDDFXnVRoo0RJA3xx2LTiuwQ2PVZ
         iZCw==
X-Gm-Message-State: AOAM532N5Jj/AK4sWd+XgnzaUF2MxHzwHGbwxgMxYE1VBsRtrcSzTfFf
	dzKVz8pGfxKqSQxTSYs2gIufbg5Tb0QeWQ==
X-Google-Smtp-Source: ABdhPJySm1eFvy3nk3L48hus/vUIWX+WXQm6ukTXPmmljWC8TBcvc7rLPDr5NEzhDfuJndpc6WWk3Q==
X-Received: by 2002:a0c:f081:: with SMTP id g1mr4257386qvk.219.1596204403579;
        Fri, 31 Jul 2020 07:06:43 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:ad65:cfb8:9c11:f25c])
        by smtp.gmail.com with ESMTPSA id i65sm8507187qkf.126.2020.07.31.07.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 07:06:43 -0700 (PDT)
Date: Fri, 31 Jul 2020 10:06:41 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] optee-os: fix build race
Message-ID: <20200731140641.GB1853@kudzu.us>
References: <20200731112011.1862712-1-ross@burtonini.com>
MIME-Version: 1.0
In-Reply-To: <20200731112011.1862712-1-ross@burtonini.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 31, 2020 at 12:20:11PM +0100, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> There's a rare build race where mk/conf.mk.tmp is written to before mk/
> exists.  Add an explicit mkdir so that this directory is sure to exist.
> 
> Change-Id: I4e907f395679da9354d386301e7bf5da46afdbaf
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  .../optee/optee-os/missing-mkdir.patch        | 31 +++++++++++++++++++
>  .../recipes-security/optee/optee-os_git.bb    |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644 meta-arm/recipes-security/optee/optee-os/missing-mkdir.patch
> 
> diff --git a/meta-arm/recipes-security/optee/optee-os/missing-mkdir.patch b/meta-arm/recipes-security/optee/optee-os/missing-mkdir.patch
> new file mode 100644
> index 0000000..db1b47f
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee-os/missing-mkdir.patch
> @@ -0,0 +1,31 @@
> +Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/4000]
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +From 79384a244d1972cdb02114f5cde6fcaf2e014c9b Mon Sep 17 00:00:00 2001
> +From: Jerome Forissier <jerome@forissier.org>
> +Date: Tue, 28 Jul 2020 17:28:43 +0200
> +Subject: [PATCH] build: fix race when generating conf.mk
> +
> +This patch fixes the following error triggered by a heavily parallel build:
> +
> + echo sm := ta_arm64 > .../export-ta_arm64/mk/conf.mk.tmp
> + /bin/bash: .../export-ta_arm64/mk/conf.mk.tmp: No such file or directory
> +
> +Fixes: https://github.com/OP-TEE/optee_os/issues/3999
> +Signed-off-by: Jerome Forissier <jerome@forissier.org>
> +---
> + ta/ta.mk | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/ta/ta.mk b/ta/ta.mk
> +index 59ed87f71d..ad97edaf08 100644
> +--- a/ta/ta.mk
> ++++ b/ta/ta.mk
> +@@ -190,6 +190,7 @@ define mk-file-export
> + .PHONY: $(conf-mk-file-export)
> + $(conf-mk-file-export):
> + 	@$$(cmd-echo-silent) '  CHK    ' $$@
> ++	$(q)mkdir -p $$(dir $$@)
> + 	$(q)echo sm := $$(sm-$(conf-mk-file-export)) > $$@.tmp
> + 	$(q)echo sm-$$(sm-$(conf-mk-file-export)) := y >> $$@.tmp
> + 	$(q)($$(foreach v, $$(ta-mk-file-export-vars-$$(sm-$(conf-mk-file-export))), \
> diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_git.bb
> index 52c1155..deeb515 100644
> --- a/meta-arm/recipes-security/optee/optee-os_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-os_git.bb
> @@ -21,6 +21,7 @@ SRC_URI = " \
>      file://0004-Cleanup-unused-comp-cflags-sm-from-libgcc-lookup-com.patch \
>      file://0005-Fixup-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch \
>      file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
> +    file://missing-mkdir.patch \
>  "
>  
>  S = "${WORKDIR}/git"
> -- 
> 2.26.2
> 

> 

