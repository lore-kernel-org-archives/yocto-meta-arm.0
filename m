Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.8032.1591884141648127113
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 07:02:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=sajzWlus;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id k22so4585312qtm.6
        for <meta-arm@lists.yoctoproject.org>; Thu, 11 Jun 2020 07:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kZm8LwaENEaQe9r+6o8Mp7yRQbZcKLgEmZBAtl3l2Mk=;
        b=sajzWlus/wDQ/WkDr1cLyCZ1HAjPSe3ZLu1BiqZlZcaezkg74NvA6XXCdRZw1zNCLk
         Oa3S+diho8Jpd1DDyrcl+MDV2+MK8MlylGOFcPCHONzMeHXGEZQkH1i/70QIMIsPgEVu
         3u6ETV86vlbZzRgi1ESawL0kABGM4/10E79EErgfXid2dBOJZnhEXLTuisJInBt/D9Lw
         f4zL0OEKp1HNxIthdfyhfW4H/pdbYdf5VNuCZIs96OtrgBJ194PFRsb+XjL33OTz2PiL
         tFgsfAxobWV2GlQiPtjiNsyxdgzWazL/qUk4ngKCeV3RG9J7k99VCiGDUgdDU1eOPjht
         K3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kZm8LwaENEaQe9r+6o8Mp7yRQbZcKLgEmZBAtl3l2Mk=;
        b=McecbvLDg0N2F0i4FxKXzm5Zqy56JZU+HfO1pSk2UrBdAUBe0bARtiXyv0YF7LLY/d
         guSBd+FmD46IYpc+u5AstKQLGH78n/vFCxKOoRjfsYxn8eae7qs+/NXv2QRPMt6xkRUD
         Xxk+oF+bR+9evADCzilY/r2tDeZNAuDUxfW4GW6B00kMKOD/CxCLN9+21oBNNhkcsDxx
         nY2F5645/Sw9KuMXGDf5/YemX8udFERQmNH3l7Ebwpjyj94Uuzp4V9gYpsI21idxs0UG
         K0OyvuBWWiCzaZWA9mL5DFw/hO5Dsly0GhfZ4y713AsRcB9VnQZaYNbSf9WFysi0YrsL
         FOKA==
X-Gm-Message-State: AOAM530XldvckKkBbphAW+s9grgsH9DblN/SVbmatI591PEcHsCC4V9A
	nq7Pb66T9QSbSe1ZHYe1aGsuHQ==
X-Google-Smtp-Source: ABdhPJycL0wOMU0OJj4xdOGV27K7vGO+rBHNpc5ciP5sz1LvbSK9sJYqs4xYZAYkgJKUQyjAI+NuMA==
X-Received: by 2002:aed:3f25:: with SMTP id p34mr8424686qtf.92.1591884137907;
        Thu, 11 Jun 2020 07:02:17 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:e01b:52c7:6d78:8385])
        by smtp.gmail.com with ESMTPSA id m94sm2524586qtd.29.2020.06.11.07.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 07:02:17 -0700 (PDT)
Date: Thu, 11 Jun 2020 10:02:15 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Diego Sueiro <Diego.Sueiro@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp, gem5-arm64: Update to v20 version
Message-ID: <20200611140214.GA17598@kudzu.us>
References: <1591861936-39107-1-git-send-email-diego.sueiro@arm.com>
 <8B40A7FE-2A88-41EB-9060-663CF712CAA6@arm.com>
MIME-Version: 1.0
In-Reply-To: <8B40A7FE-2A88-41EB-9060-663CF712CAA6@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2020 at 07:56:08AM +0000, Bertrand Marquis wrote:
> 
> 
> > On 11 Jun 2020, at 08:52, Diego Sueiro via lists.yoctoproject.org <diego.sueiro=arm.com@lists.yoctoproject.org> wrote:
> > 
> > This patch updates gem5-aarch64-bootloader and gem5-aarch64-native to
> > the release tag v20.0.0.1.
> > 
> > Also apply populate the right compiler and linker flags to get
> > gem5-aarch64-native properly building
> > 
> > Change-Id: Icc2203163105373cf030975c1b12f1d4f2fcb03c
> > Issue-Id: SCM-1014
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Applied to the master branch

