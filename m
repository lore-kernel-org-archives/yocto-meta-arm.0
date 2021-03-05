Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web09.12386.1614953946036139499
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Mar 2021 06:19:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=fjaX7+JJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.46, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f46.google.com with SMTP id s17so1005785qvr.12
        for <meta-arm@lists.yoctoproject.org>; Fri, 05 Mar 2021 06:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=respx+f/W2mzgqlnrs8BcKkBwJKvYFgcOGkuBl/Vbvk=;
        b=fjaX7+JJs5DBIxLruvMnd62BjWitry3mcz8eV9uIQtF9W62t8rqwl2nNdB5vtihp0m
         aD58Jju5Ybo0uKzkKLJs8TQbtmZusJEiiaLdaqqHBzyqrvMfDxIPB1bYG1+U5iCPAsoS
         Rt4IYYJJHFQ3U11uAYGnylvQvHa1wNzNYuR2XdRX6PiK8JJ0rxAaSsrayhczEhWeBoBV
         cDwW22uL6IOO5pz0UjAPNnN35FvWsuVUe/GTO3S3t3QTUcvJ0aXHNVinC9WWWeJFbns5
         RgDDNk6qgSqSubdw7aIA6YoX0zZoflAZy5WlkKzKWcZDz0Qi3HH+2sproaZqygbkDj9D
         +u3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=respx+f/W2mzgqlnrs8BcKkBwJKvYFgcOGkuBl/Vbvk=;
        b=itjiYaFMpFR3zdTdOR++tfWej3LHRlmDhiGWztvaXlhtWRzIlWmjbM2T1uyQyq9K3/
         pv/M333RyUwDKLMyscZRyv6G62EzMT53e/qQ3YkjbrbK8bVf4fCRnAdO6tga9/EFul5e
         ovFOYCpCM62gMZIoiiRI7kVFYFFg4S7tKe5Akd2cqUSbR2V0lAAMshJUYGUmWf64sdZI
         ks48+sx0VKQaPDjofCW6ADmJOd/jzacNbbahD/rkFcDAdH7/9Mro5UvzptcF/frEXEb7
         B5ZGhHugUEJM+WJOpaMhMXOrY1k9C13n6w1dVuIeoLaUZPZBQKnLhiJpINO+khk+vjEq
         Gbug==
X-Gm-Message-State: AOAM531CCfuOT+h8rFKTEa1AcroRk2BQh4w3X0kdpwdxdLjDKReuC4cS
	tlE323x6VOeJgZI9g0S/g1+sqbg341O/34Y8
X-Google-Smtp-Source: ABdhPJyHdsEKMBA0Ddippxcnxzp5MFpd8rw7iDGpmG+RxjBmGjd3Pce9ZdOZZ+iD+T6QeRrk4Fv+fg==
X-Received: by 2002:a0c:b20d:: with SMTP id x13mr8993773qvd.19.1614953945043;
        Fri, 05 Mar 2021 06:19:05 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:20a3:3a4f:ed63:83f])
        by smtp.gmail.com with ESMTPSA id j2sm1731883qkk.96.2021.03.05.06.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:19:04 -0800 (PST)
Date: Fri, 5 Mar 2021 09:19:03 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm/opencsd: backport patch to fix build race
Message-ID: <20210305141902.GC17134@kudzu.us>
References: <20210303212734.758924-1-ross.burton@arm.com>
 <CAAnfSTt927+o=AKJLoON1JAdFsBa_=cbbsj3_7=8MoCoMJYszQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAnfSTt927+o=AKJLoON1JAdFsBa_=cbbsj3_7=8MoCoMJYszQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 04, 2021 at 09:39:43AM +0000, Ross Burton wrote:
> These were for gatesgarth, apologies.

Series applied to the gatesgarth branch

Thanks,
Jon

