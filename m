Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.5116.1613552701005021495
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Feb 2021 01:05:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=NG6v8NYw;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id h125so1009435lfd.7
        for <meta-arm@lists.yoctoproject.org>; Wed, 17 Feb 2021 01:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Us/SXFepirspXq+T8hq+NXPLhD7yMZjxmFkLbAJAMMo=;
        b=NG6v8NYweRg+xYSJTpSOjtJHzVQAhgK7d3LuzQEa48XNFD1ZucxFeQr4++4hhKqJZg
         pdQmjIBx0k7r3/zhMjyj3aq0FhEQypGlxliqIO5fZAnfERGGO64ncH5loCin4zGxdPIQ
         dCxEcZV4LpT1j3tSLl1R2DdctdkBgBhAhSZLrBUspXnpe5e0lLB3RhFAZYPmlX/6S4ZH
         mg4z/UZ7v1SsjCDy9AA72CmZFIFmgYuDnb+AOiiME9S4TIqX8eUjaP3PWSGiEm+0XGn3
         qJN8OeZ7AL+xQNZOEgdnnmCud0sSzribjM/uBOO7E3RNci1BDrH7mYFc30MT+wxwQBPK
         CheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Us/SXFepirspXq+T8hq+NXPLhD7yMZjxmFkLbAJAMMo=;
        b=hLzBYGWPWaNE4NFHuixCkFBCb1Tr1t/8GIVVOpIpUuybCCebRDyV1KYa5sTJyaujV/
         Dwb0KZt80ohj9g5o/3H7yqiKOnP06JP5yx/+lSRrbpi2wV9OAUjwD+8Xt6Kz5BYu/ZJ6
         26vEgFbZF4drpTJZg4XaCcY5fk8KMZ4G2u87dsjKIA3uEK80yrgUeZiOznC9yC1dkyt1
         WRoMhGx8rMYXPH9QjRpglGCX7+BY62mVs5GzqqpvsNq3MPz/mxcE3cL+DDKUwrYePao7
         AW1QcUBR3+t/6GeX9pxcnxgAEjYIVpxKMGVwf4MdBze3Z5EdtB1hrATItADecetRLsms
         pZoQ==
X-Gm-Message-State: AOAM532IXI82GN3FKAio3zBqmCbW0xLRXorxUD5DLl9kKAOIq/qT3I0/
	WiLcyheirostNnR9cEZfDRzdEi+CJH6GLnF+XBk9Og==
X-Google-Smtp-Source: ABdhPJzpPkiKOlyFznfwiITyG8YVJFsTSwuINBlZ6VDvCCuj4O1Dv4rIxmksaY/3E/k6VrCpwDJD7nTlb8vn9g0hKp8=
X-Received: by 2002:ac2:5222:: with SMTP id i2mr3478346lfl.194.1613552699090;
 Wed, 17 Feb 2021 01:04:59 -0800 (PST)
MIME-Version: 1.0
References: <20210212152216.GA26689@kudzu.us> <CAFA6WYPdLNcied3GLXX3rKVh9foCPWOw7BRTQ=0z=3FKPWjBkA@mail.gmail.com>
 <20210216184535.GA23523@kudzu.us>
In-Reply-To: <20210216184535.GA23523@kudzu.us>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Wed, 17 Feb 2021 14:34:46 +0530
Message-ID: <CAFA6WYNY6m5CRJB5NYN4n1mStk0bVzaTD+hN7wBC6mynF6yjdA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-toolchain: Fix potential runtime crash
To: Jon Mason <jdmason@kudzu.us>
Cc: Denys Dmytriyenko <denis@denix.org>, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Feb 2021 at 00:15, Jon Mason <jdmason@kudzu.us> wrote:
>
> Ccing Denys' correct email address
>
> On Mon, Feb 15, 2021 at 12:06:19PM +0530, Sumit Garg wrote:
> > Hi Jon,
> >
> > On Fri, 12 Feb 2021 at 20:52, Jon Mason <jdmason@kudzu.us> wrote:
> > >
> > > Unless you have a problem with the patch below, I'm inclined to pull
> > > it in ASAP.
> >
> > Sure, please go ahead to pull it in for dunfell.
>
> Done.  Should I do the same for Gatesgarth?
>

Yeah.

-Sumit

