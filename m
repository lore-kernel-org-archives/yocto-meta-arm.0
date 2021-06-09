Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.6380.1623237680815483381
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Jun 2021 04:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=V09o22ug;
 spf=pass (domain: burtonini.com, ip: 209.85.221.48, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f48.google.com with SMTP id a11so23180566wrt.13
        for <meta-arm@lists.yoctoproject.org>; Wed, 09 Jun 2021 04:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=NNE8frVZQ+ED375gGwfmgxJpEswJ/LmwIhbQoQ0cLZg=;
        b=V09o22ugLPWRcgNP6CCpAHYJH8XBIIRSU/2NnkGL/VOeAwkvWl/jr30PLu65UTc0PA
         qLv01I5bSsP1XQ2DI91+ckkGOGudhvoEb+PXOf4f1YHfl8aytp7EXcCguoJfQmSQz73x
         kX4GcNgrHZgIZK5NTslFcPD+rD2Q45N7lcSekT4iKwSHlHk6AwOmInLnqgNbLlCC057Q
         Vj/tTTdgvVNMAQpKW62YVXuPZyDucCQogvaYaG524CMsBY7cxKfVA+gfVE+RnpWcjC9A
         CjtBhxML14OrBowaLk25cgTjQR70lpfsHe65IB+LFjBf6tJsSEx338BKLIB2357HvcGE
         sBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=NNE8frVZQ+ED375gGwfmgxJpEswJ/LmwIhbQoQ0cLZg=;
        b=pjsHd8S7BlMCPelUJOyW8juvtsO5OUS6aVzjs4k/LoRfcuGdJg2blGXjz2le6saL0L
         Zwo4F26LUyTzhToiMyV3V9iI7DKjyt5jjFnQsbWhneIK8RUSmdpV5emNcb1TuvyrHqBq
         3iVtq+083zwiJoRtr58xajXc8CpLK6NkYwMlFkWC0aXy6cB8+a9XC83ZuMgM0hdRm9as
         Pg+fv4Qe2kFXYp6jJi00E4VK7ZE36z8h7S6R9USAbSIIxXguEPz8jendsvEiQJ8izw5g
         txstAG+c7Y56yVFGxjRMxGWTQtkpFz53efN7PDvsheUkEulHp9+0ru8t+sWAx2vg6ePM
         fUNg==
X-Gm-Message-State: AOAM531f6zwQ+zsv3f60ySKwQ5nmIyhc85nFgEgKYrGNO4Zm8xFWrevl
	/vVAjhk5yh6y9mRk4UA1L4WIKBU46JsvB7YYEyBDrZGpJx+a4g==
X-Google-Smtp-Source: ABdhPJy1VurDiwPncPVyhPWlckLI9qPgzKirThHafOB1sJ+D7//xKUHz4fhnGweYJuZwCpQI5dMBNa4x6V1HDM7ykCo=
X-Received: by 2002:adf:f1ca:: with SMTP id z10mr28432279wro.396.1623237678541;
 Wed, 09 Jun 2021 04:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210609103752.3138205-1-ross.burton@arm.com>
In-Reply-To: <20210609103752.3138205-1-ross.burton@arm.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 9 Jun 2021 12:21:07 +0100
Message-ID: <CAAnfSTvbKzE-YBV=fLzzf50+m1RNsV0pTNR-L+Mgr=jKY5s=qw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] gem5/gem5: upgrade to 20.1.0.4
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Ignore this, v2 incoming.

