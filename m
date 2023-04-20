Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39751C77B72
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 17:30:41 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.2067.1682011839842010397
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Apr 2023 10:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=kJCR2bBV;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-3ef4daaf906so4088171cf.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 20 Apr 2023 10:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1682011839; x=1684603839;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mZ3HuY/tzA3r6dCYksyf5PyYaCIUqWYeNvA05uAH70A=;
        b=kJCR2bBVEpclaoQ7g8hffvW08GMVYe4cqb4hJAVqOnsvp6TkhaiFh78cTrPPvNyh0m
         i0cJA1kiXYifyFBDvOyaf3cHFdBv1i3Soh3KjWvYJkbjo0j7hqX4xnlw1ZZps7DSRSdc
         /wztrsWzAe84ZE5coiKGkB/4ESpgcgwmnaFiNWRcC2efK0H+K0zSBPVmNNAMKCq/rAvP
         xM6xNTaT3DG8k9aX9DMuMqlX8UI/oeS2uYQP2JTEBEDAhecR66Vz3On8hqrjH9Eozt9z
         hZ4I8FXGyubuM5PNWSKRKttupM6+6r9dQqtR9M2ifptsfh/7PQg1mCxRSdqf+bBz9Fno
         xJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682011839; x=1684603839;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mZ3HuY/tzA3r6dCYksyf5PyYaCIUqWYeNvA05uAH70A=;
        b=Rbm83wg37FhF5oY2X2jYJ+0sjICn/ZtOzQ42S/74mGdZZPM5E0U99oQtINCEOMsbUh
         0JtnQ+LILoDCuPrdXilunzOgfSOi4KvHQy4EPzJVs5BXCFL2bXLuq6TQ1CoD5CtqVsG1
         e+GlyrRWMR2sLGmhbjc9a6nT1NliHg7C+RZmSlzoxsVp/jaL8+RxuRjx6Vg+Kp3UzMo/
         NKlhh9xurNS/AX4mx5ChOOZXEb9Snxiiu5ZP169XJUEZPTTKEf7TG/PIKyuQL6S1E9WR
         1XjE90kZSqYjq7dNl+5Sr5wLQ+P7Xhi0GcV084fJcuPlHiAhtPBgxrUCcNb0h9gHPvqt
         ZeQg==
X-Gm-Message-State: AAQBX9cvjbxGfLT0fXypfFYa1ievzGeeGdKxH8fhl+d5gDJu6+9ZlBiP
	ocTSGTkR8au56TGa+CIYzdlO9A==
X-Google-Smtp-Source: AKy350aMyV5HC+FHN4N9epLRbtdT/khZ3zXSttIuu0yDf58XaDL1mc+gk9dks6GnChqpUiMtqmDVeQ==
X-Received: by 2002:a05:622a:190b:b0:3d4:3d6c:a62b with SMTP id w11-20020a05622a190b00b003d43d6ca62bmr308354qtc.27.1682011838786;
        Thu, 20 Apr 2023 10:30:38 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id o6-20020a05622a008600b003eeff94e2f8sm656475qtw.0.2023.04.20.10.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 10:30:38 -0700 (PDT)
Date: Thu, 20 Apr 2023 13:30:36 -0400
From: Jon Mason <jdmason@kudzu.us>
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH] gator-daemon: bump to 8.4.0
Message-ID: <ZEF2vPTDHzWKV/7x@kudzu.us>
References: <20230418163658.13032-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230418163658.13032-1-peron.clem@gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Apr 2023 17:30:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4602

On Tue, Apr 18, 2023 at 06:36:58PM +0200, Cl�ment P�ron wrote:
> Gator Daemon moved to CMake build system so update the recipe
> 
> Remove Apache-2.0 license as mxml has been moved out of this package
> 
> Drop patches that has been merged
> 
> Signed-off-by: Cl�ment P�ron <peron.clem@gmail.com>

This patch fails on all platforms with:

ERROR: Nothing PROVIDES 'libmxml' (but /builds/jonmason00/meta-arm/work/build/../../meta-arm/recipes-devtools/gator-daemon/gator-daemon_8.4.0.bb DEPENDS on or otherwise requires it). Close matches:
  libomxil
  libxml2
  libxpm
ERROR: Required build target 'core-image-sato' has no buildable providers.
Missing or unbuildable dependency chain was: ['core-image-sato', 'gator-daemon', 'libmxml']

Note: We're going to release mickledore in 1 week.  If you want this
in that release, please get the v2 to me as soon as possible.

Thanks,
Jon

