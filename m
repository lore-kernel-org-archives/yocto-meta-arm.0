Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web08.12399.1614953857447016005
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Mar 2021 06:17:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=0Z9ZfZ6o;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id cw15so1005887qvb.11
        for <meta-arm@lists.yoctoproject.org>; Fri, 05 Mar 2021 06:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1RnL1GuF1LQDEmiUCV235g/SExjMUkaT8vZYPxEbhuM=;
        b=0Z9ZfZ6o+kCaMyMK0H7xZB76CyxOfZXiVeMcGwcLdLFKWmYjkJzQ76Pj+Fh6UJuo9z
         neoidhkaInBuZDDT1e4xBKY6lPVabDzNSFr2k1QyBFJ2JcinX5Mpwt+FUfaTGQaFn8Ie
         beNd5RlszNqw5P1nzkxkttA2YCEGPQXIHtbqBDa+cbghISPzVpm3yiocFyHFKxdq9DfL
         3xNxWFv/FVZiwOliDl8oSY0MCPb8A7ZCIg1Tp04bwqs1mIdOrHsCrZbXNsdI0r+tNNTO
         g3Wk70p/vSrn8OyYmfAOJbC4YJf85FuEjWBkfpBkG+ffsBz4Qb+K/oph9zGwWeZY2F2m
         5jOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1RnL1GuF1LQDEmiUCV235g/SExjMUkaT8vZYPxEbhuM=;
        b=qkd6fgAZw+/bgQ5hD9nz9aDYXWPyDStfZu0qNV3F15f5m8by+yfS6azQ4bVeryvseL
         BiMIGgCYnCXhY2D0sdN10ZjqFMfYynfD5p3rVH+0bAck59+XH+QgFs648YA7pIbr9w4a
         dYXnOkReEhWL6/j5kdHni8XMnv8u0U1M5hEiFzj1z7MPDmw7jqJ6Cu3u89hGuNib+p5A
         Oo4gn98Lj6e7Ii59kG5hAxkU54zsnbnUyjMYuQYH6/CydKqZqudKH1CmZUz5F8H4HtCe
         uWyse8KI8BKHNaBFUqfqbKTu8FivrMfZBKbenWPbo8hMOL/O1ilKxucNp0AXza/AK+5C
         sMkA==
X-Gm-Message-State: AOAM530Vq0sjzHBGf236abi4FN27pQz+B0gmfQLKHSMjbAHOnKckkZbE
	M+c6+ewDwfxJsAtWvSNA4SgDHQ==
X-Google-Smtp-Source: ABdhPJzXs9qvTGf/Sl92UM7TI3YT4ZaIB9YWtyChZj7/MotA7JMMQsnUJxF5gaHGbhabllXQgAKMJQ==
X-Received: by 2002:a0c:b92c:: with SMTP id u44mr9313626qvf.34.1614953856495;
        Fri, 05 Mar 2021 06:17:36 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:20a3:3a4f:ed63:83f])
        by smtp.gmail.com with ESMTPSA id r7sm1918351qtd.49.2021.03.05.06.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:17:36 -0800 (PST)
Date: Fri, 5 Mar 2021 09:17:34 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Richard Neill <richard.neill@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-autonomy/linux-arm-autonomy: Add Xen per-cpu address translation patch
Message-ID: <20210305141734.GA17134@kudzu.us>
References: <20210302172832.3200401-1-richard.neill@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210302172832.3200401-1-richard.neill@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 02, 2021 at 05:28:32PM +0000, Richard Neill wrote:
> Adds a kernel patch to avoid Xen guest initialisation failure when converting a
> virtual address to a frame number when the initial address space has a
> non-contiguous physical layout.
> 
> The patch is mainlined for kernel versions >= 5.9, so we only apply it for
> earlier versions.
> 
> Issue-Id: SCM-1910
> Signed-off-by: Richard Neill <richard.neill@arm.com>
> Change-Id: I3fd2aef88f57c928400389b6c4bb0b5eb5666e48
> ---

Applied to the master branch

Thanks,
Jon

