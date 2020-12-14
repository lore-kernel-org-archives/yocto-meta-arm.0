Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web08.2912.1607977579547174145
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Dec 2020 12:26:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=GessMGc+;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id c14so12897381qtn.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 14 Dec 2020 12:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3dg6HF1NSU5ni//UA1vskd2Rxkh4F3lhqEA+REfQ8J8=;
        b=GessMGc+WhDTYo1qFfhOtO/i1UTBH8gHlZYUR/BG0ImJ7RiWfSAppKY9Tre4cSTDx1
         d7V68ap7yGJRrbGVYFlD4dMv8WKqU/2e4sEBJhEMt3gow5hv1z5iA1TANyw7wxHVbTu1
         j/T/MFJX8fjQZgO8L4dyrV4xsy95ztdRpxra8wLxOpwogUVdj5LV/C+i8EtoOfm0KGjN
         D0kBkp6gMo18VJokkT8KOFJWUSVmPM/7vLKkBGJx5Qg0SlEjK4iG0JFbZGmKjY1+1xKv
         zKoS4vF51kiIGc9/9FXj1aRwRMxNTF3v1OiEy2HWG7Wn+ja8/ibgP8pyzfW1u3NStc9w
         KDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3dg6HF1NSU5ni//UA1vskd2Rxkh4F3lhqEA+REfQ8J8=;
        b=ZL0zsQ4Wmq3l83F5rElLkTzsx1pMg7cWNRov7+lHVdY1OHemBox4XCgW2krCQVg4Ke
         pzr/XLsjvK1R8qjLHJX45Q9QaXKuExu9+MANXdxOJPdmoaNT4+OrwdGYRhQcRUrdOEaR
         ADqlsEXWStL9uz/Ee9R6LaOciWPhB9yKsuyEVla9d1k4UuSLznHanFRoUOrUCjbEqbaZ
         pLFkSz/mCfvd0Z1U9RqBVMQNBrbiMC3aQBSSXu3mf96i+nMXZF9UCNXtbAxSZikjOvfP
         Pyy7wxaAik6dJaO6f/Lx+aN6RuHuzabq+7G5SxsObP0AQUeZl4mHf5hFFZ91H6BUDQCB
         Va/w==
X-Gm-Message-State: AOAM532Hk9q1lax0cS843fHrKgsN1i1ldE5YM/Xq0rYdJPaBbBDP+0xB
	G8Vgpip93fPQ4c0WyjrY8ff4yQ==
X-Google-Smtp-Source: ABdhPJyW2rcrHYR//PerG1nvivDca29wqZtBpKDc2oWhcPbsGsVKOP857880x2rcoTZURu6UxXbldQ==
X-Received: by 2002:ac8:6e83:: with SMTP id c3mr18418506qtv.318.1607977578609;
        Mon, 14 Dec 2020 12:26:18 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:4438:99f1:e83e:f284])
        by smtp.gmail.com with ESMTPSA id s68sm15408156qkc.43.2020.12.14.12.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 12:26:18 -0800 (PST)
Date: Mon, 14 Dec 2020 15:26:16 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Brett Warren <brett.warren@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 2/2] arm/trusted-firmware-a: -Wtautological triggers removed
Message-ID: <20201214202615.GA32195@kudzu.us>
References: <20201213155741.11452-1-brett.warren@arm.com>
 <20201213155741.11452-2-brett.warren@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201213155741.11452-2-brett.warren@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 13, 2020 at 03:57:41PM +0000, Brett Warren wrote:
