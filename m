Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BDB9C54E67
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 13:42:17 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.37898.1711546928125391112
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Mar 2024 06:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=dtSp2dU+;
 spf=pass (domain: linaro.org, ip: 209.85.208.180, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d476d7972aso107156071fa.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 27 Mar 2024 06:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711546926; x=1712151726; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+eZeZD8Qw7BWwnEDMiYTMIx0yPWJVEHhGCC6jdGV2HE=;
        b=dtSp2dU+1QZ7TnNW70XSuRJQQmWiksPbVDp3o7OTsyDFTWKkEGg3RxHLlQDWjcoYjY
         Lru8uhqUqXX4F5gpV37m/MVI91MpZYa8dMxZ6sMIPYYNHA05zqY7Pvx0udTCLnIhotnj
         y7QvGqvcVXb6M/MniivqsLmDDOh3VNnG0jMUBmMLdj+5uI69vFJd+C4C2gzgnp9kA1lU
         UFw/jD9ifeH5vNbUsj1Oqiti2sK9oZvK61PL9tiK0pkyJ4qmEc8bZbFQTao7AlOQK24m
         YEVK4+fRVwHDDKmQYSloNKE7eFBSa5oxVQ5Tny3ghQIvclOdSYzHpTPYB8/fCKltU5en
         /dmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711546926; x=1712151726;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+eZeZD8Qw7BWwnEDMiYTMIx0yPWJVEHhGCC6jdGV2HE=;
        b=v6thp18wLOU02ijy0WLc3tZs+i+YanZQ9TPWG2rkuJP9P5J8dl8174GARFRgjE8MPy
         DHqiDKUrDzBY5Z70huMLLEd/gtlbZzaCSJG06gtCqESAmOMPdCHeZ/Lz+eJHhF7KeTzg
         RPwfe2yz9WFHJQGOL+rUw8+O+Jxoj9qgoNB8pOzdET9C689j/wtq/HrYXfLvstZBqVmn
         88n/omF/gTLxFllUg11INzON1+i/9NS67f+9jYq7xjeq+pYCNL7DmbYo1DjDN7bvsIFP
         /2TPHcsek1vL6tjeOxmVPo/rrYaAthDG/AR8yEjL+lGKeQVdH0SfCC3BHXbsscrGT9TA
         vUxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYCiN19/dUas75xVhyozrioEKXepNt4QW39THxz6flgruhT+8c48e0k17QKXX2f/GYTrJnx+PURwJZtJEHvzv8cbRMJuSLvdLuxJo2xQtE
X-Gm-Message-State: AOJu0Yzi8xRTQUwfKKh0f8WtouXFBKPilII55qsokvl1pCkv7MB1nt5x
	1At8Rz4aK8xmo2nhr4xfETArOv+lW7ZazdGDJmeUaFNoYhFgmceunH0w7DS13AY=
X-Google-Smtp-Source: AGHT+IFF7+cD4gUCwm6XDobHZ8BIJDCj+uqjtIxyJbNzi5ALMPSticjGNKVwBLBWLf7yuVF7ZDlzKg==
X-Received: by 2002:a19:e046:0:b0:515:b69e:8ddf with SMTP id g6-20020a19e046000000b00515b69e8ddfmr1045159lfj.55.1711546925811;
        Wed, 27 Mar 2024 06:42:05 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id k11-20020a192d0b000000b0051589cc26afsm1841961lfj.72.2024.03.27.06.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 06:42:05 -0700 (PDT)
Date: Wed, 27 Mar 2024 15:42:03 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <ross.burton@arm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jon Mason <Jon.Mason@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH v2] arm/trusted-firmware-rmm: Add bitbake,
 include and patch file for RMM
Message-ID: <ZgQiK6tpa8RdI_cy@nuoska>
References: <20240326202001.1075940-1-mathieu.poirier@linaro.org>
 <86E1B306-3BC6-45B7-821B-D24DA64F42B5@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86E1B306-3BC6-45B7-821B-D24DA64F42B5@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Mar 2024 13:42:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5493

Hi,