> > > However, given that the Arm GCC 9.x has been EoL'ed in
> > > favor of the 10.x code, should we just drop support for it?
> > >
> >
> > Yes, I agree we should drop support for Arm GCC 9.x from master
> > branch. I kept it there earlier during Arm GCC 10.x addition just for
> > the ease of migration.
> >
> > Let me share a patch for this.
>
> Sounds good.
>
> Thanks,
> Jon
>
> >
> > -Sumit
> >
> > > Thanks,
> > > Jon
> > >
> > > ----- Forwarded message from Jon Mason <jon.mason@arm.com> -----
> > >
> > > Date: Thu, 11 Feb 2021 11:36:47 -0500
> > > From: Jon Mason <jon.mason@arm.com>
> > > To: meta-arm@lists.yoctoproject.org
> > > Subject: [meta-arm] [PATCH] arm-toolchain: Fix potential runtime crash
> > >
> > > GCCv9 tree vectorization code is faulty and can cause random crashes at
> > > runtime (when using -O3).  Add the backported patch to address this
> > > issue.
> > >
> > > Change-Id: If7bb0ba0720bab42e7d34f3679d988934f657392
> > > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > > ---
> > >  .../recipes-devtools/gcc/gcc-arm-9.2.inc      |   1 +
> > >  ...-PR-tree-optimization-97236-fix-bad-.patch | 119 ++++++++++++++++++
> > >  2 files changed, 120 insertions(+)
> > >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
> > >
> > > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> > > index 08ad796..6378ecf 100644
> > > --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> > > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> > > @@ -68,6 +68,7 @@ SRC_URI = "\
> > >             file://0035-Fix-for-testsuite-failure.patch \
> > >             file://0036-Re-introduce-spe-commandline-options.patch \
> > >             file://0037-Fix-up-libsanitizer-build-with-master-glibc.patch \
> > > +           file://0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch \
> > >  "
> > >  SRC_URI[md5sum] = "9c570fc4286825b4e6f67b3d34aade23"
> > >
> > > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
> > > new file mode 100644
> > > index 0000000..dc1039d
> > > --- /dev/null
> > > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
> > > @@ -0,0 +1,119 @@
> > > +Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=97b668f9a8c6ec565c278a60e7d1492a6932e409]
> > > +Signed-off-by: Jon Mason <jon.mason@arm.com>
> > > +
> > > +From 97b668f9a8c6ec565c278a60e7d1492a6932e409 Mon Sep 17 00:00:00 2001
> > > +From: Matthias Klose <doko@ubuntu.com>
> > > +Date: Tue, 6 Oct 2020 13:41:37 +0200
> > > +Subject: [PATCH] Backport fix for PR/tree-optimization/97236 - fix bad use of
> > > + VMAT_CONTIGUOUS
> > > +
> > > +This avoids using VMAT_CONTIGUOUS with single-element interleaving
> > > +when using V1mode vectors.  Instead keep VMAT_ELEMENTWISE but
> > > +continue to avoid load-lanes and gathers.
> > > +
> > > +2020-10-01  Richard Biener  <rguenther@suse.de>
> > > +
> > > +       PR tree-optimization/97236
> > > +       * tree-vect-stmts.c (get_group_load_store_type): Keep
> > > +       VMAT_ELEMENTWISE for single-element vectors.
> > > +
> > > +       * gcc.dg/vect/pr97236.c: New testcase.
> > > +
> > > +(cherry picked from commit 1ab88985631dd2c5a5e3b5c0dce47cf8b6ed2f82)
> > > +---
> > > + gcc/testsuite/gcc.dg/vect/pr97236.c | 43 +++++++++++++++++++++++++++++
> > > + gcc/tree-vect-stmts.c               | 20 ++++++--------
> > > + 2 files changed, 52 insertions(+), 11 deletions(-)
> > > + create mode 100644 gcc/testsuite/gcc.dg/vect/pr97236.c
> > > +
> > > +diff --git a/gcc/testsuite/gcc.dg/vect/pr97236.c b/gcc/testsuite/gcc.dg/vect/pr97236.c
> > > +new file mode 100644
> > > +index 000000000000..9d3dc20d953d
> > > +--- /dev/null
> > > ++++ b/gcc/testsuite/gcc.dg/vect/pr97236.c
> > > +@@ -0,0 +1,43 @@
> > > ++typedef unsigned char __uint8_t;
> > > ++typedef __uint8_t uint8_t;
> > > ++typedef struct plane_t {
> > > ++  uint8_t *p_pixels;
> > > ++  int i_lines;
> > > ++  int i_pitch;
> > > ++} plane_t;
> > > ++
> > > ++typedef struct {
> > > ++  plane_t p[5];
> > > ++} picture_t;
> > > ++
> > > ++#define N 4
> > > ++
> > > ++void __attribute__((noipa))
> > > ++picture_Clone(picture_t *picture, picture_t *res)
> > > ++{
> > > ++  for (int i = 0; i < N; i++) {
> > > ++    res->p[i].p_pixels = picture->p[i].p_pixels;
> > > ++    res->p[i].i_lines = picture->p[i].i_lines;
> > > ++    res->p[i].i_pitch = picture->p[i].i_pitch;
> > > ++  }
> > > ++}
> > > ++
> > > ++int
> > > ++main()
> > > ++{
> > > ++  picture_t aaa, bbb;
> > > ++  uint8_t pixels[10] = {1, 1, 1, 1, 1, 1, 1, 1};
> > > ++
> > > ++  for (unsigned i = 0; i < N; i++)
> > > ++    aaa.p[i].p_pixels = pixels;
> > > ++
> > > ++  picture_Clone (&aaa, &bbb);
> > > ++
> > > ++  uint8_t c = 0;
> > > ++  for (unsigned i = 0; i < N; i++)
> > > ++    c += bbb.p[i].p_pixels[0];
> > > ++
> > > ++  if (c != N)
> > > ++    __builtin_abort ();
> > > ++  return 0;
> > > ++}
> > > +diff --git a/gcc/tree-vect-stmts.c b/gcc/tree-vect-stmts.c
> > > +index 507f81b0a0e8..ffbba3441de2 100644
> > > +--- a/gcc/tree-vect-stmts.c
> > > ++++ b/gcc/tree-vect-stmts.c
> > > +@@ -2355,25 +2355,23 @@ get_group_load_store_type (stmt_vec_info stmt_info, tree vectype, bool slp,
> > > +         /* First cope with the degenerate case of a single-element
> > > +            vector.  */
> > > +         if (known_eq (TYPE_VECTOR_SUBPARTS (vectype), 1U))
> > > +-          *memory_access_type = VMAT_CONTIGUOUS;
> > > ++          ;
> > > +
> > > +         /* Otherwise try using LOAD/STORE_LANES.  */
> > > +-        if (*memory_access_type == VMAT_ELEMENTWISE
> > > +-            && (vls_type == VLS_LOAD
> > > +-                ? vect_load_lanes_supported (vectype, group_size, masked_p)
> > > +-                : vect_store_lanes_supported (vectype, group_size,
> > > +-                                              masked_p)))
> > > ++        else if (vls_type == VLS_LOAD
> > > ++                 ? vect_load_lanes_supported (vectype, group_size, masked_p)
> > > ++                 : vect_store_lanes_supported (vectype, group_size,
> > > ++                                               masked_p))
> > > +           {
> > > +             *memory_access_type = VMAT_LOAD_STORE_LANES;
> > > +             overrun_p = would_overrun_p;
> > > +           }
> > > +
> > > +         /* If that fails, try using permuting loads.  */
> > > +-        if (*memory_access_type == VMAT_ELEMENTWISE
> > > +-            && (vls_type == VLS_LOAD
> > > +-                ? vect_grouped_load_supported (vectype, single_element_p,
> > > +-                                               group_size)
> > > +-                : vect_grouped_store_supported (vectype, group_size)))
> > > ++        else if (vls_type == VLS_LOAD
> > > ++                 ? vect_grouped_load_supported (vectype, single_element_p,
> > > ++                                                group_size)
> > > ++                 : vect_grouped_store_supported (vectype, group_size))
> > > +           {
> > > +             *memory_access_type = VMAT_CONTIGUOUS_PERMUTE;
> > > +             overrun_p = would_overrun_p;
> > > +--
> > > +2.20.1
> > > +
> > > --
> > > 2.17.1
> > >
> > >
> > >
> > > 
> > >
> > >
> > >
> > > ----- End forwarded message -----
