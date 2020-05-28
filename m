Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.12226.1590672963464699935
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 May 2020 06:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=ZTwpcGeP;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f196.google.com with SMTP id v79so3007062qkb.10
        for <meta-arm@lists.yoctoproject.org>; Thu, 28 May 2020 06:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jdH238ZcsyLu/GuIJpc3877pukyVwwqaRGKEK+vUqZw=;
        b=ZTwpcGePZR0n43aeO0EyyB7jxymhgaZPSPE9ePWFM2/5HzcIk2TEWXRSMAmn9HxmhJ
         GrtButfR88ersZR5Cku9brg8rv6Yna14wUfg5r4FhOVcMlT4Iw7OZo6FOXkze8YaP9B0
         WPbkoIlnbX0+foagJZmzvfVF/T3bfSqmKpC4W7yWijGP9i2aFkgdUuCpWhoMybUZQlUR
         jo4r138gbufeXvWySsadvgtiRigDmiHygCt3jqdiaQblaGSQCEGJPo3CrSXUg0KCjzkL
         sbyDTt361SjE7ZHvzJ9bFkhw40mR+oqP/PUGQy86LvVimnQoNlraauvBAX7BQmdIF1u2
         c9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jdH238ZcsyLu/GuIJpc3877pukyVwwqaRGKEK+vUqZw=;
        b=iZoVNFKSdNgq2S1yla00n9i7Auxe1SbxSzaphv56ffQAFs9ZdOlQhFPN9/14hfR5Bb
         Mqg88auq2ouMjdVRWBh49SoI06nMH+YKG6fi5ZGdEz4eskhEYzZczZHRy2YrLUoXZoBA
         C6Cg+E3ugANURY3Z14+xcGyhgIEgTi7zvYIEmvwVLjOGcUYyTZlTeDqdWtInw2Zd8p4t
         xpTt9zKYHjy0yQsPrxprXmYoh0td85OJ6VVaRO/XoF/gGVUeM5YEPfo0g+I1wP+kCXdC
         hJh+sV7TIC/IPyJQGqxIsME0cSOhGrQfSu0TWsKeLT114LZtNArySmbjBqCiB0nOCuLc
         Vl6g==
X-Gm-Message-State: AOAM533uhy5E+wiPc2fBwRVA/TD+Pb8qQcPV888gwcHG24J9GrGhOe+Y
	H8ohjoHprW2kZw4b6c4oj79njQ==
X-Google-Smtp-Source: ABdhPJyctBiDtSxubVHmOYXRvynnOOWFjp4SHvW0njoXZmtfFWBUiOfnXb9awITS4Onw6PGkIlupfw==
X-Received: by 2002:a37:4243:: with SMTP id p64mr2835040qka.438.1590672962363;
        Thu, 28 May 2020 06:36:02 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:25f4:d953:fba5:8f48])
        by smtp.gmail.com with ESMTPSA id z194sm4759148qkb.73.2020.05.28.06.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 06:36:01 -0700 (PDT)
Date: Thu, 28 May 2020 09:36:00 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Diego Sueiro <diego.sueiro@arm.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-toolchain: gcc-aarch64-none-elf: Add recipe
Message-ID: <20200528133559.GA25502@kudzu.us>
References: <1589964438-6924-1-git-send-email-denis@denix.org>
 <22524.1590037979741392604@lists.yoctoproject.org>
 <20200522231747.GD17660@denix.org>
 <20200526134018.GA32704@kudzu.us>
 <20200527025934.GJ17660@denix.org>