On Wed, Mar 27, 2024 at 01:04:52PM +0000, Ross Burton wrote:
<nip>
> > +# Supplement include path
> > +EXTRA_OECMAKE += "-DCMAKE_INCLUDE_PATH=${WORKDIR}/recipe-sysroot/usr/include"
> 
> -DCMAKE_INCLUDE_PATH=${STAGING_INCDIR} would be neater, but this really does feel like a bug in the CMakeLists.txt.  Why doesn’t it respect the sysroot that the compiler is told to use?  We carefully configure a toolchain that specifies exactly what compiler, sysroot, flags, etc to use.
> 
> > +export CROSS_COMPILE="${TARGET_PREFIX}"
> > +export CMAKE_BUILD_PARALLEL_LEVEL = "${@oe.utils.parallel_make(d, False)}"
> 
> CMake class should be doing this, remove.

Sadly RMM build scripts really don't want to support compiling
with an external CMake toolchain file:

cmake/Toolchains.cmake

if(DEFINED CACHE{CMAKE_TOOLCHAIN_FILE} AND NOT DEFINED RMM_TOOLCHAIN)
    message(WARNING
        "The RMM project does not support `CMAKE_TOOLCHAIN_FILE` directly. "
        "Please use `RMM_TOOLCHAIN` to configure your desired toolchain.")

    unset(CMAKE_TOOLCHAIN_FILE CACHE)
endif()

And then things like:

$ git grep -i set.*_compiler
toolchains/aarch64/llvm.cmake:set(CMAKE_ASM_COMPILER ${CMAKE_C_COMPILER})
toolchains/aarch64/llvm.cmake:    set(CMAKE_${language}_COMPILER_TARGET "${A64-GCC-TRIPLET}")
toolchains/fake_host/gnu.cmake:set(CMAKE_ASM_COMPILER ${CMAKE_C_COMPILER})
toolchains/fake_host/llvm.cmake:set(CMAKE_ASM_COMPILER ${CMAKE_C_COMPILER})

One way to solve these could be to patch all these away even if upstream would
reject that approach:

--- a/toolchains/aarch64/gnu.cmake
+++ b/toolchains/aarch64/gnu.cmake
@@ -7,12 +7,3 @@ include_guard()
 
 include(${CMAKE_CURRENT_LIST_DIR}/common_aarch64.cmake)
 
-find_program(CMAKE_ASM_COMPILER
-    NAMES "$ENV{CROSS_COMPILE}gcc"
-    DOC "Path to an aarch64 compiler."
-    REQUIRED)
-
-find_program(CMAKE_C_COMPILER
-    NAMES "$ENV{CROSS_COMPILE}gcc"
-    DOC "Path to an aarch64 compiler."
-    REQUIRED)
--- a/toolchains/common.cmake
+++ b/toolchains/common.cmake
@@ -5,12 +5,6 @@
 
 include_guard()
 
-set(CMAKE_SYSTEM_NAME "Generic")
-set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
-set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
-set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
-set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
-
 foreach(language IN ITEMS ASM C CXX)
     string(APPEND CMAKE_${language}_FLAGS_INIT "-fno-common ")
     string(APPEND CMAKE_${language}_FLAGS_INIT "-ffunction-sections ")
--- a/toolchains/fake_host/gnu.cmake
+++ b/toolchains/fake_host/gnu.cmake
@@ -7,19 +7,4 @@ include_guard()
 
 include(${CMAKE_CURRENT_LIST_DIR}/common_fake_host.cmake)
 
-find_program(CMAKE_C_COMPILER
-    NAMES "gcc"
-    DOC "Path to gcc."
-    REQUIRED)
-
-#
-# Needed to build CppUTest for unit tests
-#
-find_program(CMAKE_CXX_COMPILER
-    NAMES "g++"
-    DOC "Path to g++."
-    REQUIRED)
-
-set(CMAKE_ASM_COMPILER ${CMAKE_C_COMPILER})
-
 string(APPEND CMAKE_EXE_LINKER_FLAGS_INIT "-Wl,--build-id=none ")

These fix standard cmake.bbclass usage though there are still some
issues with -march=armv8.5-a support for the compatible machine, and
stack protection which could be hacked around with
SECURITY_STACK_PROTECTOR = "" which disables stack protection
for this recipe.

Cheers,

-Mikko

