Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web09.4384.1614850797054344530
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Mar 2021 01:39:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=eCtzpT29;
 spf=pass (domain: burtonini.com, ip: 209.85.167.46, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f46.google.com with SMTP id e7so42136498lft.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 04 Mar 2021 01:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=4PSSzGkldoX1HzjztvPGAvuy5Zq8D59pjW1+mgomQOg=;
        b=eCtzpT295JYMKjdaO6z7FUbiOlg3Yyh6uAmmhquf0W6BpI3LMc0TJyPHfKic7mIMM8
         QOb1rDjHwDz2ENSStJUyDyjTYoJNCJp1ODXkpPhBvejavZAbe3zhZE0WH+MW00St2+Qn
         E2256sEcPsO3Z6A8olzz6/cnkUhoTyPa35pOmDrUoqoxu2dMGXhB5XeQ08Bp5vKrjwPR
         8CJst5dtTN5inCDqYiirlirgRQitu5+iUx9WF782ObQ/beDmiIOLuigdqOhX8B99Kh0d
         HsrL3d+ck/Zy0undOW1Gq7HBYvkksyB0WCu22Olwrb/GyBImRz6jkO3bTy+lknAAbZOp
         3L4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=4PSSzGkldoX1HzjztvPGAvuy5Zq8D59pjW1+mgomQOg=;
        b=FBjU77A6PeJGl/kX8YJGJ96z5TuZfl5g84aXNsXCmDnTKReamjCB1x4CMbuy+QwsjL
         iyd/rYDmJLRI4LS+jSMkJ/uGwHIHpzA90yi2iIXLrWPpqg38SrALF3XvgL/Ssckq/NIv
         waas21+1Sw/rNFP1TF+Q5GCszbpkrg2vMB6Z7Ig9BG50xP9dDMA4p+CNT4K7OnCIORa4
         BX7e4AHlHFqLpzwCaaCJ0wa2W4YzjdV6s9MO0CwoEYeVKo7zfFB7+xUB44LypFk2k27K
         ecI7AUtYKUWYN4g7xMJ3iENaOMbr09kViY0MwsaqJkFyS4mfypKtn1izngIgGlw5jBKH
         R1sA==
X-Gm-Message-State: AOAM531fIHi+vxcPanIOTUem39rT/+6n7P0t1YWcNiZYWO/pvPUb0DK/
	8kt4j8dVb1uMIHAjL/LjVHCezqxfLdiq3cW5TiNMlIepGxkRrg==
X-Google-Smtp-Source: ABdhPJwZbMUKETKllTLOPmqktxru2HI92H6SZKmVJFUWsfVFe3OrWg58P8cmyhSeLnGeKxEHt5nRN1dNqExHOahfaMw=
X-Received: by 2002:a19:c792:: with SMTP id x140mr1811922lff.215.1614850794795;
 Thu, 04 Mar 2021 01:39:54 -0800 (PST)
MIME-Version: 1.0
References: <20210303212734.758924-1-ross.burton@arm.com>
In-Reply-To: <20210303212734.758924-1-ross.burton@arm.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 4 Mar 2021 09:39:43 +0000
Message-ID: <CAAnfSTt927+o=AKJLoON1JAdFsBa_=cbbsj3_7=8MoCoMJYszQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/2] arm/opencsd: backport patch to fix build race
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

These were for gatesgarth, apologies.

Ross

