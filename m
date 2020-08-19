Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.95565.1597863731546316979
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Aug 2020 12:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=trFTPWlF;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f194.google.com with SMTP id 62so22598105qkj.7
        for <meta-arm@lists.yoctoproject.org>; Wed, 19 Aug 2020 12:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SsbqufoKq13roX8kUs2GND1ddBqCLOXulMvqdysmjNk=;
        b=trFTPWlFczR94/lnItpSPa095GRB3/vyr2HksjFsp1EGcEDDYdvPLR8p6P+7jigyYl
         RIVMhdJbYF3ucMCkgYcwPv2kQidXBumoHt43RJitkeMvvte8FeLnFGND2/zJDsnuFGGP
         9tFLS1eYRGCTdLvScnkDAxhGB4hsjq0dtBimC0rQeRNbnHSMhAOuvigDKOgZCpSE6ZCC
         CEA4IMQfXRJoDFi8oj025nzPLHD+2BlDjbxrFnn0sHtW5csotUnDzADGgat83Gt9euJG
         NofM1YS76C8v1jVH7lKBBsFu/qpzsNGCM1H11jOH7iSeyOu0hA2aOCkb6bKecv9voPTg
         zTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SsbqufoKq13roX8kUs2GND1ddBqCLOXulMvqdysmjNk=;
        b=kYCYXD75OX3Li9qjy/lSV+ekdV8EX9jS5equmzQXlO1LfZRlWxjqZ+3UM1eFKGpjzj
         P/qJRBVCTEvnspomvtbhHGSoA2/K0JG23fRyqTMoIBz9CEv8HLe/waobd1/9s5ESG+D9
         roAc/efSqQJK8dqjWRrrreZJRquDn3gQGkFDeiEcWRHjnTQaIy2bGMtwJT4rwcz/U/nS
         nIB6BjooHqpItvVMsSBx2MjxeL6EqP+DvDZG9besDo4YgkyjYUDfLX7pl7NfOpjUdaqK
         TZv7TdG7t55LUs58O5nc3Wu8erS5eQ07HKG5RLxj0QIaGoaxnmDhW97pMJpEjCe867fr
         dPCA==
X-Gm-Message-State: AOAM530XcrfIERzsc2JX1/YdYMj9FdROY+uzaQHBynXLa5UZGaLkNs5e
	UFck2Xm5/mZAmRk4ArmQ3BhNGA==
X-Google-Smtp-Source: ABdhPJwLVQkAyjX85Zxk5dWATXvVfgtdh6PnVhXoRxDV+ZyvXgpZaPMX3zcjBLCEQjMEkgrw5Js4wA==
X-Received: by 2002:a37:8d0:: with SMTP id 199mr22208106qki.335.1597863730657;
        Wed, 19 Aug 2020 12:02:10 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:85c0:21f7:2371:875f])
        by smtp.gmail.com with ESMTPSA id 20sm25851782qkh.110.2020.08.19.12.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 12:02:10 -0700 (PDT)
Date: Wed, 19 Aug 2020 15:02:08 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp/linux-linaro-arm: Fix multiple definition of `yylloc'
Message-ID: <20200819190208.GA17082@kudzu.us>
References: <20200819130110.25145-1-khasim.mohammed@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200819130110.25145-1-khasim.mohammed@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 19, 2020 at 06:31:10PM +0530, Khasim Mohammed wrote:
> Patch https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/commit/scripts/dtc/dtc-lexer.l?h=v5.4.56&id=35b34d264cb347909ec89d9fa895900035d5438c
> is applied to fix kernel build failure due to multiple definition of 'yyloc'.
> 
> Refer to the bug report https://bugzilla.yoctoproject.org/show_bug.cgi?id=14014 for more details.
> 
> Change-Id: I801c6c40dc67ceea74993ccf26b077ba66ae58d8
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  .../scripts-dtc-remove-redundant-YYLOC.patch  | 59 +++++++++++++++++++
>  .../linux/linux-linaro-arm_5.4.bbappend       |  1 +
>  2 files changed, 60 insertions(+)
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/scripts-dtc-remove-redundant-YYLOC.patch
> 
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/scripts-dtc-remove-redundant-YYLOC.patch b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/scripts-dtc-remove-redundant-YYLOC.patch
> new file mode 100644
> index 0000000..f3ae5e5
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/scripts-dtc-remove-redundant-YYLOC.patch
> @@ -0,0 +1,59 @@
> +Upstream-Status: Backport https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/scripts/dtc/dtc-lexer.l?h=v5.8
> +Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> +
> +From 35b34d264cb347909ec89d9fa895900035d5438c Mon Sep 17 00:00:00 2001
> +From: Dirk Mueller <dmueller@suse.com>
> +Date: Tue, 14 Jan 2020 18:53:41 +0100
> +Subject: scripts/dtc: Remove redundant YYLOC global declaration
> +
> +commit e33a814e772cdc36436c8c188d8c42d019fda639 upstream.
> +
> +gcc 10 will default to -fno-common, which causes this error at link
> +time:
> +
> +  (.text+0x0): multiple definition of `yylloc'; dtc-lexer.lex.o (symbol from plugin):(.text+0x0): first defined here
> +
> +This is because both dtc-lexer as well as dtc-parser define the same
> +global symbol yyloc. Before with -fcommon those were merged into one
> +defintion. The proper solution would be to to mark this as "extern",
> +however that leads to:
> +
> +  dtc-lexer.l:26:16: error: redundant redeclaration of 'yylloc' [-Werror=redundant-decls]
> +   26 | extern YYLTYPE yylloc;
> +      |                ^~~~~~
> +In file included from dtc-lexer.l:24:
> +dtc-parser.tab.h:127:16: note: previous declaration of 'yylloc' was here
> +  127 | extern YYLTYPE yylloc;
> +      |                ^~~~~~
> +cc1: all warnings being treated as errors
> +
> +which means the declaration is completely redundant and can just be
> +dropped.
> +
> +Signed-off-by: Dirk Mueller <dmueller@suse.com>
> +Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> +[robh: cherry-pick from upstream]
> +Cc: stable@vger.kernel.org
> +Signed-off-by: Rob Herring <robh@kernel.org>
> +Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> +---
> + scripts/dtc/dtc-lexer.l | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +(limited to 'scripts/dtc/dtc-lexer.l')
> +
> +diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l
> +index 5c6c3fd557d7..b3b7270300de 100644
> +--- a/scripts/dtc/dtc-lexer.l
> ++++ b/scripts/dtc/dtc-lexer.l
> +@@ -23,7 +23,6 @@ LINECOMMENT	"//".*\n
> + #include "srcpos.h"
> + #include "dtc-parser.tab.h"
> + 
> +-YYLTYPE yylloc;
> + extern bool treesource_error;
> + 
> + /* CAUTION: this will stop working if we ever use yyless() or yyunput() */
> +-- 
> +cgit v1.2.2-1-g5e49
> +
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
> index e2640e0..c83d258 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
> @@ -12,6 +12,7 @@ SRC_URI_append_n1sdp = " \
>      file://0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch \
>      file://0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch \
>      file://enable-realtek-R8169.cfg \
> +    file://scripts-dtc-remove-redundant-YYLOC.patch \
>      "
>  
>  # Referring to commit TAG N1SDP-2020.03.26
> -- 
> 2.17.1
> 

> 