> ---
>  .../0001-Include-missing-cstdint.patch        | 32 -------------------
>  .../0001-daemon-mxml-Define-_GNU_SOURCE.patch | 31 ------------------
>  ...-daemon_7.8.0.bb => gator-daemon_8.4.0.bb} | 21 ++++--------
>  3 files changed, 7 insertions(+), 77 deletions(-)
>  delete mode 100644 meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Include-missing-cstdint.patch
>  delete mode 100644 meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-daemon-mxml-Define-_GNU_SOURCE.patch
>  rename meta-arm/recipes-devtools/gator-daemon/{gator-daemon_7.8.0.bb => gator-daemon_8.4.0.bb} (51%)
> 
> diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Include-missing-cstdint.patch b/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Include-missing-cstdint.patch
> deleted file mode 100644
> index 294f804f..00000000
> --- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Include-missing-cstdint.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 87745a6cad0f7819ac8f8d3826f5e228ebd843c5 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 2 Feb 2023 16:39:26 -0800
> -Subject: [PATCH] Include missing <cstdint>
> -
> -gcc 13 moved some includes around and as a result <cstdint> is no
> -longer transitively included [1]. Explicitly include it
> -for uintXX_t.
> -
> -[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
> -
> -Upstream-Status: Submitted [https://github.com/ARM-software/gator/pull/40]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - daemon/xml/CurrentConfigXML.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/daemon/xml/CurrentConfigXML.h b/daemon/xml/CurrentConfigXML.h
> -index 0b239fd..d9047e3 100644
> ---- a/daemon/xml/CurrentConfigXML.h
> -+++ b/daemon/xml/CurrentConfigXML.h
> -@@ -1,6 +1,7 @@
> - /* Copyright (C) 2020-2021 by Arm Limited. All rights reserved. */
> - #pragma once
> - 
> -+#include <cstdint>
> - #include <set>
> - #include <string>
> - 
> --- 
> -2.39.1
> -
> diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-daemon-mxml-Define-_GNU_SOURCE.patch b/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-daemon-mxml-Define-_GNU_SOURCE.patch
> deleted file mode 100644
> index d2460434..00000000
> --- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-daemon-mxml-Define-_GNU_SOURCE.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 04e2e924c3ab8da41343277746804dbcd7bf520d Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 13 Aug 2022 16:49:52 -0700
> -Subject: [PATCH] daemon/mxml: Define _GNU_SOURCE
> -
> -This file uses vasprintf() which is defined only with _GNU_SOURCE
> -feature macro is on.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - daemon/mxml/mxml-string.c | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/daemon/mxml/mxml-string.c b/daemon/mxml/mxml-string.c
> -index 678aeb9..c9cd153 100644
> ---- a/daemon/mxml/mxml-string.c
> -+++ b/daemon/mxml/mxml-string.c
> -@@ -13,6 +13,8 @@
> -  * Include necessary headers...
> -  */
> - 
> -+#define _GNU_SOURCE
> -+
> - #include "config.h"
> - 
> - 
> --- 
> -2.37.2
> -
> diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_8.4.0.bb
> similarity index 51%
> rename from meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
> rename to meta-arm/recipes-devtools/gator-daemon/gator-daemon_8.4.0.bb
> index 6188b07e..586b3ce8 100644
> --- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
> +++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_8.4.0.bb
> @@ -8,28 +8,21 @@ HOMEPAGE = "https://github.com/ARM-software/gator"
>  # configuration requirement specified here:
>  # https://github.com/ARM-software/gator#kernel-configuration
>  
> -LICENSE = "GPL-2.0-only & LGPL-2.1-or-later & Apache-2.0"
> +LICENSE = "GPL-2.0-only & LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://libsensors/COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
> -                    file://mxml/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327 \
>                      file://k/perf_event.h;endline=14;md5=e548bf30a60b2ed11ef2dcf7bfdac230 \
>                     "
>  
> -SRCREV = "6a944e7ee1f1c3ab9b2a57efd24c58503122db02"
> -SRC_URI = "git://github.com/ARM-software/gator.git;protocol=http;branch=main;protocol=https \
> -           file://0001-daemon-mxml-Define-_GNU_SOURCE.patch;striplevel=2 \
> -           file://0001-Include-missing-cstdint.patch;striplevel=2 \
> -          "
> +SRCREV = "75662ba2dc2e1c7a17cff640a35629dca99c5b79"
> +SRC_URI = "git://github.com/ARM-software/gator.git;protocol=http;branch=main;protocol=https"
>  
>  S = "${WORKDIR}/git/daemon"
>  
> +DEPENDS = "boost libmxml pkgconfig-native protobuf protobuf-native"
> +
>  COMPATIBLE_HOST = "aarch64.*-linux"
>  
> -EXTRA_OEMAKE = "'CFLAGS=${CFLAGS} ${TARGET_CC_ARCH} -D_DEFAULT_SOURCE -DETCDIR=\"${sysconfdir}\"' \
> -                'LDFLAGS=${LDFLAGS} ${TARGET_CC_ARCH}' 'CROSS_COMPILE=${TARGET_PREFIX}' \
> -                'CXXFLAGS=${CXXFLAGS} ${TARGET_CC_ARCH} -fno-rtti' CC='${CC}' CXX='${CXX}' V=1"
> +inherit cmake
>  
> -do_install() {
> -        install -d ${D}${sbindir}
> -        install -m 0755 ${S}/gatord ${D}${sbindir}/gatord
> -}
> +EXTRA_OECMAKE += "-DENABLE_VCPKG=OFF -DGATOR_INSTALL_PREFIX=./bin"
> -- 
> 2.39.2 (Apple Git-143)
> 
> 

