Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.7065.1590070986839647908
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 21 May 2020 07:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FJf2OapI;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: jpewhacker@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d3so2898336pln.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 21 May 2020 07:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=j+imJsmaaA0HNmpL4yij79Ah3ohJK1xHn9jQzJO+wHI=;
        b=FJf2OapIDu1tX36N2ZdDxhJEpJGXwv0lJVEFLq0YqHx9kdbdeGKg26Tsac9g0Zna+k
         tE5RhR58Ql6Zm7kopEX/FzAogi9bOpTPeivGjFUYCMRanxL0viEY4l45nKyYgaFE+vF5
         c56NVT6TFMvW1DczYCSrqJtYySConsyuAyX1T+y/nhjNnwU08+76jh/LEJrB2w/AjNW1
         Tyw3Ckcxma78aD1WTA3T8MSLHDvpP/P2pxk2LLSE+dTjeqVIX3ROa6wiw8XhaQVxHC7d
         87FZmOfIJf+sgP8tJrPg4DDOUbfCeLCFYj/bsmueH6xN//GgyP/udb67uGCW3dDvYXQX
         4NdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=j+imJsmaaA0HNmpL4yij79Ah3ohJK1xHn9jQzJO+wHI=;
        b=SRsaEJt2Gt4vz/FU7JPvWdWOgj56GcEWLUOvkKdM+6WkgWVCJPMXk8/l/RYoKNXzZS
         D0SOSVdzJcZKaJulp0oYoxwwGyaTP5rt2KkMTxhEWUb5HCDmfLWgloyMsSNfchndm8RM
         is/iQ9nWHKUcJhnIaR27tEbvlR4ukH1/X8aJqh7FRFyfQpzfdK4O+5/EoTeChesivKF6
         SFrP6Dxnkl1SRbi3y7lOxFF3i2NY1tnvWJEzLtFmps6F6T+qAWQZE11iVk9saa4/bUDl
         D7UltkhUzU3zxoZ8pWhNFBJhAUGVKh80Icq7cp8tV89EXRrflgzjXuKdj47486Q4lYXm
         MPbg==
X-Gm-Message-State: AOAM531Je+0d9Ct3Duj5EvFAZTrK5EQj+MhVQptGUOzVY35cj72mPyZl
	IaY7opTCUGbERcobUJfiagDpRMwqze4=
X-Google-Smtp-Source: ABdhPJx6aopQ8Pa/Kma9WhS/J5ZIKYj8UHNaYXOBbiEMTSXAZA+ug3qpU2SpJT0tzx1fyGzVM8Dlnw==
X-Received: by 2002:a17:902:8a88:: with SMTP id p8mr9339089plo.289.1590070985904;
        Thu, 21 May 2020 07:23:05 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:dd2f:75de:f1b0:dc7a])
        by smtp.gmail.com with ESMTPSA id 5sm4556081pjf.19.2020.05.21.07.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 07:23:05 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-arm][PATCH v3 0/3] Add support for booting qemu with TFA and optee
Date: Thu, 21 May 2020 09:22:56 -0500
Message-Id: <20200521142259.15363-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513221134.30072-1-JPEWhacker@gmail.com>
References: <20200513221134.30072-1-JPEWhacker@gmail.com>

Adds support for booting AArch64 Qemu machines using TF-A + optee +
u-boot. Most of the changes are applicable to any AArch64 qemu target,
and a reference machine called qemuarm64-secureboot has been added that
show how to enable support for it.

Testing of op-tee can be done using the qemuarm64-secureboot machine
with the following commands:

$ cat >> conf/local.conf <<HEREDOC
MACHINE = "qemuarm64-secureboot"
CORE_IMAGE_EXTRA_INSTALL += "optee-test kernel-modules"
HEREDOC
$ bitbake core-image-minimal
$ runqemu nographic serialstdio slirp
...
root@qemuarm64-secureboot:~# xtest

V3: 
* Remove subshell in optee-client: do_install
* Changes assignements for compiling optee/TF-A for qemu to be weak
* Fixed optee-os install path to respect ${BUILD_PLAT}

Joshua Watt (3):
  optee-{os,examples,client,test}: Build out of tree
  optee-client: Add sysVinit service
  Add support for booting qemu with TFA and optee

 .../conf/machine/qemuarm64-secureboot.conf    | 26 +++++++++++
 .../trusted-firmware-a/trusted-firmware-a.inc | 44 ++++++++++++------
 .../recipes-bsp/u-boot/u-boot/qemuarm64.cfg   |  4 ++
 meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend |  3 ++
 .../linux/linux-yocto-dev.bbappend            |  4 ++
 .../linux/linux-yocto-dev/tee.cfg             |  4 ++
 .../optee/optee-client/tee-supplicant.service |  4 +-
 .../optee/optee-client/tee-supplicant.sh      | 46 +++++++++++++++++++
 .../optee/optee-client_git.bb                 | 38 +++++++++++----
 .../optee/optee-examples_git.bb               |  8 +++-
 .../recipes-security/optee/optee-os_git.bb    | 13 ++++--
 .../recipes-security/optee/optee-test_git.bb  |  8 +++-
 meta-arm/recipes-security/optee/optee.inc     |  1 +
 meta-arm/wic/qemuarm64.wks                    |  4 ++
 14 files changed, 175 insertions(+), 32 deletions(-)
 create mode 100644 meta-arm/conf/machine/qemuarm64-secureboot.conf
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot/qemuarm64.cfg
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-dev.bbappend
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-dev/tee.cfg
 create mode 100644 meta-arm/recipes-security/optee/optee-client/tee-supplicant.sh
 create mode 100644 meta-arm/wic/qemuarm64.wks

-- 
2.17.1