On Wed, 3 Mar 2021 at 21:27, Ross Burton via lists.yoctoproject.org
<ross=burtonini.com@lists.yoctoproject.org> wrote:
>
> Change-Id: I46ea9cfa5e149db000740b4a2c6730ced99340ef
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ...ild-race-issue-32-reported-on-github.patch | 160 ++++++++++++++++++
>  .../opencsd/opencsd_0.14.3.bb                 |   4 +-
>  2 files changed, 163 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arm/recipes-devtools/opencsd/files/0001-build-Fix-build-race-issue-32-reported-on-github.patch
>
> diff --git a/meta-arm/recipes-devtools/opencsd/files/0001-build-Fix-build-race-issue-32-reported-on-github.patch b/meta-arm/recipes-devtools/opencsd/files/0001-build-Fix-build-race-issue-32-reported-on-github.patch
> new file mode 100644
> index 0000000..8ebc788
> --- /dev/null
> +++ b/meta-arm/recipes-devtools/opencsd/files/0001-build-Fix-build-race-issue-32-reported-on-github.patch
> @@ -0,0 +1,160 @@
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +From b3eb31b79d6eee04020f0dc2ec5140ff5aa28282 Mon Sep 17 00:00:00 2001
> +From: Mike Leach <mike.leach@linaro.org>
> +Date: Mon, 16 Nov 2020 17:48:40 +0000
> +Subject: [PATCH] build: Fix build race issue - #32 reported on github
> +
> +Issue reported of race when building tests. On a heavily loaded build
> +machine the creation of the build directory could occur at the same time
> +as compilation into that directory creating issue with finding object
> +files.
> +
> +Reported-by: rossburton (github issue #32)
> +Signed-off-by: Mike Leach <mike.leach@linaro.org>
> +---
> + decoder/tests/build/linux/c_api_pkt_print_test/makefile | 6 +++---
> + decoder/tests/build/linux/echo_test_dcd_lib/makefile    | 6 +++---
> + decoder/tests/build/linux/mem_buffer_eg/makefile        | 6 +++---
> + decoder/tests/build/linux/snapshot_parser_lib/makefile  | 6 +++---
> + decoder/tests/build/linux/trc_pkt_lister/makefile       | 6 +++---
> + 5 files changed, 15 insertions(+), 15 deletions(-)
> +
> +diff --git a/decoder/tests/build/linux/c_api_pkt_print_test/makefile b/decoder/tests/build/linux/c_api_pkt_print_test/makefile
> +index b0b5604..f1108e4 100644
> +--- a/decoder/tests/build/linux/c_api_pkt_print_test/makefile
> ++++ b/decoder/tests/build/linux/c_api_pkt_print_test/makefile
> +@@ -51,12 +51,12 @@ OBJECTS            =       $(BUILD_DIR)/c_api_pkt_print_test.o
> + LIBS          =       -L$(LIB_TARGET_DIR) -l$(LIB_BASE_NAME) -l$(LIB_CAPI_NAME) \
> +                               -L$(LIB_TEST_TARGET_DIR) -l_echo_test_dcd
> +
> +-all:  build_dir copy_libs
> ++all: copy_libs
> +
> + test_app:     $(BIN_TEST_TARGET_DIR)/$(PROG)
> +
> +
> +- $(BIN_TEST_TARGET_DIR)/$(PROG): $(OBJECTS)
> ++ $(BIN_TEST_TARGET_DIR)/$(PROG): $(OBJECTS) | build_dir
> +                       mkdir -p  $(BIN_TEST_TARGET_DIR)
> +                       $(LINKER) $(LDFLAGS) $(OBJECTS) -Wl,--start-group $(LIBS) -Wl,--end-group -o $(BIN_TEST_TARGET_DIR)/$(PROG)
> +                       cp $(LIB_TARGET_DIR)/*.so .
> +@@ -77,7 +77,7 @@ DEPS := $(OBJECTS:%.o=%.d)
> + -include $(DEPS)
> +
> + ## object compile
> +-$(BUILD_DIR)/%.o : %.c
> ++$(BUILD_DIR)/%.o : %.c | build_dir
> +                       $(CC) $(CFLAGS) $(CC_INCLUDES) -MMD $< -o $@
> +
> + #### clean
> +diff --git a/decoder/tests/build/linux/echo_test_dcd_lib/makefile b/decoder/tests/build/linux/echo_test_dcd_lib/makefile
> +index 31ca38f..8c255a8 100644
> +--- a/decoder/tests/build/linux/echo_test_dcd_lib/makefile
> ++++ b/decoder/tests/build/linux/echo_test_dcd_lib/makefile
> +@@ -48,9 +48,9 @@ CC_INCLUDES  =       \
> + OBJECTS               =       $(BUILD_DIR)/ext_dcd_echo_test.o \
> +                               $(BUILD_DIR)/ext_dcd_echo_test_fact.o
> +
> +-all:  build_dir $(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a
> ++all: $(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a
> +
> +-$(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a: $(OBJECTS)
> ++$(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a: $(OBJECTS) | build_dir
> +       mkdir -p $(LIB_TEST_TARGET_DIR)
> +       $(LIB) $(ARFLAGS) $(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a $(OBJECTS)
> +
> +@@ -64,7 +64,7 @@ DEPS := $(OBJECTS:%.o=%.d)
> + -include $(DEPS)
> +
> + ## object compile
> +-$(BUILD_DIR)/%.o : %.c
> ++$(BUILD_DIR)/%.o : %.c | build_dir
> +                       $(CC) $(CFLAGS) $(CC_INCLUDES) -MMD $< -o $@
> +
> + #### clean
> +diff --git a/decoder/tests/build/linux/mem_buffer_eg/makefile b/decoder/tests/build/linux/mem_buffer_eg/makefile
> +index 850ed49..7939521 100644
> +--- a/decoder/tests/build/linux/mem_buffer_eg/makefile
> ++++ b/decoder/tests/build/linux/mem_buffer_eg/makefile
> +@@ -51,12 +51,12 @@ OBJECTS            =       $(BUILD_DIR)/mem_buff_demo.o
> + LIBS          =       -L$(LIB_TEST_TARGET_DIR) -lsnapshot_parser \
> +                               -L$(LIB_TARGET_DIR) -l$(LIB_BASE_NAME)
> +
> +-all:  build_dir copy_libs
> ++all: copy_libs
> +
> + test_app: $(BIN_TEST_TARGET_DIR)/$(PROG)
> +
> +
> +- $(BIN_TEST_TARGET_DIR)/$(PROG): $(OBJECTS)
> ++ $(BIN_TEST_TARGET_DIR)/$(PROG): $(OBJECTS) | build_dir
> +                       mkdir -p  $(BIN_TEST_TARGET_DIR)
> +                       $(LINKER) $(LDFLAGS) $(OBJECTS) -Wl,--start-group $(LIBS) -Wl,--end-group -o $(BIN_TEST_TARGET_DIR)/$(PROG)
> +
> +@@ -76,7 +76,7 @@ DEPS := $(OBJECTS:%.o=%.d)
> + -include $(DEPS)
> +
> + ## object compile
> +-$(BUILD_DIR)/%.o : %.cpp
> ++$(BUILD_DIR)/%.o : %.cpp | build_dir
> +                       $(CXX) $(CXXFLAGS) $(CXX_INCLUDES) -MMD $< -o $@
> +
> + #### clean
> +diff --git a/decoder/tests/build/linux/snapshot_parser_lib/makefile b/decoder/tests/build/linux/snapshot_parser_lib/makefile
> +index 295bab6..ae566eb 100644
> +--- a/decoder/tests/build/linux/snapshot_parser_lib/makefile
> ++++ b/decoder/tests/build/linux/snapshot_parser_lib/makefile
> +@@ -63,9 +63,9 @@ OBJECTS=$(BUILD_DIR)/device_info.o \
> +               $(BUILD_DIR)/snapshot_reader.o \
> +               $(BUILD_DIR)/ss_to_dcdtree.o
> +
> +-all: build_dir $(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a
> ++all: $(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a
> +
> +-$(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a: $(OBJECTS)
> ++$(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a: $(OBJECTS) | build_dir
> +       mkdir -p $(LIB_TEST_TARGET_DIR)
> +       $(LIB) $(ARFLAGS) $(LIB_TEST_TARGET_DIR)/$(LIB_NAME).a $(OBJECTS)
> +
> +@@ -80,7 +80,7 @@ DEPS := $(OBJECTS:%.o=%.d)
> + -include $(DEPS)
> +
> + ## object compile
> +-$(BUILD_DIR)/%.o : %.cpp
> ++$(BUILD_DIR)/%.o : %.cpp | build_dir
> +       $(CXX) $(CXXFLAGS) $(CXX_INCLUDES) -MMD $< -o $@
> +
> + ### clean
> +diff --git a/decoder/tests/build/linux/trc_pkt_lister/makefile b/decoder/tests/build/linux/trc_pkt_lister/makefile
> +index 54ce27d..1027964 100644
> +--- a/decoder/tests/build/linux/trc_pkt_lister/makefile
> ++++ b/decoder/tests/build/linux/trc_pkt_lister/makefile
> +@@ -51,12 +51,12 @@ OBJECTS            =       $(BUILD_DIR)/trc_pkt_lister.o
> + LIBS          =       -L$(LIB_TEST_TARGET_DIR) -lsnapshot_parser \
> +                               -L$(LIB_TARGET_DIR) -l$(LIB_BASE_NAME)
> +
> +-all:  build_dir copy_libs
> ++all: copy_libs
> +
> + test_app: $(BIN_TEST_TARGET_DIR)/$(PROG)
> +
> +
> +- $(BIN_TEST_TARGET_DIR)/$(PROG): $(OBJECTS)
> ++ $(BIN_TEST_TARGET_DIR)/$(PROG): $(OBJECTS) | build_dir
> +                       mkdir -p  $(BIN_TEST_TARGET_DIR)
> +                       $(LINKER) $(LDFLAGS) $(OBJECTS) -Wl,--start-group $(LIBS) -Wl,--end-group -o $(BIN_TEST_TARGET_DIR)/$(PROG)
> +
> +@@ -76,7 +76,7 @@ DEPS := $(OBJECTS:%.o=%.d)
> + -include $(DEPS)
> +
> + ## object compile
> +-$(BUILD_DIR)/%.o : %.cpp
> ++$(BUILD_DIR)/%.o : %.cpp | build_dir
> +                       $(CXX) $(CXXFLAGS) $(CXX_INCLUDES) -MMD $< -o $@
> +
> + #### clean
> +--
> +2.25.1
> +
> diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb b/meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb
> index bec3dc7..e126f6b 100644
> --- a/meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb
> +++ b/meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb
> @@ -3,7 +3,9 @@ HOMEPAGE = "https://github.com/Linaro/OpenCSD"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=ad8cb685eb324d2fa2530b985a43f3e5"
>
> -SRC_URI = "git://github.com/Linaro/OpenCSD;protocol=https;branch=master"
> +SRC_URI = "git://github.com/Linaro/OpenCSD;protocol=https;branch=master \
> +           file://0001-build-Fix-build-race-issue-32-reported-on-github.patch"
> +
>  SRCREV = "957d18219d162f52ebe2426f32a4263ec10f357d"
>
>  S = "${WORKDIR}/git"
> --
> 2.25.1
>
>
> 
>