On Wed, 9 Jun 2021 at 11:38, Ross Burton via lists.yoctoproject.org
<ross=burtonini.com@lists.yoctoproject.org> wrote:
>
> This is the latest point release in the 20.1 series, and also fixes the build with
> scons 4.1 (which is now in master).
>
> Change-Id: I31b8aabc8af47cc64af68f2fd0ee2b9b9b656e89
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../gem5/files/pyinit-threads.patch           | 32 ----------------
>  ...Fix-atomics-permission-checks-in-TLB.patch | 38 -------------------
>  .../gem5/gem5-aarch64-native_20.bb            |  3 +-
>  .../recipes-devtools/gem5/gem5-source_20.inc  |  9 ++---
>  4 files changed, 5 insertions(+), 77 deletions(-)
>  delete mode 100644 meta-gem5/recipes-devtools/gem5/files/pyinit-threads.patch
>  delete mode 100644 meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0002-arch-arm-Fix-atomics-permission-checks-in-TLB.patch
>
> diff --git a/meta-gem5/recipes-devtools/gem5/files/pyinit-threads.patch b/meta-gem5/recipes-devtools/gem5/files/pyinit-threads.patch
> deleted file mode 100644
> index ac0c841..0000000
> --- a/meta-gem5/recipes-devtools/gem5/files/pyinit-threads.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> -From ae2ee2a4a51914cf78deb5c253a3b03cbb53ce72 Mon Sep 17 00:00:00 2001
> -From: Boris Staletic <boris.staletic@gmail.com>
> -Date: Mon, 15 Jun 2020 19:36:43 +0200
> -Subject: [PATCH] Avoid using deprecated API in python 3.9
> -
> -The PyEval_InitThreads() and PyEval_ThreadsInitialized() functions are
> -now deprecated and will be removed in Python 3.11. Calling
> -PyEval_InitThreads() now does nothing. The GIL is initialized by
> -Py_Initialize() since Python 3.7.
> ----
> - include/pybind11/detail/internals.h | 5 ++++-
> - 1 file changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/include/pybind11/detail/internals.h b/include/pybind11/detail/internals.h
> -index 6224dfb22..166a18a32 100644
> ---- a/ext/pybind11/include/pybind11/detail/internals.h
> -+++ b/ext/pybind11/include/pybind11/detail/internals.h
> -@@ -273,7 +273,10 @@ PYBIND11_NOINLINE inline internals &get_internals() {
> -         auto *&internals_ptr = *internals_pp;
> -         internals_ptr = new internals();
> - #if defined(WITH_THREAD)
> --        PyEval_InitThreads();
> -+
> -+        #if PY_VERSION_HEX < 0x03090000
> -+                PyEval_InitThreads();
> -+        #endif
> -         PyThreadState *tstate = PyThreadState_Get();
> -         #if PY_VERSION_HEX >= 0x03070000
> -             internals_ptr->tstate = PyThread_tss_alloc();
> diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0002-arch-arm-Fix-atomics-permission-checks-in-TLB.patch b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0002-arch-arm-Fix-atomics-permission-checks-in-TLB.patch
> deleted file mode 100644
> index 36cb167..0000000
> --- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0002-arch-arm-Fix-atomics-permission-checks-in-TLB.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From c47920d81c4c29e8c868c005ff4330c46becbad5 Mon Sep 17 00:00:00 2001
> -From: Giacomo Travaglini <giacomo.travaglini@arm.com>
> -Date: Wed, 03 Mar 2021 11:38:06 +0000
> -Subject: [PATCH] arch-arm: Fix atomics permission checks in TLB
> -
> -For stage 2 translations, atomic accesses were not checking the
> -access permission bits in the page table descriptors, and were
> -instead wrongly using the nature of the request itself
> -(r/w booleans).
> -
> -Change-Id: I27fbc95f04ea659e77ad5a3afb551873c9c971f0
> -Signed-off-by: Giacomo Travaglini <giacomo.travaglini@arm.com>
> -Reviewed-on: https://gem5-review.googlesource.com/c/public/gem5/+/42073
> -Reviewed-by: Jason Lowe-Power <power.jg@gmail.com>
> -Reviewed-by: Richard Cooper <richard.cooper@arm.com>
> -Reviewed-by: Bobby R. Bruce <bbruce@ucdavis.edu>
> -Maintainer: Jason Lowe-Power <power.jg@gmail.com>
> -Maintainer: Bobby R. Bruce <bbruce@ucdavis.edu>
> -Tested-by: kokoro <noreply+kokoro@google.com>
> -
> -Upstream-Status: Backport
> -Signed-off-By: Nathan Dunne <nathan.dunne@arm.com>
> ----
> -
> -diff --git a/src/arch/arm/tlb.cc b/src/arch/arm/tlb.cc
> -index fd72d25..8e5b3ca 100644
> ---- a/src/arch/arm/tlb.cc
> -+++ b/src/arch/arm/tlb.cc
> -@@ -872,8 +872,7 @@
> -             // sctlr.wxn overrides the xn bit
> -             grant = !wxn && !xn;
> -         } else if (is_atomic) {
> --            grant = r && w;
> --            grant_read = r;
> -+            grant = hap;
> -         } else if (is_write) {
> -             grant = hap & 0x2;
> -         } else { // is_read
> diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
> index 711ab95..79cf910 100644
> --- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
> +++ b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
> @@ -1,7 +1,6 @@
>  require gem5-source_20.inc
>
> -SRC_URI += "file://0001-dev-arm-SMMUv3-enable-interrupt-interface.patch \
> -            file://0002-arch-arm-Fix-atomics-permission-checks-in-TLB.patch"
> +SRC_URI += "file://0001-dev-arm-SMMUv3-enable-interrupt-interface.patch"
>
>  BPN = "gem5-aarch64-native"
>
> diff --git a/meta-gem5/recipes-devtools/gem5/gem5-source_20.inc b/meta-gem5/recipes-devtools/gem5/gem5-source_20.inc
> index c586308..d03bb49 100644
> --- a/meta-gem5/recipes-devtools/gem5/gem5-source_20.inc
> +++ b/meta-gem5/recipes-devtools/gem5/gem5-source_20.inc
> @@ -1,12 +1,11 @@
> -# gem5 sources v20.1.0.3
> +# gem5 sources v20.1.0.4
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=2d9514d69d8abf88b6e9125e759bf0ab \
>                      file://LICENSE;md5=a585e2893cee63d16a1d8bc16c6297ec"
>
> -SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;nobranch=1 \
> -           file://pyinit-threads.patch"
> -RELEASE_TAG = "v20.1.0.3"
> -SRCREV = "cd21b5a5519940a0fa9b9a2dde68f30403d17f7e"
> +SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;nobranch=1"
> +RELEASE_TAG = "v20.1.0.4"
> +SRCREV = "2373934b8224e33c55ce96a0fe7751caeee13baf"
>
>  PV = "${RELEASE_TAG}"
>
> --
> 2.25.1
>
>
> 
>