> 
> Ross
> 
> On Wed, 3 Mar 2021 at 21:27, Ross Burton via lists.yoctoproject.org
> <ross=burtonini.com@lists.yoctoproject.org> wrote:
> >
> > Change-Id: I46ea9cfa5e149db000740b4a2c6730ced99340ef
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  ...ild-race-issue-32-reported-on-github.patch | 160 ++++++++++++++++++
> >  .../opencsd/opencsd_0.14.3.bb                 |   4 +-
> >  2 files changed, 163 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-arm/recipes-devtools/opencsd/files/0001-build-Fix-build-race-issue-32-reported-on-github.patch
> >
> > diff --git a/meta-arm/recipes-devtools/opencsd/files/0001-build-Fix-build-race-issue-32-reported-on-github.patch b/meta-arm/recipes-devtools/opencsd/files/0001-build-Fix-build-race-issue-32-reported-on-github.patch
> > new file mode 100644
> > index 0000000..8ebc788
> > --- /dev/null
> > +++ b/meta-arm/recipes-devtools/opencsd/files/0001-build-Fix-build-race-issue-32-reported-on-github.patch
> > @@ -0,0 +1,160 @@
> > +Upstream-Status: Backport
> > +Signed-off-by: Ross Burton <ross.burton@arm.com>
> > +
> > +From b3eb31b79d6eee04020f0dc2ec5140ff5aa28282 Mon Sep 17 00:00:00 2001
> > +From: Mike Leach <mike.leach@linaro.org>
> > +Date: Mon, 16 Nov 2020 17:48:40 +0000
> > +Subject: [PATCH] build: Fix build race issue - #32 reported on github
> > +
> > +Issue reported of race when building tests. On a heavily loaded build
> > +machine the creation of the build directory could occur at the same time
> > +as compilation into that directory creating issue with finding object
> > +files.
> > +
> > +Reported-by: rossburton (github issue #32)
> > +Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > +---
> > + decoder/tests/build/linux/c_api_pkt_print_test/makefile | 6 +++---
> > + decoder/tests/build/linux/echo_test_dcd_lib/makefile    | 6 +++---
> > + decoder/tests/build/linux/mem_buffer_eg/makefile        | 6 +++---
> > + decoder/tests/build/linux/snapshot_parser_lib/makefile  | 6 +++---
> > + decoder/tests/build/linux/trc_pkt_lister/makefile       | 6 +++---
> > + 5 files changed, 15 insertions(+), 15 deletions(-)
> > +
> > +diff --git a/decoder/tests/build/linux/c_api_pkt_print_test/makefile b/decoder/tests/build/linux/c_api_pkt_print_test/makefile
> > +index b0b5604..f1108e4 100644
> > +--- a/decoder/tests/build/linux/c_api_pkt_print_test/makefile
> > ++++ b/decoder/tests/build/linux/c_api_pkt_print_test/makefile
> > +@@ -51,12 +51,12 @@ OBJECTS            =       $(BUILD_DIR)/c_api_pkt_print_test.o
> > + LIBS          =       -L$(LIB_TARGET_DIR) -l$(LIB_BASE_NAME) -l$(LIB_CAPI_NAME) \
> > +                               -L$(LIB_TEST_TARGET_DIR) -l_echo_test_dcd
> > +
> > +-all:  build_dir copy_libs
> > ++all: copy_libs
> > +
> > + test_app:     $(BIN_TEST_TARGET_DIR)/$(PROG)
> > +
> > +
> > +- $(BIN_TEST_TARGET_DIR)/$(PROG): $(OBJECTS)
> > ++ $(BIN_TEST_TARGET_DIR)/$(PROG): $(OBJECTS) | build_dir
> > +                       mkdir -p  $(BIN_TEST_TARGET_DIR)
> > +                       $(LINKER) $(LDFLAGS) $(OBJECTS) -Wl,--start-group $(LIBS) -Wl,--end-group -o $(BIN_TEST_TARGET_DIR)/$(PROG)
> > +                       cp $(LIB_TARGET_DIR)/*.so .
> > +@@ -77,7 +77,7 @@ DEPS := $(OBJECTS:%.o=%.d)
> > + -include $(DEPS)
> > +
> > + ## object compile
> > +-$(BUILD_DIR)/%.o : %.c
> > ++$(BUILD_DIR)/%.o : %.c | build_dir
> > +                       $(CC) $(CFLAGS) $(CC_INCLUDES) -MMD $< -o $@
> > +
> > + #### clean
> > +diff --git a/decoder/tests/build/linux/echo_test_dcd_lib/makefile b/decoder/tests/build/linux/echo_test_dcd_lib/makefile
> > +index 31ca38f..8c255a8 100644
> > +--- a/decoder/tests/build/linux/echo_test_dcd_lib/makefile
> > ++++ b/decoder/tests/build/linux/echo_test_dcd_lib/makefile
> > +@@ -48,9 +48,9 @@ CC_INCLUDES  =       \
> > + OBJECTS               =       $(BUILD_DIR)/ext_dcd_echo_test.o \
> > +                               $(BUILD_DIR)/ext_dcd_echo_test_fact.o
> > +
> > +-all:  build_dir $(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a
> > ++all: $(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a
> > +
> > +-$(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a: $(OBJECTS)
> > ++$(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a: $(OBJECTS) | build_dir
> > +       mkdir -p $(LIB_TEST_TARGET_DIR)
> > +       $(LIB) $(ARFLAGS) $(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a $(OBJECTS)
> > +
> > +@@ -64,7 +64,7 @@ DEPS := $(OBJECTS:%.o=%.d)
> > + -include $(DEPS)
> > +
> > + ## object compile
> > +-$(BUILD_DIR)/%.o : %.c
> > ++$(BUILD_DIR)/%.o : %.c | build_dir
> > +                       $(CC) $(CFLAGS) $(CC_INCLUDES) -MMD $< -o $@
> > +
> > + #### clean
> > +diff --git a/decoder/tests/build/linux/mem_buffer_eg/makefile b/decoder/tests/build/linux/mem_buffer_eg/makefile
> > +index 850ed49..7939521 100644
> > +--- a/decoder/tests/build/linux/mem_buffer_eg/makefile
> > ++++ b/decoder/tests/build/linux/mem_buffer_eg/makefile
> > +@@ -51,12 +51,12 @@ OBJECTS            =       $(BUILD_DIR)/mem_buff_demo.o
> > + LIBS          =       -L$(LIB_TEST_TARGET_DIR) -lsnapshot_parser \
> > +                               -L$(LIB_TARGET_DIR) -l$(LIB_BASE_NAME)
> > +
> > +-all:  build_dir copy_libs
> > ++all: copy_libs
> > +
> > + test_app: $(BIN_TEST_TARGET_DIR)/$(PROG)
> > +
> > +
> > +- $(BIN_TEST_TARGET_DIR)/$(PROG): $(OBJECTS)
> > ++ $(BIN_TEST_TARGET_DIR)/$(PROG): $(OBJECTS) | build_dir
> > +                       mkdir -p  $(BIN_TEST_TARGET_DIR)
> > +                       $(LINKER) $(LDFLAGS) $(OBJECTS) -Wl,--start-group $(LIBS) -Wl,--end-group -o $(BIN_TEST_TARGET_DIR)/$(PROG)
> > +
> > +@@ -76,7 +76,7 @@ DEPS := $(OBJECTS:%.o=%.d)
> > + -include $(DEPS)
> > +
> > + ## object compile
> > +-$(BUILD_DIR)/%.o : %.cpp
> > ++$(BUILD_DIR)/%.o : %.cpp | build_dir
> > +                       $(CXX) $(CXXFLAGS) $(CXX_INCLUDES) -MMD $< -o $@
> > +
> > + #### clean
> > +diff --git a/decoder/tests/build/linux/snapshot_parser_lib/makefile b/decoder/tests/build/linux/snapshot_parser_lib/makefile
> > +index 295bab6..ae566eb 100644
> > +--- a/decoder/tests/build/linux/snapshot_parser_lib/makefile
> > ++++ b/decoder/tests/build/linux/snapshot_parser_lib/makefile
> > +@@ -63,9 +63,9 @@ OBJECTS=$(BUILD_DIR)/device_info.o \
> > +               $(BUILD_DIR)/snapshot_reader.o \
> > +               $(BUILD_DIR)/ss_to_dcdtree.o
> > +
> > +-all: build_dir $(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a
> > ++all: $(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a
> > +
> > +-$(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a: $(OBJECTS)
> > ++$(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a: $(OBJECTS) | build_dir
> > +       mkdir -p $(LIB_TEST_TARGET_DIR)
> > +       $(LIB) $(ARFLAGS) $(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a $(OBJECTS)
> > +
> > +@@ -80,7 +80,7 @@ DEPS := $(OBJECTS:%.o=%.d)
> > + -include $(DEPS)
> > +
> > + ## object compile
> > +-$(BUILD_DIR)/%.o : %.cpp
> > ++$(BUILD_DIR)/%.o : %.cpp | build_dir
> > +       $(CXX) $(CXXFLAGS) $(CXX_INCLUDES) -MMD $< -o $@
> > +
> > + ### clean
> > +diff --git a/decoder/tests/build/linux/trc_pkt_lister/makefile b/decoder/tests/build/linux/trc_pkt_lister/makefile
> > +index 54ce27d..1027964 100644
> > +--- a/decoder/tests/build/linux/trc_pkt_lister/makefile
> > ++++ b/decoder/tests/build/linux/trc_pkt_lister/makefile
> > +@@ -51,12 +51,12 @@ OBJECTS            =       $(BUILD_DIR)/trc_pkt_lister.o
> > + LIBS          =       -L$(LIB_TEST_TARGET_DIR) -lsnapshot_parser \
> > +                               -L$(LIB_TARGET_DIR) -l$(LIB_BASE_NAME)
> > +
> > +-all:  build_dir copy_libs
> > ++all: copy_libs
> > +
> > + test_app: $(BIN_TEST_TARGET_DIR)/$(PROG)
> > +
> > +
> > +- $(BIN_TEST_TARGET_DIR)/$(PROG): $(OBJECTS)
> > ++ $(BIN_TEST_TARGET_DIR)/$(PROG): $(OBJECTS) | build_dir
> > +                       mkdir -p  $(BIN_TEST_TARGET_DIR)
> > +                       $(LINKER) $(LDFLAGS) $(OBJECTS) -Wl,--start-group $(LIBS) -Wl,--end-group -o $(BIN_TEST_TARGET_DIR)/$(PROG)
> > +
> > +@@ -76,7 +76,7 @@ DEPS := $(OBJECTS:%.o=%.d)
> > + -include $(DEPS)
> > +
> > + ## object compile
> > +-$(BUILD_DIR)/%.o : %.cpp
> > ++$(BUILD_DIR)/%.o : %.cpp | build_dir
> > +                       $(CXX) $(CXXFLAGS) $(CXX_INCLUDES) -MMD $< -o $@
> > +
> > + #### clean
> > +--
> > +2.25.1
> > +
> > diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb b/meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb
> > index bec3dc7..e126f6b 100644
> > --- a/meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb
> > +++ b/meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb
> > @@ -3,7 +3,9 @@ HOMEPAGE = "https://github.com/Linaro/OpenCSD"
> >  LICENSE = "BSD-3-Clause"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=ad8cb685eb324d2fa2530b985a43f3e5"
> >
> > -SRC_URI = "git://github.com/Linaro/OpenCSD;protocol=https;branch=master"
> > +SRC_URI = "git://github.com/Linaro/OpenCSD;protocol=https;branch=master \
> > +           file://0001-build-Fix-build-race-issue-32-reported-on-github.patch"
> > +
> >  SRCREV = "957d18219d162f52ebe2426f32a4263ec10f357d"
> >
> >  S = "${WORKDIR}/git"
> > --
> > 2.25.1
> >
> >
> > 
> >

> 
> 
> 