>  ...x-to-convert-percpu-address-to-gfn-c.patch | 147 ++++++++++++++++++
>  .../linux/linux-arm-autonomy.inc              |   5 +
>  2 files changed, 152 insertions(+)
>  create mode 100644 meta-arm-autonomy/recipes-kernel/linux/files/0001-arm-arm64-xen-Fix-to-convert-percpu-address-to-gfn-c.patch
> 
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/files/0001-arm-arm64-xen-Fix-to-convert-percpu-address-to-gfn-c.patch b/meta-arm-autonomy/recipes-kernel/linux/files/0001-arm-arm64-xen-Fix-to-convert-percpu-address-to-gfn-c.patch
> new file mode 100644
> index 00000000..79e88d74
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-kernel/linux/files/0001-arm-arm64-xen-Fix-to-convert-percpu-address-to-gfn-c.patch
> @@ -0,0 +1,147 @@
> +From 5a0677110b73dd3e1766f89159701bfe8ac06808 Mon Sep 17 00:00:00 2001
> +From: Masami Hiramatsu <mhiramat@kernel.org>
> +Date: Tue, 6 Oct 2020 15:49:31 +0900
> +Subject: [PATCH] arm/arm64: xen: Fix to convert percpu address to gfn
> + correctly
> +
> +Use per_cpu_ptr_to_phys() instead of virt_to_phys() for per-cpu
> +address conversion.
> +
> +In xen_starting_cpu(), per-cpu xen_vcpu_info address is converted
> +to gfn by virt_to_gfn() macro. However, since the virt_to_gfn(v)
> +assumes the given virtual address is in linear mapped kernel memory
> +area, it can not convert the per-cpu memory if it is allocated on
> +vmalloc area.
> +
> +This depends on CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK.
> +If it is enabled, the first chunk of percpu memory is linear mapped.
> +In the other case, that is allocated from vmalloc area. Moreover,
> +if the first chunk of percpu has run out until allocating
> +xen_vcpu_info, it will be allocated on the 2nd chunk, which is
> +based on kernel memory or vmalloc memory (depends on
> +CONFIG_NEED_PER_CPU_KM).
> +
> +Without this fix and kernel configured to use vmalloc area for
> +the percpu memory, the Dom0 kernel will fail to boot with following
> +errors.
> +
> +[    0.466172] Xen: initializing cpu0
> +[    0.469601] ------------[ cut here ]------------
> +[    0.474295] WARNING: CPU: 0 PID: 1 at arch/arm64/xen/../../arm/xen/enlighten.c:153 xen_starting_cpu+0x160/0x180
> +[    0.484435] Modules linked in:
> +[    0.487565] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.9.0-rc4+ #4
> +[    0.493895] Hardware name: Socionext Developer Box (DT)
> +[    0.499194] pstate: 00000005 (nzcv daif -PAN -UAO BTYPE=--)
> +[    0.504836] pc : xen_starting_cpu+0x160/0x180
> +[    0.509263] lr : xen_starting_cpu+0xb0/0x180
> +[    0.513599] sp : ffff8000116cbb60
> +[    0.516984] x29: ffff8000116cbb60 x28: ffff80000abec000
> +[    0.522366] x27: 0000000000000000 x26: 0000000000000000
> +[    0.527754] x25: ffff80001156c000 x24: fffffdffbfcdb600
> +[    0.533129] x23: 0000000000000000 x22: 0000000000000000
> +[    0.538511] x21: ffff8000113a99c8 x20: ffff800010fe4f68
> +[    0.543892] x19: ffff8000113a9988 x18: 0000000000000010
> +[    0.549274] x17: 0000000094fe0f81 x16: 00000000deadbeef
> +[    0.554655] x15: ffffffffffffffff x14: 0720072007200720
> +[    0.560037] x13: 0720072007200720 x12: 0720072007200720
> +[    0.565418] x11: 0720072007200720 x10: 0720072007200720
> +[    0.570801] x9 : ffff8000100fbdc0 x8 : ffff800010715208
> +[    0.576182] x7 : 0000000000000054 x6 : ffff00001b790f00
> +[    0.581564] x5 : ffff800010bbf880 x4 : 0000000000000000
> +[    0.586945] x3 : 0000000000000000 x2 : ffff80000abec000
> +[    0.592327] x1 : 000000000000002f x0 : 0000800000000000
> +[    0.597716] Call trace:
> +[    0.600232]  xen_starting_cpu+0x160/0x180
> +[    0.604309]  cpuhp_invoke_callback+0xac/0x640
> +[    0.608736]  cpuhp_issue_call+0xf4/0x150
> +[    0.612728]  __cpuhp_setup_state_cpuslocked+0x128/0x2c8
> +[    0.618030]  __cpuhp_setup_state+0x84/0xf8
> +[    0.622192]  xen_guest_init+0x324/0x364
> +[    0.626097]  do_one_initcall+0x54/0x250
> +[    0.630003]  kernel_init_freeable+0x12c/0x2c8
> +[    0.634428]  kernel_init+0x1c/0x128
> +[    0.637988]  ret_from_fork+0x10/0x18
> +[    0.641635] ---[ end trace d95b5309a33f8b27 ]---
> +[    0.646337] ------------[ cut here ]------------
> +[    0.651005] kernel BUG at arch/arm64/xen/../../arm/xen/enlighten.c:158!
> +[    0.657697] Internal error: Oops - BUG: 0 [#1] SMP
> +[    0.662548] Modules linked in:
> +[    0.665676] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W         5.9.0-rc4+ #4
> +[    0.673398] Hardware name: Socionext Developer Box (DT)
> +[    0.678695] pstate: 00000005 (nzcv daif -PAN -UAO BTYPE=--)
> +[    0.684338] pc : xen_starting_cpu+0x178/0x180
> +[    0.688765] lr : xen_starting_cpu+0x144/0x180
> +[    0.693188] sp : ffff8000116cbb60
> +[    0.696573] x29: ffff8000116cbb60 x28: ffff80000abec000
> +[    0.701955] x27: 0000000000000000 x26: 0000000000000000
> +[    0.707344] x25: ffff80001156c000 x24: fffffdffbfcdb600
> +[    0.712718] x23: 0000000000000000 x22: 0000000000000000
> +[    0.718107] x21: ffff8000113a99c8 x20: ffff800010fe4f68
> +[    0.723481] x19: ffff8000113a9988 x18: 0000000000000010
> +[    0.728863] x17: 0000000094fe0f81 x16: 00000000deadbeef
> +[    0.734245] x15: ffffffffffffffff x14: 0720072007200720
> +[    0.739626] x13: 0720072007200720 x12: 0720072007200720
> +[    0.745008] x11: 0720072007200720 x10: 0720072007200720
> +[    0.750390] x9 : ffff8000100fbdc0 x8 : ffff800010715208
> +[    0.755771] x7 : 0000000000000054 x6 : ffff00001b790f00
> +[    0.761153] x5 : ffff800010bbf880 x4 : 0000000000000000
> +[    0.766534] x3 : 0000000000000000 x2 : 00000000deadbeef
> +[    0.771916] x1 : 00000000deadbeef x0 : ffffffffffffffea
> +[    0.777304] Call trace:
> +[    0.779819]  xen_starting_cpu+0x178/0x180
> +[    0.783898]  cpuhp_invoke_callback+0xac/0x640
> +[    0.788325]  cpuhp_issue_call+0xf4/0x150
> +[    0.792317]  __cpuhp_setup_state_cpuslocked+0x128/0x2c8
> +[    0.797619]  __cpuhp_setup_state+0x84/0xf8
> +[    0.801779]  xen_guest_init+0x324/0x364
> +[    0.805683]  do_one_initcall+0x54/0x250
> +[    0.809590]  kernel_init_freeable+0x12c/0x2c8
> +[    0.814016]  kernel_init+0x1c/0x128
> +[    0.817583]  ret_from_fork+0x10/0x18
> +[    0.821226] Code: d0006980 f9427c00 cb000300 17ffffea (d4210000)
> +[    0.827415] ---[ end trace d95b5309a33f8b28 ]---
> +[    0.832076] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> +[    0.839815] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
> +
> +Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
> +Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> +Link: https://lore.kernel.org/r/160196697165.60224.17470743378683334995.stgit@devnote2
> +Signed-off-by: Juergen Gross <jgross@suse.com>
> +
> +Upstream-Status: Backport
> +Signed-off-by: Richard Neill <richard.neill@arm.com>
> +---
> + arch/arm/xen/enlighten.c | 2 +-
> + include/xen/arm/page.h   | 3 +++
> + 2 files changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> +index e93145d72c26..a6ab3689b2f4 100644
> +--- a/arch/arm/xen/enlighten.c
> ++++ b/arch/arm/xen/enlighten.c
> +@@ -150,7 +150,7 @@ static int xen_starting_cpu(unsigned int cpu)
> + 	pr_info("Xen: initializing cpu%d\n", cpu);
> + 	vcpup = per_cpu_ptr(xen_vcpu_info, cpu);
> + 
> +-	info.mfn = virt_to_gfn(vcpup);
> ++	info.mfn = percpu_to_gfn(vcpup);
> + 	info.offset = xen_offset_in_page(vcpup);
> + 
> + 	err = HYPERVISOR_vcpu_op(VCPUOP_register_vcpu_info, xen_vcpu_nr(cpu),
> +diff --git a/include/xen/arm/page.h b/include/xen/arm/page.h
> +index 39df751d0dc4..ac1b65470563 100644
> +--- a/include/xen/arm/page.h
> ++++ b/include/xen/arm/page.h
> +@@ -83,6 +83,9 @@ static inline unsigned long bfn_to_pfn(unsigned long bfn)
> + 	})
> + #define gfn_to_virt(m)		(__va(gfn_to_pfn(m) << XEN_PAGE_SHIFT))
> + 
> ++#define percpu_to_gfn(v)	\
> ++	(pfn_to_gfn(per_cpu_ptr_to_phys(v) >> XEN_PAGE_SHIFT))
> ++
> + /* Only used in PV code. But ARM guests are always HVM. */
> + static inline xmaddr_t arbitrary_virt_to_machine(void *vaddr)
> + {
> +-- 
> +2.25.1
> +
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> index 978daf3b..57e44ceb 100644
> --- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> +++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> @@ -40,6 +40,11 @@ python() {
>      kernelVersion = d.getVar('LINUX_VERSION')
>      pn = d.getVar('PN')
>  
> +    if kernelVersion and LooseVersion(kernelVersion) < '5.9' \
> +       and pn != 'linux-libc-headers' \
> +       and oe.utils.any_distro_features(d, "arm-autonomy-host arm-autonomy-guest"):
> +        d.appendVar('SRC_URI', ' file://files/0001-arm-arm64-xen-Fix-to-convert-percpu-address-to-gfn-c.patch' )
> +
>      if kernelVersion and LooseVersion(kernelVersion) < '5.10':
>          if oe.utils.any_distro_features(d, "arm-autonomy-host arm-autonomy-guest"):
>              d.appendVar('SRC_URI', ' file://files/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch' )
> -- 
> 2.25.1
> 

> 
> 
> 

