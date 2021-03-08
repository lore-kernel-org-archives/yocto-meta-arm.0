Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web08.39788.1615224581357225505
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Mar 2021 09:29:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=MwCg+ZqI;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.44, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f44.google.com with SMTP id gi9so4955761qvb.10
        for <meta-arm@lists.yoctoproject.org>; Mon, 08 Mar 2021 09:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=daP3JcstpN3hfYInsp/BPtV/LxYruM2vL/jCvxudZrM=;
        b=MwCg+ZqIZcr6/IADXm5kg0lVhxrtdTFABPLeonUtueHo9HVCoZd2eJTufXXhOSm6pH
         7otbnTcSz2sBWEyNSY3676oNhnbhXPdsWSaE5GhlS79CbX8w6g8wdQ9XcN3LBCU2O/G/
         3h6tehyQGm7H0YQosd2ls+kDxf5V0kTlokBHA4nj7kj/9IstYSwULJllBr8oPUlQ2HSC
         wHkADwtWtCtGefjoM6feROWto3Iz2/RMSdBNeKcLDAeAOp26AUNUYfUqpIjq2l1cAneW
         XVH2BCntsHrFrQ9kZzdK6N93wq3smJBz0FFiPBGbyvpplDG5r+yNosenGNS3AthIMEQs
         pFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=daP3JcstpN3hfYInsp/BPtV/LxYruM2vL/jCvxudZrM=;
        b=GxA+n20oG5be2obYilPLEiSvq1BA+SlbZTA0mBE+1Op0tZfEhrXXC/T/GPA6l1MF/E
         ZhWy7PYLc6FjbRVv/fXjwyNkmd+lYYe7l3tCwX5PCxsrYAwHnjT53VGjLp76NT7LJW0j
         GHpV0NH/5lIIyYADIWU1JVd3yxnkTiofyF9Igk88K+29SDl0bD/Av5WWaQVKSzReyg4S
         m6LjsE1JthVmPjMzTCMyMsE/UhnP3Maixk1eb3Iam1lfAC3iphf/kbNRUJ+fxTvFqKzm
         xldg5tR6D89tsGeEGYgikD/06GnNOJg9x/eZ/bxE2Hupj0TDQkicogFR+mRecMl0c7k0
         zPiw==
X-Gm-Message-State: AOAM530geGF4YdzfdV8tIRmjrLbLCS4FSi8oG1/Jn34eb1rgSOK8xvjp
	BPxTDFc4ugMWFwras8Z+UgnkBw==
X-Google-Smtp-Source: ABdhPJzkQsxs4v+9BkxpUX4kHm6z8F4ZR6ZbdW++nS8UUs3iI1OmQNNX8Yr30gvR/8p+W2vsm5vxlg==
X-Received: by 2002:a05:6214:d8a:: with SMTP id e10mr21865033qve.39.1615224580315;
        Mon, 08 Mar 2021 09:29:40 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:21eb:6765:e1df:ed61])
        by smtp.gmail.com with ESMTPSA id v17sm8264360qtq.41.2021.03.08.09.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 09:29:39 -0800 (PST)
Date: Mon, 8 Mar 2021 12:29:38 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Richard Neill <richard.neill@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] arm-autonomy/xen: remove patches that have been mainlined in xen 4.14.1
Message-ID: <20210308172937.GA17460@kudzu.us>
References: <16697B13F55429F4.22430@lists.yoctoproject.org>
 <AM6PR08MB389327750222C43F43F92382E0969@AM6PR08MB3893.eurprd08.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AM6PR08MB389327750222C43F43F92382E0969@AM6PR08MB3893.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 05, 2021 at 03:17:09PM +0000, Richard Neill wrote:
> This patch should also be backported to the gatesgarth branch, please.

Patch applied to both branches.

Thanks,
Jon