MIME-Version: 1.0
In-Reply-To: <20200527025934.GJ17660@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 26, 2020 at 10:59:34PM -0400, Denys Dmytriyenko wrote:
> On Tue, May 26, 2020 at 09:40:18AM -0400, Jon Mason wrote:
> > On Fri, May 22, 2020 at 07:17:47PM -0400, Denys Dmytriyenko wrote:
> > > On Wed, May 20, 2020 at 10:12:59PM -0700, Diego Sueiro wrote:
> > > > On Wed, May 20, 2020 at 09:47 AM, Denys Dmytriyenko wrote:
> > > > > b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
> > > > > @@ -0,0 +1,38 @@
> > > > > +# Copyright (C) 2020 Texas Instruments Inc.
> > > > > +# Released under the MIT license (see COPYING.MIT for the terms)
> > > > > +
> > > > > +SUMMARY = "Baremetal GCC for Aarch64 processors"
> > > > > +LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> > > 
> > > <snip>
> > > 
> > > > I see lots of commonalities (code duplication) with the 
> > > > gcc-arm-none-eabi_9-2019-q4-major.bb recipe. Isn't now a good opportunity to 
> > > > have a `.inc` to avoid this?
> > > 
> > > Yes, there's lots of duplication in those 2 recipes. Unfortunately, there's 
> > > copyright in the original one and I cannot touch it w/o a lawyer. That's why 
> > > I don't like copyrights in recipes (nothing much to copyright there anyway)
> > 
> > I'm confused.  You mean the MIT license in
> > gcc-arm-none-eabi_9-2019-q4-major.bb?  If so, is it not the same as
> > the license you reference above in your patch?
> > 
> > > > The path inside the do_install can be easily controlled by a variable set 
> > > > from the recipes that are including it.
> > > 
> > > Well, those are technical details I can handle quite easily - I've been doing 
> > > OE for 13+ years. But it is legal issues where I draw the line...
> > 
> > Assuming it's the MIT license, and you are unwilling to do it, I can
> > pull it in and make the common inc file.
> 
> I've been discussing this with Joshua offline lately - give me a bit more time 
> to sort it out, hopefully I can come up with a solution. If not, I'll let you 
> know. Thanks.
> 
> -- 
> Denys

100% untested, but I think the following might work


commit aa673cf5cb64ddb7d91a6281556e9d02daa78546
Author: Jon Mason <jdmason@kudzu.us>
Date:   Thu May 28 09:33:17 2020 -0400

    Unification of recipes
    
    Signed-off-by: Jon Mason <jdmason@kudzu.us>

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
index 2ec0f9c..dfb6180 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
@@ -14,7 +14,6 @@ SRC_URI[sha256sum] = "36d2cbe7c2984f2c20f562ac2f3ba524c59151adfa8ee10f1326c88de3
 
 S = "${WORKDIR}/gcc-arm-${PV}-x86_64-aarch64-none-elf"
 
-COMPATIBLE_HOST = "x86_64.*-linux"
 
 do_install() {
     install -d ${D}${datadir}/aarch64-none-elf/
@@ -27,12 +26,3 @@ do_install() {
     done
 }
 
-FILES_${PN} = "${datadir} ${bindir}"
-
-INSANE_SKIP_${PN} = "already-stripped libdir staticdev file-rdeps"
-
-INHIBIT_SYSROOT_STRIP = "1"
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
index 84f6dba..4368e85 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
@@ -13,10 +13,6 @@ SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/${B
 SRC_URI[md5sum] = "fe0029de4f4ec43cf7008944e34ff8cc"
 SRC_URI[sha256sum] = "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b25271e83ec4ff41d177a"
 
-S = "${WORKDIR}/${BPN}-${PV}"
-
-COMPATIBLE_HOST = "x86_64.*-linux"
-
 do_install() {
     install -d ${D}${datadir}/arm-none-eabi/
     cp -r ${S}/. ${D}${datadir}/arm-none-eabi/
@@ -27,13 +23,3 @@ do_install() {
         lnr $f ${D}${bindir}/$(basename $f)
     done
 }
-
-FILES_${PN} = "${datadir} ${bindir}"
-
-INSANE_SKIP_${PN} = "already-stripped libdir staticdev file-rdeps"
-
-INHIBIT_SYSROOT_STRIP = "1"
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.inc
new file mode 100644
index 0000000..67dbd19
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.inc
@@ -0,0 +1,27 @@
+
+S = "${WORKDIR}/${BPN}-${PV}"
+
+COMPATIBLE_HOST = "x86_64.*-linux"
+
+FILES_${PN} = "${datadir} ${bindir}"
+
+NAME = "${BPN}".strip("gcc-")
+
+do_install() {
+    install -d ${D}${datadir}/${NAME}/
+    cp -r ${S}/. ${D}${datadir}/${NAME}/
+
+    install -d ${D}${bindir}
+    # Symlink all executables into bindir
+    for f in ${D}${datadir}/${NAME}/bin/${NAME}-*; do
+        lnr $f ${D}${bindir}/$(basename $f)
+    done
+}
+
+INSANE_SKIP_${PN} = "already-stripped libdir staticdev file-rdeps"
+
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
+BBCLASSEXTEND = "native nativesdk"

