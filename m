Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web12.11114.1591796604638874032
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Jun 2020 06:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZiL7oCEe;
 spf=pass (domain: linaro.org, ip: 209.85.216.67, mailfrom: sumit.garg@linaro.org)
Received: by mail-pj1-f67.google.com with SMTP id u8so858815pje.4
        for <meta-arm@lists.yoctoproject.org>; Wed, 10 Jun 2020 06:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=qhhZ14PxN3x4rcVQ3QEgwZo559enZ9gixaZejMbBNL4=;
        b=ZiL7oCEeyCZoz86P5ollfIZFbWaOUr5JxzCfd6SLAYrnqFEajwV5J++c4TSyG1oJFY
         fDdETF4ShbyjlC4ureArR1CzAJVGvKgfXdNd5/E24G48s6+frDUfBpcG6UsS8auevrNz
         BJsFggmRT5QhazPzUp8k4wQpN/2NMfVKRjqkFc76KDW6wIM8YoKo4mqIms8W+O+CjlgM
         ltKmEnVlWHg3qLJ6wWyDbTfvMfui5gyAkas/Xp4eYTTfDSByx5pQLlEoi1D5nM3Ro3DD
         rWYHj+Gd7wYoRm5vJ9q1YkHbqDEsFquBQp3cT4UtfdRMMKMsFI317PtOdzIgyQlaDExk
         CkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=qhhZ14PxN3x4rcVQ3QEgwZo559enZ9gixaZejMbBNL4=;
        b=m1+eLA0zOiH0RNMLmasJg7HG8i3Lpo6Gq/v7ZOZ2XLfiHG1mLU5S7wy1Xp1qpx3SiB
         TQTdkiHBL9cxru8JR69nhwhv/CVguOanrCcbqhHvlYAw7ypTOcneA9hYPZQuvANO4nKL
         Fh07VdW+3qWjWH7o7upFo3HbqWmfyTSkQ2dyRL1qsEgluDB7RNwWjK3BTu7cj43eB2BF
         oZFDRKpEtNvWV3fDsK8jd7OzWggoco89eK0k+lNnKjkBvtXsRh6rxmdrT/AWKkd63zhP
         51tdtXFfbpuqIUnlxIudoYK7t9fICTg3OvBbycWp8t0LmGM2X0ketuQ6AFSSQaapXw3k
         YgVA==
X-Gm-Message-State: AOAM531+HjOZs+NzCD6gCZO7wseHWRaJ2RB+WQwtO4FXGIRn05ODyh5f
	cEY8VcevFZVzV9O6z0soK3ZbjMWhGrw=
X-Google-Smtp-Source: ABdhPJzVD/X2hlsLQBoXV7OmiOCNeeVaUnVR3wKSBtaNwSX+krO4Q2+3oKheXIvV4eohqSQXRXTdwg==
X-Received: by 2002:a17:90a:64c9:: with SMTP id i9mr3200444pjm.135.1591796603568;
        Wed, 10 Jun 2020 06:43:23 -0700 (PDT)
Return-Path: <sumit.garg@linaro.org>
Received: from localhost.localdomain ([117.252.64.69])
        by smtp.gmail.com with ESMTPSA id u12sm5227530pjy.37.2020.06.10.06.43.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jun 2020 06:43:22 -0700 (PDT)
From: "Sumit Garg" <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: pbarker@konsulko.com,
	denis@denix.org,
	wmills@ti.com,
	richard.purdie@linuxfoundation.org,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH v2 0/5] external-arm-toolchain: Add support for SDK generation
Date: Wed, 10 Jun 2020 19:12:57 +0530
Message-Id: <1591796582-5015-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4

Patch #1 #2 and #3 adds impprovements in external-arm-toolchain recipe in order
to support SDK generation. SDK generation has been tested using:

$ bitbake core-image-base -c populate_sdk

Currently generated SDK only uses glibc provided by pre-built toolchain. The
cross compiler, binutils, gdb/gdbserver etc. are built from source. This is
something we would like to improve in future to package most of the components
from pre-built toolchain instead.

Generated SDK has been tested using testsdk as follows:

$ bitbake core-image-base -c testsdk

Results:

SDK testing environment: aarch64-poky-linux
GalculatorTest class: SDK doesn't contain gettext
No python package in the SDK
RESULTS:
RESULTS - assimp.BuildAssimp.test_assimp: PASSED (97.93s)
RESULTS - buildcpio.BuildCpioTest.test_cpio: PASSED (22.51s)
RESULTS - buildepoxy.EpoxyTest.test_epoxy: PASSED (17.40s)
RESULTS - buildlzip.BuildLzipTest.test_lzip: PASSED (2.52s)
RESULTS - gcc.GccCompileTest.test_gcc_compile: PASSED (0.06s)
RESULTS - gcc.GccCompileTest.test_gpp2_compile: PASSED (0.08s)
RESULTS - gcc.GccCompileTest.test_gpp_compile: PASSED (0.10s)
RESULTS - gcc.GccCompileTest.test_make: PASSED (0.06s)
RESULTS - perl.PerlTest.test_perl: PASSED (0.23s)
RESULTS - python.Python3Test.test_python3: PASSED (0.03s)
RESULTS - buildgalculator.GalculatorTest.test_galculator: SKIPPED (0.00s)
RESULTS - python.Python2Test.test_python2: SKIPPED (0.00s)
SUMMARY:
core-image-base sdk (poky-glibc-x86_64-core-image-base-aarch64-qemuarm64-toolchain-3.1+snapshot.sh:environment-setup-aarch64-poky-linux) - Ran 12 tests in 140.936s
core-image-base sdk - OK - All required tests passed (successes=10, skipped=2, failures=0, errors=0)

Patch #4 adds a README for meta-arm-toolchain layer.

Patch #5 adds package specific licences for external-arm-toolchain recipe.

Changes in v2:
- Adds a new patch #3 which fixes issues reported by testsdk.
- Define FILES_${PN}-dev from scratch which additionally refines packaging
  for dev headers as well.
- Make README common for whole meta-arm-toolchain layer rather than specific
  to pre-built toolchain. Add myself as layer maintainer although I would
  be happy to add another co-maintainer if someone is willing to volunteer.
- Update README with testing info for external-arm-toolchain.
- Misc. fixups.

Sumit Garg (5):
  external-arm-toolchain: Remove glibc locale dependency
  external-arm-toolchain: Refine dev libraries/headers packaging
  external-arm-toolchain: Align glibc packaging to OE TARGET_SYS
  meta-arm-toolchain: Add README
  external-arm-toolchain: Add package specific licenses

 meta-arm-toolchain/README.md                       | 113 +++++++++++++++++++++
 .../conf/distro/include/tcmode-external-arm.inc    |   1 +
 .../external-arm-toolchain.bb                      |  70 +++++++++++--
 .../external-arm-toolchain/license.inc             |  76 ++++++++++++++
 .../recipes-devtools/gcc/gcc-arm-common.inc        |   2 +-
 5 files changed, 251 insertions(+), 11 deletions(-)
 create mode 100644 meta-arm-toolchain/README.md
 create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc

-- 
2.7.4

