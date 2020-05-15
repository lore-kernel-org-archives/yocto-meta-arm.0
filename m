Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web11.16587.1589558567475945203
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 15 May 2020 09:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DKD6piOK;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id 4so3091763ilg.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 15 May 2020 09:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EJuYFPDKzrEeiO0Bo5vNmwsoo6Nc/7U9QmJ9fyPeBhU=;
        b=DKD6piOK2bLeGbVRilP29riIEUQbbh7V7izJt752lrhgHUrk++Tvq/zr+MDuOvzxR8
         MCuMjdiY9cTLPbtfqw0PXlesqdBN0zP0YcEDvbLlGR/MjLS0FRgF0D9R2YUXQhEVyF3i
         IUto+p1FoGNytRbZrocPhPBhJDJhFfQLYHkwbTEls2FrDzQQh6xAVQwTp+mJJdFmuTLF
         KrI/gHqGBbO7ZYAmIbLA3dSoDRbEdIxiD1bpad4hQb9JLtcGqy1L28MQjBeHBTbnMSgK
         9+WZl+GeOnAAKvLvGmEklQhDbNmluRXTYrAZFKc5xZLPE5oMpiq3lRbRTBP/utEpwaKT
         r/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EJuYFPDKzrEeiO0Bo5vNmwsoo6Nc/7U9QmJ9fyPeBhU=;
        b=A85CKBRyMvtSeVqFV7diYsUZqJGLt1/cmL+8kaPqOvsS/TbTmBUlZGLUJGJlmP1VSV
         1bh6ICQDK+JeFV3TqNwh7Y7jFOsC9esFO1UMvjsYNNdWe61DQjzJaxirWNO0uHLXB/nU
         kdaSlcgkfImyAOUs3SCBMcZSWQpG+xiwaB5BtuqsuPo+ngIEPtr8cHQjHNQWROwpnoN0
         wSALfb7h37JzvjqbjrcEZt8SmLJdt8M3FHkrCxJBg+UyHk1whaBx6yaHuQPuDIJCF8jj
         B1HoENAsrGtWO3fYKh7Bm/fDhzcRPHwkZ2KH+ONRu0xZ6yx0FpLJTgcCghar9TFw8CpK
         a0Ow==
X-Gm-Message-State: AOAM533AxxfvA811FZsLLYUYh5dvcom1jRrbqwKmYO9nLfVTHsy0Pv61
	dxCcFI/qAvHa1cPnLFe71jv9SMi/e7w=
X-Google-Smtp-Source: ABdhPJyg2pR6evyq00Y+flm2Zmg3Q3jcw9KJ3hJYX4AfGnZgFv2PggY05jiHpKj557jXIKdWNv6ewg==
X-Received: by 2002:a92:5f46:: with SMTP id t67mr3829137ilb.64.1589558566545;
        Fri, 15 May 2020 09:02:46 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:7472:a058:3fd7:24e9])
        by smtp.gmail.com with ESMTPSA id c10sm878132ioc.24.2020.05.15.09.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 09:02:45 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-arm][PATCH v2 0/3] Add support for booting qemu with TFA and optee
Date: Fri, 15 May 2020 11:02:37 -0500
Message-Id: <20200515160240.16395-1-JPEWhacker@gmail.com>
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

Joshua Watt (3):
  optee-{os,examples,client,test}: Build out of tree
  optee-client: Add sysVinit service
  Add support for booting qemu with TFA and optee

 .../conf/machine/qemuarm64-secureboot.conf    | 26 +++++++++++
 .../trusted-firmware-a/trusted-firmware-a.inc | 39 ++++++++++------
 .../recipes-bsp/u-boot/u-boot/qemuarm64.cfg   |  4 ++
 meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend |  3 ++
 .../linux/linux-yocto-dev.bbappend            |  4 ++
 .../linux/linux-yocto-dev/tee.cfg             |  4 ++
 .../optee/optee-client/tee-supplicant.service |  4 +-
 .../optee/optee-client/tee-supplicant.sh      | 46 +++++++++++++++++++
 .../optee/optee-client_git.bb                 | 39 ++++++++++++----
 .../optee/optee-examples_git.bb               |  8 +++-
 .../recipes-security/optee/optee-os_git.bb    | 14 ++++--
 .../recipes-security/optee/optee-test_git.bb  |  8 +++-
 meta-arm/recipes-security/optee/optee.inc     |  2 +-
 meta-arm/wic/qemuarm64.wks                    |  4 ++
 14 files changed, 171 insertions(+), 34 deletions(-)
 create mode 100644 meta-arm/conf/machine/qemuarm64-secureboot.conf
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot/qemuarm64.cfg
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-dev.bbappend
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-dev/tee.cfg
 create mode 100644 meta-arm/recipes-security/optee/optee-client/tee-supplicant.sh
 create mode 100644 meta-arm/wic/qemuarm64.wks

-- 
2.17.1