> When compiling under clang, certain lines triggered
> -Wtautological errors. Cosmetic modifications were made
> via patches to mitigate this.
> 
> Change-Id: I3d17dd5102267e03a8b7d157e66e0788b542bdd8
> Signed-off-by: Brett Warren <brett.warren@arm.com>
> ---
>  ...-PMF_STOTE_ENABLE-pass-Wtautological.patch | 31 +++++++++++++++++++
>  ...tables-v2-remove-tautological-assert.patch | 31 +++++++++++++++++++
>  .../trusted-firmware-a/trusted-firmware-a.inc |  5 +++
>  3 files changed, 67 insertions(+)
>  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0001-pmf.h-made-PMF_STOTE_ENABLE-pass-Wtautological.patch
>  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0004-xlat-tables-v2-remove-tautological-assert.patch
> 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-pmf.h-made-PMF_STOTE_ENABLE-pass-Wtautological.patch b/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-pmf.h-made-PMF_STOTE_ENABLE-pass-Wtautological.patch
> new file mode 100644
> index 0000000..a28b9fe
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-pmf.h-made-PMF_STOTE_ENABLE-pass-Wtautological.patch
> @@ -0,0 +1,31 @@
> +From c9209fa0f474d41bc5ecf2b988ab404123038c1b Mon Sep 17 00:00:00 2001
> +From: Brett Warren <brett.warren@arm.com>
> +Date: Tue, 3 Nov 2020 13:34:26 +0000
> +Subject: [PATCH 1/3] pmf.h: made PMF_STOTE_ENABLE pass -Wtautological
> +
> +When compiling with clang, PMF_STORE_ENABLE triggers
> +-Wtautological-constant-compare. To mitigate, the definition
> +is modified cosmetically to not trigger this error.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Brett Warren <brett.warren@arm.com>
> +---
> + include/lib/pmf/pmf.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/include/lib/pmf/pmf.h b/include/lib/pmf/pmf.h
> +index df7c9ff31..baa2dfd60 100644
> +--- a/include/lib/pmf/pmf.h
> ++++ b/include/lib/pmf/pmf.h
> +@@ -25,7 +25,7 @@
> + /*
> +  * Flags passed to PMF_REGISTER_SERVICE
> +  */
> +-#define PMF_STORE_ENABLE	(1 << 0)
> ++#define PMF_STORE_ENABLE	1
> + #define PMF_DUMP_ENABLE		(1 << 1)
> + 
> + /*
> +-- 
> +2.17.1
> +
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0004-xlat-tables-v2-remove-tautological-assert.patch b/meta-arm/recipes-bsp/trusted-firmware-a/files/0004-xlat-tables-v2-remove-tautological-assert.patch
> new file mode 100644
> index 0000000..1c2c90c
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/0004-xlat-tables-v2-remove-tautological-assert.patch
> @@ -0,0 +1,31 @@
> +From a0b72074ee4cfdf0ff3b807b01a962898761def4 Mon Sep 17 00:00:00 2001
> +From: Brett Warren <brett.warren@arm.com>
> +Date: Fri, 27 Nov 2020 10:29:48 +0000
> +Subject: [PATCH 2/3] xlat_tables_v2: remove tautological assert

Where is 3/3?

> +
> +When compiling with clang for aarch32, an assert triggered
> +-Wtautological error. This assertion is removed, as
> +this means there is no way for it to resolve as false anyway.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Brett Warren <brett.warren@arm.com>
> +---
> + lib/xlat_tables_v2/aarch32/xlat_tables_arch.c | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/lib/xlat_tables_v2/aarch32/xlat_tables_arch.c b/lib/xlat_tables_v2/aarch32/xlat_tables_arch.c
> +index b69c6702b..52a75b37a 100644
> +--- a/lib/xlat_tables_v2/aarch32/xlat_tables_arch.c
> ++++ b/lib/xlat_tables_v2/aarch32/xlat_tables_arch.c
> +@@ -203,8 +203,6 @@ void setup_mmu_cfg(uint64_t *params, unsigned int flags,
> + 
> + 		assert(virtual_addr_space_size >=
> + 			xlat_get_min_virt_addr_space_size());
> +-		assert(virtual_addr_space_size <=
> +-			MAX_VIRT_ADDR_SPACE_SIZE);
> + 		assert(IS_POWER_OF_TWO(virtual_addr_space_size));
> + 
> + 		/*
> +-- 
> +2.17.1
> +
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index bed2bad..21df3a0 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -48,6 +48,11 @@ LIC_FILES_CHKSUM_append = "${@bb.utils.contains('TFA_MBEDTLS', '1', ' ${LIC_FILE
>  # add mbed TLS to version
>  SRCREV_FORMAT_append = "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbedtls', '', d)}"
>  
> +SRC_URI_append = " \
> +    file://0001-pmf.h-made-PMF_STOTE_ENABLE-pass-Wtautological.patch  \
> +    file://0004-xlat-tables-v2-remove-tautological-assert.patch \

Above said 2/3, but this says 4.  You should rerun `git format-patch`
so that it only spits out 2 (if that is all that is really needed).

Thanks,
Jon

> +    "
> +
>  # U-boot support (set TFA_UBOOT to 1 to activate)
>  # When U-Boot support is activated BL33 is activated with u-boot.bin file
>  TFA_UBOOT ?= "0"
> -- 
> 2.17.1
> 

> 
> 
> 

