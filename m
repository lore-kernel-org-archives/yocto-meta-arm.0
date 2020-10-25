Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.27728.1603638153369435705
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 25 Oct 2020 08:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=VwdVrAez;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f193.google.com with SMTP id x20so6104644qkn.1
        for <meta-arm@lists.yoctoproject.org>; Sun, 25 Oct 2020 08:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GLPV7ReHdnPDZtSXWyj6EapvTTXQaDcznVaye1NAfLw=;
        b=VwdVrAezz39z6vukDoGddUjoqB/qeI0isL8CWAvvIFg0ORk3tATPeZeyNsJ5Vpn1i6
         k34Bp90PsahCyS8Su7+97h80+A9HwK7bstUKyhA+jpCPwb62JHvn5Baq9I63w1DhJem5
         iCiUFI4bgPlpg15nGlw6tBDFJBxtZOpeQQH2AnwK2fG2ImcSiVYQsq3WZRktyrsEMkk5
         v0QDIDQIP4gchh5DqJXXTigyLYP26tlAZlzNOvp/XmfuDU6it3VvSskkRUSag4yKShOY
         tpm/q74WWAnV6qcm5oP0UluV4tyIoidc5H92WDICWuyIzDD6eALzVFGi7fJo2Q5r+4yX
         ZYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GLPV7ReHdnPDZtSXWyj6EapvTTXQaDcznVaye1NAfLw=;
        b=sLuFtwSEuYrq35qhRUvcxXD6Vpi+gTBMGqbyA1HTxZIsCrwwc8CioE25ATP9KvNjmo
         8ynBCVuChaSkcBqonLJrssGxsPF5Gct6CzS2kO8p750HTmyWnSRTHV5ZaD/3gaPExu3u
         BldP/NKIq1Ywm58ICcMGZjZsfUBHtvHjbKTQAUoBkr8uvhOky3QKdIxhUeFJReF1iThd
         HBMBqgcXuWLq+wFLpneMaxKFJzP6NT8cJKwtAq+yvK7fneZIi2Hrl1w0nx1msseeTBjJ
         gWUP+SCTcpk+xn313PSoWcvwy+3dHIP17fZqmil4oV2ww65BnTyFu4C9FMM4MocO3H6X
         6DMA==
X-Gm-Message-State: AOAM5326YU5c4d74tmmVhdslWZNXEPRclmlWUWirTKdLU6Ac5ik3/fxR
	1D34ekNIlMRNlbJtFzdY+aoyYQ==
X-Google-Smtp-Source: ABdhPJyvP1liJq0WQ84gVmnob10BVTsxTEK/UPiu/JfgZCKhOhQgWmVFE73Hz6K02C30Fg6BR2rBNg==
X-Received: by 2002:ae9:f305:: with SMTP id p5mr11318285qkg.481.1603638152354;
        Sun, 25 Oct 2020 08:02:32 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id e10sm853741qtj.21.2020.10.25.08.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 08:02:32 -0700 (PDT)
Date: Sun, 25 Oct 2020 11:02:27 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>, meta-arm@lists.yoctoproject.org,
	nd@arm.com
Subject: Re: [meta-arm] [PATCH 1/2] arm-autonomy/xen: Backport improvements to xen 4.14
Message-ID: <20201025150227.GF8073@kudzu.us>
References: <a151eaf39d450b9461ea9d259206956bd5a9fd49.1603291792.git.diego.sueiro@arm.com>
 <16414438CB63749B.10923@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <16414438CB63749B.10923@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 25, 2020 at 10:58:51AM -0400, Jon Mason via lists.yoctoproject.org wrote:
> On Wed, Oct 21, 2020 at 03:51:08PM +0100, Diego Sueiro wrote:
> > These patches improve the overall stability of Xen.
> > 
> > Change-Id: I40c93f1c28fe9bd9548883c1cc0c38e1be7f56c3
> > Issue-Id: SCM-1520
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> 
> Series pulled into master

Meant to respond to the v2, not this one.  v2 included.

