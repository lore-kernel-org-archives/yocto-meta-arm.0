Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web11.17324.1591957956213369876
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Jun 2020 03:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=S8mIL3U4;
 spf=pass (domain: linaro.org, ip: 209.85.216.66, mailfrom: sumit.garg@linaro.org)
Received: by mail-pj1-f66.google.com with SMTP id u8so3488065pje.4
        for <meta-arm@lists.yoctoproject.org>; Fri, 12 Jun 2020 03:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=L+E3jmi1rfe1MO+9GNl9+KFzOq165j7pY3/CTWwib7U=;
        b=S8mIL3U4C7TL/eS/xnH3eeritH8whaolWiB9rZJdvdTK1fMcVl0D5D9A4pNTavLjEz
         6SUso1jxkNDY8IqRQvBtwlJvRedATX/Xt1718GPuYf0DyE6y+BHNG0SJwbTmIJq66a0V
         yIuKxzQ83ojJ0sIrpWXPkFFa5yjgPifuYyKlabqPJTJKLsWLWLTp2UrDedQN8xzcMg5U
         Mec10IzFeV7ydnw6rxNI4DFz5FIqqgK+hvFrvXBAKHlPfkBw22vDYe/ZvSZ68toGZPaF
         PW6xU31+4gpisHlM/fAJVrEI9K5J9gqrUaNro0jRyA2o4zDUh0vdR+qVJezFG4rlHIya
         sLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=L+E3jmi1rfe1MO+9GNl9+KFzOq165j7pY3/CTWwib7U=;
        b=uNl0pxH3xxN0WKDT8Qy9mOjE//RyecMKypF8fFwOncFegq5TKM7550nprc7PwVf/JV
         tOHH42kvwAMdcCxgvNyS2qZnlzQluLV5+DwwClUxiUHBzH91F7rdRk7TX+oz/Tan1wdi
         DzuenvN0HoX8rUuCSJkSBtg5V+TTm+y+YZg6gpwvda5pV7F1qWRLI3A3qQQH7RmFytDR
         fgrnyk71SACTc6iEy0vdlPIzovhpBIusSj9XA313g0puzWdfN00DArYysIZVU6xfX5OY
         EY2QLbZiRhZJcdgmvZ6UnczUHDxRR72ILxtrz6XPd6SswJb/9MiZGhIyysjELDwU9Esn
         mHrQ==
X-Gm-Message-State: AOAM530daFSDvCG+QoyMsa96BeF8nyr9Uxj1XsHdqaycEmfwBIjDEJSC
	36SdIhUKFN/4phHkUPxjhDwiLbXcs2I=
X-Google-Smtp-Source: ABdhPJxsB8dfV24cankShKVK1O3BWwRTkTgY8eq7SifdcG8Do0Ljdu8OLZbt3VfRE1HCBVQ75R9YfA==
X-Received: by 2002:a17:902:e78f:: with SMTP id cp15mr11181545plb.41.1591957955246;
        Fri, 12 Jun 2020 03:32:35 -0700 (PDT)
Return-Path: <sumit.garg@linaro.org>
Received: from localhost.localdomain ([117.252.64.69])
        by smtp.gmail.com with ESMTPSA id y81sm5871606pfb.33.2020.06.12.03.32.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jun 2020 03:32:34 -0700 (PDT)
From: "Sumit Garg" <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: pbarker@konsulko.com,
	denis@denix.org,
	wmills@ti.com,
	richard.purdie@linuxfoundation.org,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH v3 0/5] external-arm-toolchain: Add support for SDK generation
Date: Fri, 12 Jun 2020 16:02:03 +0530
Message-Id: <1591957928-5959-1-git-send-email-sumit.garg@linaro.org>
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

Changes in v3:
- Patch #2: re-order PACKAGES list rather than defining FILES_${PN}-dev
  from scratch as it allows us to achieve the intended objective and is
  much portable and cleaner approach.
- Add review tags for patch #1 and #5.

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
 .../external-arm-toolchain.bb                      |  35 +++++--
 .../external-arm-toolchain/license.inc             |  76 ++++++++++++++
 .../recipes-devtools/gcc/gcc-arm-common.inc        |   2 +-
 5 files changed, 216 insertions(+), 11 deletions(-)
 create mode 100644 meta-arm-toolchain/README.md
 create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc

-- 
2.7.4

