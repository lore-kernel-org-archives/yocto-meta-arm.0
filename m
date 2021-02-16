Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web08.12609.1613501138490584200
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Feb 2021 10:45:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=KGuF/GGO;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f181.google.com with SMTP id h8so10396119qkk.6
        for <meta-arm@lists.yoctoproject.org>; Tue, 16 Feb 2021 10:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+OmihNiufij0ov5OisKZCcRXmecXUQLqerQ8e9oS/Cg=;
        b=KGuF/GGO1hOHbPPBuftWY1Wk9npxe97GlnE1xO5pCxGqJkjOC7JXprefgaWXIDfX+2
         B/TsCaXhz4+Gcc+Ig+1ktL08UyHzGIyxvTfEMXhouOiIJz8pUNeTHYtNQwxcpqUj3Wry
         gsOPoYIwY6rHOU01lDIbgLUMN1zeE358Gb1D32eIYVRwE4WhvyvHHKT5asWDilGiss0r
         cf618xuves1zSkOPURPsktzyngkgBU4ewz9/Qt93V89nIO7Q/gCEKqG4Lg2Q3WLk+zNJ
         8K3BouLyoGt71DFXTp19AZKm9ib1m+wD/2IJ2riTR67yBIvCSQQwhaODExHksFwcW4Tg
         PCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+OmihNiufij0ov5OisKZCcRXmecXUQLqerQ8e9oS/Cg=;
        b=BIzZ20gaHJc5nJ7t4ST7ZTdtPGfDLb9Oce2408zQ9LHtbIJkSnpfTZ/bIm/Q9WnOOs
         p9A8NNaTUfBpNIgfjea4mWTfF8RSazBu0BRnqXCFPkCimFGUmJdRtX572xlaf3YfLNip
         K51zD5n40puXOduRq9wW5/Jtj1aZm7umvTFMg5ZaCpDsk+6ahSrfFszN1aWYcW8XcHbz
         bIdAhiklqF+yesMHcjcf2k5o7+O4krIhtiEgmTmI1kqCd+Sr/GuynzjQtNfTcjVwEQi8
         TIiwsJvpnsNcuBejCKoQu0JxlIHJFEbU8HHMH2G3JHLt7tiXhWhT5DSbqZWLByqpaasd
         SDCg==
X-Gm-Message-State: AOAM531sUJqa8eQP83tudTZxWgnKCURcT88aET8KGT90/eMRWujVXxY0
	GUlvejwzhlPV6zBcVTLl0N2xQg==
X-Google-Smtp-Source: ABdhPJyRNs3eAQ+x0AistNtnAhTQUmKnZhj8HzADSiix096UsQopqg91xMZjV+kq0nmeUCXORRmIzg==
X-Received: by 2002:a05:620a:98d:: with SMTP id x13mr21185040qkx.432.1613501137686;
        Tue, 16 Feb 2021 10:45:37 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:eddb:1a10:d920:25bc])
        by smtp.gmail.com with ESMTPSA id u7sm13102188qta.75.2021.02.16.10.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 10:45:37 -0800 (PST)
Date: Tue, 16 Feb 2021 13:45:35 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Denys Dmytriyenko <denis@denix.org>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-toolchain: Fix potential runtime crash
Message-ID: <20210216184535.GA23523@kudzu.us>
References: <20210212152216.GA26689@kudzu.us>
 <CAFA6WYPdLNcied3GLXX3rKVh9foCPWOw7BRTQ=0z=3FKPWjBkA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFA6WYPdLNcied3GLXX3rKVh9foCPWOw7BRTQ=0z=3FKPWjBkA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ccing Denys' correct email address

On Mon, Feb 15, 2021 at 12:06:19PM +0530, Sumit Garg wrote:
> Hi Jon,
> 
> On Fri, 12 Feb 2021 at 20:52, Jon Mason <jdmason@kudzu.us> wrote:
> >
> > Unless you have a problem with the patch below, I'm inclined to pull
> > it in ASAP.
> 
> Sure, please go ahead to pull it in for dunfell.