> 
> Thanks,
> Richard
> ________________________________
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on behalf of Richard Neill via lists.yoctoproject.org <richard.neill=arm.com@lists.yoctoproject.org>
> Sent: Friday, March 5, 2021 3:15 PM
> To: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> Subject: [meta-arm] [PATCH] arm-autonomy/xen: remove patches that have been mainlined in xen 4.14.1
> 
> Remove the 4 patches from recipes-extended/xen/xen_4.14.bbappend that
> have been integrated in xen 4.14.1
> 
> Issue-Id: SCM-2133
> Signed-off-by: Richard Neill <richard.neill@arm.com>
> Change-Id: If38262d17699794eb600b11e131c168ed4de4391
> ---
>  ...Neoverse-N1-processor-identification.patch | 40 ---------------
>  ...sages-for-unknown-FP-SIMD-implement.patch} |  0
>  ...ble-CPU-Erratum-1165522-for-Neoverse.patch | 42 ---------------
>  ...ilicon-errata.txt-with-the-Neovers-A.patch | 35 -------------
>  ...N1-A76-A75-FP-registers-in-vCPU-cont.patch | 51 -------------------
>  .../recipes-extended/xen/xen_4.14.bbappend    |  6 +--
>  6 files changed, 1 insertion(+), 173 deletions(-)
>  delete mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-arm-Add-Neoverse-N1-processor-identification.patch
>  rename meta-arm-autonomy/recipes-extended/xen/xen-4.14/{0005-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch => 0001-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch} (100%)
>  delete mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/0002-xen-arm-Enable-CPU-Erratum-1165522-for-Neoverse.patch
>  delete mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/0003-xen-arm-Update-silicon-errata.txt-with-the-Neovers-A.patch
>  delete mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/0004-xen-arm-Missing-N1-A76-A75-FP-registers-in-vCPU-cont.patch
> 
> diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-arm-Add-Neoverse-N1-processor-identification.patch b/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-arm-Add-Neoverse-N1-processor-identification.patch
> deleted file mode 100644
> index df5e73e..0000000
> --- a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-arm-Add-Neoverse-N1-processor-identification.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From 3b418b33265402aab0cb1bf2b745a25724bae2d8 Mon Sep 17 00:00:00 2001
> -Message-Id: <3b418b33265402aab0cb1bf2b745a25724bae2d8.1602684880.git.diego.sueiro@arm.com>
> -From: Bertrand Marquis <bertrand.marquis@arm.com>
> -Date: Tue, 18 Aug 2020 14:47:38 +0100
> -Subject: [PATCH] arm: Add Neoverse N1 processor identification
> -
> -Add MIDR and CPU part numbers for Neoverse N1
> -
> -Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> -Acked-by: Julien Grall <jgrall@amazon.com>
> -
> -Upstream-Status: Backport
> -Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ----
> - xen/include/asm-arm/processor.h | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/xen/include/asm-arm/processor.h b/xen/include/asm-arm/processor.h
> -index aa642e3..3ca67f8 100644
> ---- a/xen/include/asm-arm/processor.h
> -+++ b/xen/include/asm-arm/processor.h
> -@@ -58,6 +58,7 @@
> - #define ARM_CPU_PART_CORTEX_A73     0xD09
> - #define ARM_CPU_PART_CORTEX_A75     0xD0A
> - #define ARM_CPU_PART_CORTEX_A76     0xD0B
> -+#define ARM_CPU_PART_NEOVERSE_N1    0xD0C
> -
> - #define MIDR_CORTEX_A12 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A12)
> - #define MIDR_CORTEX_A17 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A17)
> -@@ -68,6 +69,7 @@
> - #define MIDR_CORTEX_A73 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A73)
> - #define MIDR_CORTEX_A75 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A75)
> - #define MIDR_CORTEX_A76 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A76)
> -+#define MIDR_NEOVERSE_N1 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_N1)
> -
> - /* MPIDR Multiprocessor Affinity Register */
> - #define _MPIDR_UP           (30)
> ---
> -2.7.4
> -
> diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0005-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch b/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch
> similarity index 100%
> rename from meta-arm-autonomy/recipes-extended/xen/xen-4.14/0005-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch
> rename to meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch
> diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0002-xen-arm-Enable-CPU-Erratum-1165522-for-Neoverse.patch b/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0002-xen-arm-Enable-CPU-Erratum-1165522-for-Neoverse.patch
> deleted file mode 100644
> index 0ac4049..0000000
> --- a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0002-xen-arm-Enable-CPU-Erratum-1165522-for-Neoverse.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 858c0be8c2fa4125a0fa0acaa03ae730e5c7cb3c Mon Sep 17 00:00:00 2001
> -Message-Id: <858c0be8c2fa4125a0fa0acaa03ae730e5c7cb3c.1602684183.git.diego.sueiro@arm.com>
> -From: Bertrand Marquis <bertrand.marquis@arm.com>
> -Date: Tue, 18 Aug 2020 14:47:39 +0100
> -Subject: [PATCH] xen/arm: Enable CPU Erratum 1165522 for Neoverse
> -
> -Enable CPU erratum of Speculative AT on the Neoverse N1 processor
> -versions r0p0 to r2p0.
> -Also Fix Cortex A76 Erratum string which had a wrong errata number.
> -
> -Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> -Acked-by: Julien Grall <jgrall@amazon.com>
> -
> -Upstream-Status: Backport
> -Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ----
> - xen/arch/arm/cpuerrata.c | 8 +++++++-
> - 1 file changed, 7 insertions(+), 1 deletion(-)
> -
> -diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> -index 0248893..6c09017 100644
> ---- a/xen/arch/arm/cpuerrata.c
> -+++ b/xen/arch/arm/cpuerrata.c
> -@@ -477,8 +477,14 @@ static const struct arm_cpu_capabilities arm_errata[] = {
> -     },
> - #endif
> -     {
> -+        /* Neoverse r0p0 - r2p0 */
> -+        .desc = "ARM erratum 1165522",
> -+        .capability = ARM64_WORKAROUND_AT_SPECULATE,
> -+        MIDR_RANGE(MIDR_NEOVERSE_N1, 0, 2 << MIDR_VARIANT_SHIFT),
> -+    },
> -+    {
> -         /* Cortex-A76 r0p0 - r2p0 */
> --        .desc = "ARM erratum 116522",
> -+        .desc = "ARM erratum 1165522",
> -         .capability = ARM64_WORKAROUND_AT_SPECULATE,
> -         MIDR_RANGE(MIDR_CORTEX_A76, 0, 2 << MIDR_VARIANT_SHIFT),
> -     },
> ---
> -2.7.4
> -
> diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0003-xen-arm-Update-silicon-errata.txt-with-the-Neovers-A.patch b/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0003-xen-arm-Update-silicon-errata.txt-with-the-Neovers-A.patch
> deleted file mode 100644
> index 24b52f0..0000000
> --- a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0003-xen-arm-Update-silicon-errata.txt-with-the-Neovers-A.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 1814a626fb5811184eda64fe22f0055df4600211 Mon Sep 17 00:00:00 2001
> -Message-Id: <1814a626fb5811184eda64fe22f0055df4600211.1602684203.git.diego.sueiro@arm.com>
> -From: Julien Grall <jgrall@amazon.com>
> -Date: Tue, 25 Aug 2020 18:38:10 +0100
> -Subject: [PATCH] xen/arm: Update silicon-errata.txt with the Neovers AT
> - erratum
> -
> -Commit 858c0be8c2fa "xen/arm: Enable CPU Erratum 1165522 for Neoverse"
> -added a new erratum but forgot to update silicon-errata.txt.
> -
> -Update the file accordingly to keep track of errata workaround in Xen.
> -
> -Signed-off-by: Julien Grall <jgrall@amazon.com>
> -Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> -Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> -
> -Upstream-Status: Backport
> -Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ----
> - docs/misc/arm/silicon-errata.txt | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-errata.txt
> -index 11e5a9d..e15d092 100644
> ---- a/docs/misc/arm/silicon-errata.txt
> -+++ b/docs/misc/arm/silicon-errata.txt
> -@@ -51,4 +51,5 @@ stable hypervisors.
> - | ARM            | Cortex-A57      | #1319537        | N/A                     |
> - | ARM            | Cortex-A72      | #1319367        | N/A                     |
> - | ARM            | Cortex-A76      | #1165522        | N/A                     |
> -+| ARM            | Neoverse-N1     | #1165522        | N/A
> - | ARM            | MMU-500         | #842869         | N/A                     |
> ---
> -2.7.4
> -
> diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0004-xen-arm-Missing-N1-A76-A75-FP-registers-in-vCPU-cont.patch b/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0004-xen-arm-Missing-N1-A76-A75-FP-registers-in-vCPU-cont.patch
> deleted file mode 100644
> index 673c63a..0000000
> --- a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0004-xen-arm-Missing-N1-A76-A75-FP-registers-in-vCPU-cont.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From 968bb86d04913f52d7678a842474f2a674a8b23e Mon Sep 17 00:00:00 2001
> -Message-Id: <968bb86d04913f52d7678a842474f2a674a8b23e.1602683678.git.diego.sueiro@arm.com>
> -From: Wei Chen <wei.chen@arm.com>
> -Date: Fri, 28 Aug 2020 02:34:03 +0000
> -Subject: [PATCH] xen/arm: Missing N1/A76/A75 FP registers in vCPU context
> - switch
> -
> -Xen has cpu_has_fp/cpu_has_simd to detect whether the CPU supports
> -FP/SIMD or not. But currently, these two MACROs only consider value 0
> -of ID_AA64PFR0_EL1.FP/SIMD as FP/SIMD features enabled. But for CPUs
> -that support FP/SIMD and half-precision floating-point arithmetic, the
> -ID_AA64PFR0_EL1.FP/SIMD are 1 (see Arm ARM DDI0487F.b, D13.2.64).
> -For these CPUs, xen will treat them as no FP/SIMD support, the
> -vfp_save/restore_state will not take effect.
> -
> -From the TRM documents of Cortex-A75/A76/N1, we know these CPUs support
> -basic Advanced SIMD/FP and half-precision floating-point arithmetic. In
> -this case, on N1/A76/A75 platforms, Xen will always miss the floating
> -pointer registers save/restore. If different vCPUs are running on the
> -same pCPU, the floating pointer registers will be corrupted randomly.
> -
> -This patch fixes Xen on these new cores.
> -
> -Signed-off-by: Wei Chen <wei.chen@arm.com>
> -Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> -Reviewed-by: Julien Grall <jgrall@amazon.com>
> -
> -Upstream-Status: Backport
> -Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ----
> - xen/include/asm-arm/cpufeature.h | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
> -index 674beb0..10878ea 100644
> ---- a/xen/include/asm-arm/cpufeature.h
> -+++ b/xen/include/asm-arm/cpufeature.h
> -@@ -13,8 +13,8 @@
> - #define cpu_has_el2_64    (boot_cpu_feature64(el2) >= 1)
> - #define cpu_has_el3_32    (boot_cpu_feature64(el3) == 2)
> - #define cpu_has_el3_64    (boot_cpu_feature64(el3) >= 1)
> --#define cpu_has_fp        (boot_cpu_feature64(fp) == 0)
> --#define cpu_has_simd      (boot_cpu_feature64(simd) == 0)
> -+#define cpu_has_fp        (boot_cpu_feature64(fp) < 8)
> -+#define cpu_has_simd      (boot_cpu_feature64(simd) < 8)
> - #define cpu_has_gicv3     (boot_cpu_feature64(gic) == 1)
> - #endif
> -
> ---
> -2.7.4
> -
> diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend b/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend
> index bc3b60d..f4196ff 100644
> --- a/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend
> +++ b/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend
> @@ -1,9 +1,5 @@
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.14:"
> 
>  SRC_URI += " \
> -    file://0001-arm-Add-Neoverse-N1-processor-identification.patch \
> -    file://0002-xen-arm-Enable-CPU-Erratum-1165522-for-Neoverse.patch \
> -    file://0003-xen-arm-Update-silicon-errata.txt-with-the-Neovers-A.patch \
> -    file://0004-xen-arm-Missing-N1-A76-A75-FP-registers-in-vCPU-cont.patch \
> -    file://0005-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch \
> +    file://0001-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch \
>      "
> --
> 2.25.1
> 

> 
> 
> 