> 
> Thanks,
> Jon
> 
> > ---
> >  ...-Add-Neoverse-N1-processor-identification.patch | 40 +++++++++++++++++
> >  ...m-Enable-CPU-Erratum-1165522-for-Neoverse.patch | 42 ++++++++++++++++++
> >  ...ate-silicon-errata.txt-with-the-Neovers-A.patch | 35 +++++++++++++++
> >  ...sing-N1-A76-A75-FP-registers-in-vCPU-cont.patch | 51 ++++++++++++++++++++++
> >  ...ow-messages-for-unknown-FP-SIMD-implement.patch | 51 ++++++++++++++++++++++
> >  .../recipes-extended/xen/xen_4.14.bbappend         |  9 ++++
> >  6 files changed, 228 insertions(+)
> >  create mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-arm-Add-Neoverse-N1-processor-identification.patch
> >  create mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/0002-xen-arm-Enable-CPU-Erratum-1165522-for-Neoverse.patch
> >  create mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/0003-xen-arm-Update-silicon-errata.txt-with-the-Neovers-A.patch
> >  create mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/0004-xen-arm-Missing-N1-A76-A75-FP-registers-in-vCPU-cont.patch
> >  create mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/0005-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch
> >  create mode 100644 meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend
> > 
> > diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-arm-Add-Neoverse-N1-processor-identification.patch b/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-arm-Add-Neoverse-N1-processor-identification.patch
> > new file mode 100644
> > index 0000000..d50e77e
> > --- /dev/null
> > +++ b/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-arm-Add-Neoverse-N1-processor-identification.patch
> > @@ -0,0 +1,40 @@
> > +From 3b418b33265402aab0cb1bf2b745a25724bae2d8 Mon Sep 17 00:00:00 2001
> > +Message-Id: <3b418b33265402aab0cb1bf2b745a25724bae2d8.1602684880.git.diego.sueiro@arm.com>
> > +From: Bertrand Marquis <bertrand.marquis@arm.com>
> > +Date: Tue, 18 Aug 2020 14:47:38 +0100
> > +Subject: [PATCH] arm: Add Neoverse N1 processor identification
> > +
> > +Add MIDR and CPU part numbers for Neoverse N1
> > +
> > +Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > +Acked-by: Julien Grall <jgrall@amazon.com>
> > +
> > +Upstream-Status: backport
> > +Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > +---
> > + xen/include/asm-arm/processor.h | 2 ++
> > + 1 file changed, 2 insertions(+)
> > +
> > +diff --git a/xen/include/asm-arm/processor.h b/xen/include/asm-arm/processor.h
> > +index aa642e3..3ca67f8 100644
> > +--- a/xen/include/asm-arm/processor.h
> > ++++ b/xen/include/asm-arm/processor.h
> > +@@ -58,6 +58,7 @@
> > + #define ARM_CPU_PART_CORTEX_A73     0xD09
> > + #define ARM_CPU_PART_CORTEX_A75     0xD0A
> > + #define ARM_CPU_PART_CORTEX_A76     0xD0B
> > ++#define ARM_CPU_PART_NEOVERSE_N1    0xD0C
> > + 
> > + #define MIDR_CORTEX_A12 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A12)
> > + #define MIDR_CORTEX_A17 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A17)
> > +@@ -68,6 +69,7 @@
> > + #define MIDR_CORTEX_A73 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A73)
> > + #define MIDR_CORTEX_A75 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A75)
> > + #define MIDR_CORTEX_A76 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A76)
> > ++#define MIDR_NEOVERSE_N1 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_N1)
> > + 
> > + /* MPIDR Multiprocessor Affinity Register */
> > + #define _MPIDR_UP           (30)
> > +-- 
> > +2.7.4
> > +
> > diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0002-xen-arm-Enable-CPU-Erratum-1165522-for-Neoverse.patch b/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0002-xen-arm-Enable-CPU-Erratum-1165522-for-Neoverse.patch
> > new file mode 100644
> > index 0000000..2793b60
> > --- /dev/null
> > +++ b/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0002-xen-arm-Enable-CPU-Erratum-1165522-for-Neoverse.patch
> > @@ -0,0 +1,42 @@
> > +From 858c0be8c2fa4125a0fa0acaa03ae730e5c7cb3c Mon Sep 17 00:00:00 2001
> > +Message-Id: <858c0be8c2fa4125a0fa0acaa03ae730e5c7cb3c.1602684183.git.diego.sueiro@arm.com>
> > +From: Bertrand Marquis <bertrand.marquis@arm.com>
> > +Date: Tue, 18 Aug 2020 14:47:39 +0100
> > +Subject: [PATCH] xen/arm: Enable CPU Erratum 1165522 for Neoverse
> > +
> > +Enable CPU erratum of Speculative AT on the Neoverse N1 processor
> > +versions r0p0 to r2p0.
> > +Also Fix Cortex A76 Erratum string which had a wrong errata number.
> > +
> > +Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > +Acked-by: Julien Grall <jgrall@amazon.com>
> > +
> > +Upstream-Status: backport
> > +Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > +---
> > + xen/arch/arm/cpuerrata.c | 8 +++++++-
> > + 1 file changed, 7 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> > +index 0248893..6c09017 100644
> > +--- a/xen/arch/arm/cpuerrata.c
> > ++++ b/xen/arch/arm/cpuerrata.c
> > +@@ -477,8 +477,14 @@ static const struct arm_cpu_capabilities arm_errata[] = {
> > +     },
> > + #endif
> > +     {
> > ++        /* Neoverse r0p0 - r2p0 */
> > ++        .desc = "ARM erratum 1165522",
> > ++        .capability = ARM64_WORKAROUND_AT_SPECULATE,
> > ++        MIDR_RANGE(MIDR_NEOVERSE_N1, 0, 2 << MIDR_VARIANT_SHIFT),
> > ++    },
> > ++    {
> > +         /* Cortex-A76 r0p0 - r2p0 */
> > +-        .desc = "ARM erratum 116522",
> > ++        .desc = "ARM erratum 1165522",
> > +         .capability = ARM64_WORKAROUND_AT_SPECULATE,
> > +         MIDR_RANGE(MIDR_CORTEX_A76, 0, 2 << MIDR_VARIANT_SHIFT),
> > +     },
> > +-- 
> > +2.7.4
> > +
> > diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0003-xen-arm-Update-silicon-errata.txt-with-the-Neovers-A.patch b/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0003-xen-arm-Update-silicon-errata.txt-with-the-Neovers-A.patch
> > new file mode 100644
> > index 0000000..4fedf5a
> > --- /dev/null
> > +++ b/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0003-xen-arm-Update-silicon-errata.txt-with-the-Neovers-A.patch
> > @@ -0,0 +1,35 @@
> > +From 1814a626fb5811184eda64fe22f0055df4600211 Mon Sep 17 00:00:00 2001
> > +Message-Id: <1814a626fb5811184eda64fe22f0055df4600211.1602684203.git.diego.sueiro@arm.com>
> > +From: Julien Grall <jgrall@amazon.com>
> > +Date: Tue, 25 Aug 2020 18:38:10 +0100
> > +Subject: [PATCH] xen/arm: Update silicon-errata.txt with the Neovers AT
> > + erratum
> > +
> > +Commit 858c0be8c2fa "xen/arm: Enable CPU Erratum 1165522 for Neoverse"
> > +added a new erratum but forgot to update silicon-errata.txt.
> > +
> > +Update the file accordingly to keep track of errata workaround in Xen.
> > +
> > +Signed-off-by: Julien Grall <jgrall@amazon.com>
> > +Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > +Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> > +
> > +Upstream-Status: backport
> > +Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > +---
> > + docs/misc/arm/silicon-errata.txt | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-errata.txt
> > +index 11e5a9d..e15d092 100644
> > +--- a/docs/misc/arm/silicon-errata.txt
> > ++++ b/docs/misc/arm/silicon-errata.txt
> > +@@ -51,4 +51,5 @@ stable hypervisors.
> > + | ARM            | Cortex-A57      | #1319537        | N/A                     |
> > + | ARM            | Cortex-A72      | #1319367        | N/A                     |
> > + | ARM            | Cortex-A76      | #1165522        | N/A                     |
> > ++| ARM            | Neoverse-N1     | #1165522        | N/A
> > + | ARM            | MMU-500         | #842869         | N/A                     |
> > +-- 
> > +2.7.4
> > +
> > diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0004-xen-arm-Missing-N1-A76-A75-FP-registers-in-vCPU-cont.patch b/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0004-xen-arm-Missing-N1-A76-A75-FP-registers-in-vCPU-cont.patch
> > new file mode 100644
> > index 0000000..35c6e3e
> > --- /dev/null
> > +++ b/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0004-xen-arm-Missing-N1-A76-A75-FP-registers-in-vCPU-cont.patch
> > @@ -0,0 +1,51 @@
> > +From 968bb86d04913f52d7678a842474f2a674a8b23e Mon Sep 17 00:00:00 2001
> > +Message-Id: <968bb86d04913f52d7678a842474f2a674a8b23e.1602683678.git.diego.sueiro@arm.com>
> > +From: Wei Chen <wei.chen@arm.com>
> > +Date: Fri, 28 Aug 2020 02:34:03 +0000
> > +Subject: [PATCH] xen/arm: Missing N1/A76/A75 FP registers in vCPU context
> > + switch
> > +
> > +Xen has cpu_has_fp/cpu_has_simd to detect whether the CPU supports
> > +FP/SIMD or not. But currently, these two MACROs only consider value 0
> > +of ID_AA64PFR0_EL1.FP/SIMD as FP/SIMD features enabled. But for CPUs
> > +that support FP/SIMD and half-precision floating-point arithmetic, the
> > +ID_AA64PFR0_EL1.FP/SIMD are 1 (see Arm ARM DDI0487F.b, D13.2.64).
> > +For these CPUs, xen will treat them as no FP/SIMD support, the
> > +vfp_save/restore_state will not take effect.
> > +
> > +From the TRM documents of Cortex-A75/A76/N1, we know these CPUs support
> > +basic Advanced SIMD/FP and half-precision floating-point arithmetic. In
> > +this case, on N1/A76/A75 platforms, Xen will always miss the floating
> > +pointer registers save/restore. If different vCPUs are running on the
> > +same pCPU, the floating pointer registers will be corrupted randomly.
> > +
> > +This patch fixes Xen on these new cores.
> > +
> > +Signed-off-by: Wei Chen <wei.chen@arm.com>
> > +Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > +Reviewed-by: Julien Grall <jgrall@amazon.com>
> > +
> > +Upstream-Status: backport
> > +Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > +---
> > + xen/include/asm-arm/cpufeature.h | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
> > +index 674beb0..10878ea 100644
> > +--- a/xen/include/asm-arm/cpufeature.h
> > ++++ b/xen/include/asm-arm/cpufeature.h
> > +@@ -13,8 +13,8 @@
> > + #define cpu_has_el2_64    (boot_cpu_feature64(el2) >= 1)
> > + #define cpu_has_el3_32    (boot_cpu_feature64(el3) == 2)
> > + #define cpu_has_el3_64    (boot_cpu_feature64(el3) >= 1)
> > +-#define cpu_has_fp        (boot_cpu_feature64(fp) == 0)
> > +-#define cpu_has_simd      (boot_cpu_feature64(simd) == 0)
> > ++#define cpu_has_fp        (boot_cpu_feature64(fp) < 8)
> > ++#define cpu_has_simd      (boot_cpu_feature64(simd) < 8)
> > + #define cpu_has_gicv3     (boot_cpu_feature64(gic) == 1)
> > + #endif
> > + 
> > +-- 
> > +2.7.4
> > +
> > diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0005-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch b/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0005-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch
> > new file mode 100644
> > index 0000000..fdd5feb
> > --- /dev/null
> > +++ b/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0005-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch
> > @@ -0,0 +1,51 @@
> > +From f4c1a541fa351e4f613471bbf397931f9e1ddd27 Mon Sep 17 00:00:00 2001
> > +Message-Id: <f4c1a541fa351e4f613471bbf397931f9e1ddd27.1602683707.git.diego.sueiro@arm.com>
> > +From: Wei Chen <wei.chen@arm.com>
> > +Date: Fri, 28 Aug 2020 02:34:04 +0000
> > +Subject: [PATCH] xen/arm: Throw messages for unknown FP/SIMD implement ID
> > +
> > +Arm ID_AA64PFR0_EL1 register provides two fields to describe CPU
> > +FP/SIMD implementations. Currently, we exactly know the meaning of
> > +0x0, 0x1 and 0xf of these fields. Xen treats value < 8 as FP/SIMD
> > +features presented. If there is a value 0x2 bumped in the future,
> > +Xen behaviors for value <= 0x1 can also take effect. But what Xen
> > +done for value <= 0x1 may not always cover new value 0x2 required.
> > +We throw these messages to break the silence when Xen detected
> > +unknown FP/SIMD IDs to notice user to check.
> > +
> > +Signed-off-by: Wei Chen <wei.chen@arm.com>
> > +Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > +Acked-by: Julien Grall <jgrall@amazon.com>
> > +
> > +Upstream-Status: backport
> > +Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > +---
> > + xen/arch/arm/setup.c | 12 ++++++++++++
> > + 1 file changed, 12 insertions(+)
> > +
> > +diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> > +index 7968cee..f16b33f 100644
> > +--- a/xen/arch/arm/setup.c
> > ++++ b/xen/arch/arm/setup.c
> > +@@ -133,6 +133,18 @@ static void __init processor_id(void)
> > +            cpu_has_simd ? " AdvancedSIMD" : "",
> > +            cpu_has_gicv3 ? " GICv3-SysReg" : "");
> > + 
> > ++    /* Warn user if we find unknown floating-point features */
> > ++    if ( cpu_has_fp && (boot_cpu_feature64(fp) >= 2) )
> > ++        printk(XENLOG_WARNING "WARNING: Unknown Floating-point ID:%d, "
> > ++               "this may result in corruption on the platform\n",
> > ++               boot_cpu_feature64(fp));
> > ++
> > ++    /* Warn user if we find unknown AdvancedSIMD features */
> > ++    if ( cpu_has_simd && (boot_cpu_feature64(simd) >= 2) )
> > ++        printk(XENLOG_WARNING "WARNING: Unknown AdvancedSIMD ID:%d, "
> > ++               "this may result in corruption on the platform\n",
> > ++               boot_cpu_feature64(simd));
> > ++
> > +     printk("  Debug Features: %016"PRIx64" %016"PRIx64"\n",
> > +            boot_cpu_data.dbg64.bits[0], boot_cpu_data.dbg64.bits[1]);
> > +     printk("  Auxiliary Features: %016"PRIx64" %016"PRIx64"\n",
> > +-- 
> > +2.7.4
> > +
> > diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend b/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend
> > new file mode 100644
> > index 0000000..bc3b60d
> > --- /dev/null
> > +++ b/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend
> > @@ -0,0 +1,9 @@
> > +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.14:"
> > +
> > +SRC_URI += " \
> > +    file://0001-arm-Add-Neoverse-N1-processor-identification.patch \
> > +    file://0002-xen-arm-Enable-CPU-Erratum-1165522-for-Neoverse.patch \
> > +    file://0003-xen-arm-Update-silicon-errata.txt-with-the-Neovers-A.patch \
> > +    file://0004-xen-arm-Missing-N1-A76-A75-FP-registers-in-vCPU-cont.patch \
> > +    file://0005-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch \
> > +    "
> > -- 
> > 2.7.4
> > 
> 
> > 
> > 
> > 
> 

> 
> 
> 