Done.  Should I do the same for Gatesgarth?  

> > However, given that the Arm GCC 9.x has been EoL'ed in
> > favor of the 10.x code, should we just drop support for it?
> >
> 
> Yes, I agree we should drop support for Arm GCC 9.x from master
> branch. I kept it there earlier during Arm GCC 10.x addition just for
> the ease of migration.
> 
> Let me share a patch for this.

Sounds good.

Thanks,
Jon

> 
> -Sumit
> 
> > Thanks,
> > Jon
> >
> > ----- Forwarded message from Jon Mason <jon.mason@arm.com> -----
> >
> > Date: Thu, 11 Feb 2021 11:36:47 -0500
> > From: Jon Mason <jon.mason@arm.com>
> > To: meta-arm@lists.yoctoproject.org
> > Subject: [meta-arm] [PATCH] arm-toolchain: Fix potential runtime crash
> >
> > GCCv9 tree vectorization code is faulty and can cause random crashes at
> > runtime (when using -O3).  Add the backported patch to address this
> > issue.
> >
> > Change-Id: If7bb0ba0720bab42e7d34f3679d988934f657392
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > ---
> >  .../recipes-devtools/gcc/gcc-arm-9.2.inc      |   1 +
> >  ...-PR-tree-optimization-97236-fix-bad-.patch | 119 ++++++++++++++++++
> >  2 files changed, 120 insertions(+)
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
> >
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> > index 08ad796..6378ecf 100644
> > --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> > @@ -68,6 +68,7 @@ SRC_URI = "\
> >             file://0035-Fix-for-testsuite-failure.patch \
> >             file://0036-Re-introduce-spe-commandline-options.patch \
> >             file://0037-Fix-up-libsanitizer-build-with-master-glibc.patch \
> > +           file://0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch \
> >  "
> >  SRC_URI[md5sum] = "9c570fc4286825b4e6f67b3d34aade23"
> >
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
> > new file mode 100644
> > index 0000000..dc1039d
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
> > @@ -0,0 +1,119 @@
> > +Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=97b668f9a8c6ec565c278a60e7d1492a6932e409]
> > +Signed-off-by: Jon Mason <jon.mason@arm.com>
> > +
> > +From 97b668f9a8c6ec565c278a60e7d1492a6932e409 Mon Sep 17 00:00:00 2001
> > +From: Matthias Klose <doko@ubuntu.com>
> > +Date: Tue, 6 Oct 2020 13:41:37 +0200
> > +Subject: [PATCH] Backport fix for PR/tree-optimization/97236 - fix bad use of
> > + VMAT_CONTIGUOUS
> > +
> > +This avoids using VMAT_CONTIGUOUS with single-element interleaving
> > +when using V1mode vectors.  Instead keep VMAT_ELEMENTWISE but
> > +continue to avoid load-lanes and gathers.
> > +
> > +2020-10-01  Richard Biener  <rguenther@suse.de>
> > +
> > +       PR tree-optimization/97236
> > +       * tree-vect-stmts.c (get_group_load_store_type): Keep
> > +       VMAT_ELEMENTWISE for single-element vectors.
> > +
> > +       * gcc.dg/vect/pr97236.c: New testcase.
> > +
> > +(cherry picked from commit 1ab88985631dd2c5a5e3b5c0dce47cf8b6ed2f82)
> > +---
> > + gcc/testsuite/gcc.dg/vect/pr97236.c | 43 +++++++++++++++++++++++++++++
> > + gcc/tree-vect-stmts.c               | 20 ++++++--------
> > + 2 files changed, 52 insertions(+), 11 deletions(-)
> > + create mode 100644 gcc/testsuite/gcc.dg/vect/pr97236.c
> > +
> > +diff --git a/gcc/testsuite/gcc.dg/vect/pr97236.c b/gcc/testsuite/gcc.dg/vect/pr97236.c
> > +new file mode 100644
> > +index 000000000000..9d3dc20d953d
> > +--- /dev/null
> > ++++ b/gcc/testsuite/gcc.dg/vect/pr97236.c
> > +@@ -0,0 +1,43 @@
> > ++typedef unsigned char __uint8_t;
> > ++typedef __uint8_t uint8_t;
> > ++typedef struct plane_t {
> > ++  uint8_t *p_pixels;
> > ++  int i_lines;
> > ++  int i_pitch;
> > ++} plane_t;
> > ++
> > ++typedef struct {
> > ++  plane_t p[5];
> > ++} picture_t;
> > ++
> > ++#define N 4
> > ++
> > ++void __attribute__((noipa))
> > ++picture_Clone(picture_t *picture, picture_t *res)
> > ++{
> > ++  for (int i = 0; i < N; i++) {
> > ++    res->p[i].p_pixels = picture->p[i].p_pixels;
> > ++    res->p[i].i_lines = picture->p[i].i_lines;
> > ++    res->p[i].i_pitch = picture->p[i].i_pitch;
> > ++  }
> > ++}
> > ++
> > ++int
> > ++main()
> > ++{
> > ++  picture_t aaa, bbb;
> > ++  uint8_t pixels[10] = {1, 1, 1, 1, 1, 1, 1, 1};
> > ++
> > ++  for (unsigned i = 0; i < N; i++)
> > ++    aaa.p[i].p_pixels = pixels;
> > ++
> > ++  picture_Clone (&aaa, &bbb);
> > ++
> > ++  uint8_t c = 0;
> > ++  for (unsigned i = 0; i < N; i++)
> > ++    c += bbb.p[i].p_pixels[0];
> > ++
> > ++  if (c != N)
> > ++    __builtin_abort ();
> > ++  return 0;
> > ++}
> > +diff --git a/gcc/tree-vect-stmts.c b/gcc/tree-vect-stmts.c
> > +index 507f81b0a0e8..ffbba3441de2 100644
> > +--- a/gcc/tree-vect-stmts.c
> > ++++ b/gcc/tree-vect-stmts.c
> > +@@ -2355,25 +2355,23 @@ get_group_load_store_type (stmt_vec_info stmt_info, tree vectype, bool slp,
> > +         /* First cope with the degenerate case of a single-element
> > +            vector.  */
> > +         if (known_eq (TYPE_VECTOR_SUBPARTS (vectype), 1U))
> > +-          *memory_access_type = VMAT_CONTIGUOUS;
> > ++          ;
> > +
> > +         /* Otherwise try using LOAD/STORE_LANES.  */
> > +-        if (*memory_access_type == VMAT_ELEMENTWISE
> > +-            && (vls_type == VLS_LOAD
> > +-                ? vect_load_lanes_supported (vectype, group_size, masked_p)
> > +-                : vect_store_lanes_supported (vectype, group_size,
> > +-                                              masked_p)))
> > ++        else if (vls_type == VLS_LOAD
> > ++                 ? vect_load_lanes_supported (vectype, group_size, masked_p)
> > ++                 : vect_store_lanes_supported (vectype, group_size,
> > ++                                               masked_p))
> > +           {
> > +             *memory_access_type = VMAT_LOAD_STORE_LANES;
> > +             overrun_p = would_overrun_p;
> > +           }
> > +
> > +         /* If that fails, try using permuting loads.  */
> > +-        if (*memory_access_type == VMAT_ELEMENTWISE
> > +-            && (vls_type == VLS_LOAD
> > +-                ? vect_grouped_load_supported (vectype, single_element_p,
> > +-                                               group_size)
> > +-                : vect_grouped_store_supported (vectype, group_size)))
> > ++        else if (vls_type == VLS_LOAD
> > ++                 ? vect_grouped_load_supported (vectype, single_element_p,
> > ++                                                group_size)
> > ++                 : vect_grouped_store_supported (vectype, group_size))
> > +           {
> > +             *memory_access_type = VMAT_CONTIGUOUS_PERMUTE;
> > +             overrun_p = would_overrun_p;
> > +--
> > +2.20.1
> > +
> > --
> > 2.17.1
> >
> >
> >
> > 
> >
> >
> >
> > ----- End forwarded message -----