Thanks,
Jon

> 
> > ---
> > .../gem5/gem5-aarch64-bootloader.inc               |  8 +-
> > ...loader_git.bb => gem5-aarch64-bootloader_20.bb} | 10 +--
> > ...SHAL_XXFLAGS_EXTRA-for-the-marshal-object.patch | 85 ++++++++++++++++++++++
> > ...h64-native_git.bb => gem5-aarch64-native_20.bb} | 18 +++--
> > meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc |  6 --
> > 5 files changed, 106 insertions(+), 21 deletions(-)
> > rename meta-arm-bsp/recipes-devtools/gem5/{gem5-aarch64-bootloader_git.bb => gem5-aarch64-bootloader_20.bb} (60%)
> > create mode 100644 meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native/0001-scons-Add-MARSHAL_XXFLAGS_EXTRA-for-the-marshal-object.patch
> > rename meta-arm-bsp/recipes-devtools/gem5/{gem5-aarch64-native_git.bb => gem5-aarch64-native_20.bb} (53%)
> > 
> > diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader.inc b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader.inc
> > index 4c479f5..7e753b2 100644
> > --- a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader.inc
> > +++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader.inc
> > @@ -5,10 +5,12 @@ LICENSE = "BSD"
> > 
> > inherit deploy
> > 
> > -PROVIDES = "virtual/gem5-bootloader"
> > +PROVIDES += "virtual/gem5-bootloader"
> > 
> > COMPATIBLE_MACHINE = "gem5-arm64"
> > 
> > +BOOTLOADER_SRC_PATH ?= "${S}/system/arm/bootloader/arm64"
> > +
> > # no configure step
> > do_configure[noexec] = "1"
> > 
> > @@ -16,11 +18,11 @@ do_configure[noexec] = "1"
> > do_install[noexec] = "1"
> > 
> > do_compile() {
> > -    oe_runmake -C system/arm/aarch64_bootloader all CROSS_COMPILE=${TARGET_PREFIX}
> > +    oe_runmake -C ${BOOTLOADER_SRC_PATH} all CROSS_COMPILE=${TARGET_PREFIX}
> > }
> > 
> > do_deploy() {
> > -    oe_runmake -C system/arm/aarch64_bootloader install \
> > +    oe_runmake -C ${BOOTLOADER_SRC_PATH} install \
> >         CROSS_COMPILE=${TARGET_PREFIX} DESTDIR=${DEPLOYDIR}/binaries
> > }
> > 
> > diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_20.bb
> > similarity index 60%
> > rename from meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb
> > rename to meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_20.bb
> > index a3ab5aa..d960e6c 100644
> > --- a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb
> > +++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_20.bb
> > @@ -3,16 +3,14 @@
> > LIC_FILES_CHKSUM = "file://COPYING;md5=2d9514d69d8abf88b6e9125e759bf0ab \
> >                     file://LICENSE;md5=a585e2893cee63d16a1d8bc16c6297ec"
> > 
> > -# The recipe is currently using a version in the release staging branch of gem5
> > -# until version 20 is released
> > -SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;branch=release-staging-v20.0.0.0"
> > +SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;nobranch=1"
> > +RELEASE_TAG = "v20.0.0.1"
> > +SRCREV = "332a9de33db603e0aefedae1e05134db4257ea3e"
> > 
> > -PV = "git${SRCPV}"
> > +PV = "${RELEASE_TAG}"
> > 
> > S = "${WORKDIR}/git"
> > 
> > -SRCREV = "0bc5d77ed27e0765953d93c2376a4b4aea675a01"
> > -
> > BPN = "gem5-aarch64-bootloader"
> > 
> > require gem5-aarch64-bootloader.inc
> > diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native/0001-scons-Add-MARSHAL_XXFLAGS_EXTRA-for-the-marshal-object.patch b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native/0001-scons-Add-MARSHAL_XXFLAGS_EXTRA-for-the-marshal-object.patch
> > new file mode 100644
> > index 0000000..4303a40
> > --- /dev/null
> > +++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native/0001-scons-Add-MARSHAL_XXFLAGS_EXTRA-for-the-marshal-object.patch
> > @@ -0,0 +1,85 @@
> > +From 1303d0497bad151f9389ee30c37dc5f9fe325f6e Mon Sep 17 00:00:00 2001
> > +From: Giacomo Travaglini <giacomo.travaglini@arm.com>
> > +Date: Thu, 04 Jun 2020 12:45:52 +0100
> > +Subject: [PATCH] scons: Add MARSHAL_XXFLAGS_EXTRA for the marshal object
> > +
> > +We already provide to the user the CCFLAGS_EXTRA, LDFLAGS_EXTRA
> > +variables to pass flags to scons when compiling/linking gem5.
> > +Those variables are not passed to the marshal object.
> > +We add an extra pair:
> > +
> > +MARSHAL_CCFLAGS_EXTRA, MARSHAL_LDFLAGS_EXTRA
> > +
> > +to add flag injection capabilities to the marshal object.
> > +
> > +The patch is also renaming base_py_env to marshal_env.
> > +This happens for 2 reasons:
> > +
> > +1) At the moment the marshal compilation is the only task
> > +making use of the base python environment.
> > +
> > +2) Consistency with the EXTRA variable names added with this patch.
> > +I could have named them as BASE_XXFLAGS_EXTRA, but it seems too much
> > +generic and users might be confused by that, as they might think
> > +the BASE_XXFLAGS_EXTRA is a subset of the XXFLAGS_EXTRA so that
> > +setting it will affect gem5 compilation as well.
> > +
> > +Change-Id: I3e420caa897059455ff8f35462db2b38da050e93
> > +Signed-off-by: Giacomo Travaglini <giacomo.travaglini@arm.com>
> > +---
> > +
> > +diff --git a/SConstruct b/SConstruct
> > +index 3a03af4..5a66bba 100755
> > +--- a/SConstruct
> > ++++ b/SConstruct
> > +@@ -276,6 +276,8 @@
> > +     ('CXX', 'C++ compiler', environ.get('CXX', main['CXX'])),
> > +     ('CCFLAGS_EXTRA', 'Extra C and C++ compiler flags', ''),
> > +     ('LDFLAGS_EXTRA', 'Extra linker flags', ''),
> > ++    ('MARSHAL_CCFLAGS_EXTRA', 'Extra C and C++ marshal compiler flags', ''),
> > ++    ('MARSHAL_LDFLAGS_EXTRA', 'Extra marshal linker flags', ''),
> > +     ('PYTHON_CONFIG', 'Python config binary to use',
> > +      [ 'python2.7-config', 'python-config', 'python3-config' ]),
> > +     ('PROTOC', 'protoc tool', environ.get('PROTOC', 'protoc')),
> > +@@ -734,7 +736,9 @@
> > + 
> > + main.Prepend(CPPPATH=Dir('ext/pybind11/include/'))
> > + # Bare minimum environment that only includes python
> > +-base_py_env = main.Clone()
> > ++marshal_env = main.Clone()
> > ++marshal_env.Append(CCFLAGS='$MARSHAL_CCFLAGS_EXTRA')
> > ++marshal_env.Append(LINKFLAGS='$MARSHAL_LDFLAGS_EXTRA')
> > + 
> > + # On Solaris you need to use libsocket for socket ops
> > + if not conf.CheckLibWithHeader(None, 'sys/socket.h', 'C++', 'accept(0,0,0);'):
> > +@@ -1285,7 +1289,7 @@
> > +     # to the configured variables.  It returns a list of environments,
> > +     # one for each variant build (debug, opt, etc.)
> > +     SConscript('src/SConscript', variant_dir=variant_path,
> > +-               exports=['env', 'base_py_env'])
> > ++               exports=['env', 'marshal_env'])
> > + 
> > + # base help text
> > + Help('''
> > +diff --git a/src/SConscript b/src/SConscript
> > +index 7cd628a..aa233c8 100644
> > +--- a/src/SConscript
> > ++++ b/src/SConscript
> > +@@ -1140,7 +1140,7 @@
> > + # Build a small helper that marshals the Python code using the same
> > + # version of Python as gem5. This is in an unorthodox location to
> > + # avoid building it for every variant.
> > +-py_marshal = base_py_env.Program('marshal', 'python/marshal.cc')[0]
> > ++py_marshal = marshal_env.Program('marshal', 'python/marshal.cc')[0]
> > + 
> > + # Embed python files.  All .py files that have been indicated by a
> > + # PySource() call in a SConscript need to be embedded into the M5
> > +@@ -1196,7 +1196,7 @@
> > +     code.write(str(target[0]))
> > + 
> > + for source in PySource.all:
> > +-    base_py_env.Command(source.cpp, [ py_marshal, source.tnode ],
> > ++    marshal_env.Command(source.cpp, [ py_marshal, source.tnode ],
> > +                         MakeAction(embedPyFile, Transform("EMBED PY")))
> > +     Source(source.cpp, tags=source.tags, add_tags='python')
> > + 
> > diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_20.bb
> > similarity index 53%
> > rename from meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb
> > rename to meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_20.bb
> > index d36f24f..638baf3 100644
> > --- a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb
> > +++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_20.bb
> > @@ -3,21 +3,27 @@
> > LIC_FILES_CHKSUM = "file://COPYING;md5=2d9514d69d8abf88b6e9125e759bf0ab \
> >                     file://LICENSE;md5=a585e2893cee63d16a1d8bc16c6297ec"
> > 
> > -# The recipe is currently using a version in the release staging branch of gem5
> > -# until version 20 is released
> > -SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;branch=release-staging-v20.0.0.0"
> > +SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;nobranch=1 \
> > +           file://0001-scons-Add-MARSHAL_XXFLAGS_EXTRA-for-the-marshal-object.patch"
> > +RELEASE_TAG = "v20.0.0.1"
> > +SRCREV = "332a9de33db603e0aefedae1e05134db4257ea3e"
> > 
> > -PV = "git${SRCPV}"
> > +PV = "${RELEASE_TAG}"
> > 
> > S = "${WORKDIR}/git"
> > 
> > -SRCREV = "0bc5d77ed27e0765953d93c2376a4b4aea675a01"
> > -
> > BPN = "gem5-aarch64-native"
> > 
> > require gem5-aarch64-native.inc
> > require gem5-native.inc
> > 
> > +# Get rid of compiler errors when building protobuf
> > +GEM5_SCONS_ARGS_append = " CCFLAGS_EXTRA='-Wno-error=unused-variable' --verbose"
> > +
> > +# Get rid of linker errors and have a faster link process
> > +GEM5_SCONS_ARGS_append = " LDFLAGS_EXTRA='${BUILD_LDFLAGS}' \
> > +MARSHAL_LDFLAGS_EXTRA='${BUILD_LDFLAGS}' --force-lto "
> > +
> > do_compile_prepend() {
> >     # Gem5 expect to have python in the path (can be python2 or 3)
> >     # Create a link named python to python3
> > diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc b/meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc
> > index 429e18c..1df94d0 100644
> > --- a/meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc
> > +++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc
> > @@ -30,12 +30,6 @@ DEPENDS += "python3-six-native protobuf-native hdf5-native pkgconfig-native \
> > 
> > EXTRA_OESCONS = "${GEM5_SCONS_ARGS}"
> > 
> > -do_compile_prepend() {
> > -    # We need to use the proper native libraries when executing
> > -    # compiled applications
> > -    export LD_LIBRARY_PATH="${STAGING_LIBDIR_NATIVE}"
> > -}
> > -
> > do_install() {
> > 
> >     install -d ${D}${datadir}/gem5
> > -- 
> > 2.7.4
> > 
> > 
> 

> 

