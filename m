Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88289CDE01A
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 15:47:47 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.47055.1727365660892228688
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Sep 2024 08:47:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=jW3zTrOi;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.54, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6c579748bf4so8543916d6.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 08:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727365660; x=1727970460; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mhlaZrZjVjpMjBpEkfzfFwOgeI4/eNQrVpjQRqcoacA=;
        b=jW3zTrOiNw4bf7RCM6THd+N3t2bg/R3xMAS5OQr/TnEbdJits12dCmdOs1kRK5O13u
         4lJkxt2KwABJR9SIANEtTGj/ttXgBShJw1TFP3E3Q477HXzRb9srI/fj1sFuoBNu+JOk
         WoQ5RzZnWxutBAHMzghsQmUpqxlRTUQIeLBWTVWBdmadwyO+VRQXEf55AK8247w/J/N/
         CYQApOeup9+ynj3yGpg9bLmF0oIq0my06Vgot3QbtNF6G4MeZ41pddRgv8uUm/OGNtih
         5ZpBKjoM46wDCjn4oHAhW5J89rFObB3us5N3axAbaRcwXbZtZ7/xWGnFR/KQ2Ixc6jNo
         W16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727365660; x=1727970460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mhlaZrZjVjpMjBpEkfzfFwOgeI4/eNQrVpjQRqcoacA=;
        b=fpdZTRNG2eA1ca93qcwPe3zUG+pvu/B6HVUf4EtsEgSLtJnCTonm+LQDcgufbv7XSp
         ujrzcL9jDFtXDkiaKRbeRwlTA+dDh5PamcRhM7EImAvWnzGecuzD4hppqUAGGJxsArKy
         NC2wUB3N+nB5CbP7l67x362htTRUeQNbHZuw3542hpfbGAhmLuCkkzUZSu0nRetMIZ5d
         kGaajpZeD7YJ8thl89HXT8ndD7NlcecD5fBmH0UYaisBBy5DVF9fuyrYW0vVzeTtN0Qw
         aQY0ZlnqUM8p1q2aJ14KkTBYqv3SZVAQnTe8WsnY8vHC1h52GU3cz5TZPbPtOpl/Jax1
         j98A==
X-Gm-Message-State: AOJu0Ywt9Fo+PbjZFZ9jWHsonOEr+SXkJ1rR141vvHKB1m7jMR2v9L+A
	XEatPbzYq9UxQKm1Z5rqjDRYLo/L/J9D5vt/4eT+KECInQxUHri6iagypBpf1UFZfYfgvnlYSOU
	=
X-Google-Smtp-Source: AGHT+IE8IbtGApcrw5nPYn1Pk2JVPj+Jb2Xlq3l8YwCeR8IsKudxUKAf48ZjSxk3vV7CFhbkviDCLg==
X-Received: by 2002:a05:6214:2b85:b0:6c6:b484:7973 with SMTP id 6a1803df08f44-6cb3b66343cmr957636d6.51.1727365659665;
        Thu, 26 Sep 2024 08:47:39 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b66b520sm388936d6.92.2024.09.26.08.47.39
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 08:47:39 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v7 0/4] UEFI secureboot
Date: Thu, 26 Sep 2024 11:47:35 -0400
Message-Id: <20240926154739.2379609-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 15:47:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6117

Sending a modified version of Javier's patches, combined with a subset
of the patches sent out by Mikko recently.  This was done to expedite
the acceptance of this series (given the code freeze tomorrow).  Also,
the optee update that Mikko's series included cannot be included (given
the code freeze).  2 of that series are needed for this one.  So,
combining everything into this and sending it out publicly for Javier,
Mikko, and anyone else to ack/nack.

Thanks,
Jon


Javier Tia (3):
  arm/optee: Add optee udev rules
  arm: Enable Secure Boot in all required recipes
  arm/qemuarm64-secureboot: Enable UEFI Secure Boot

Mikko Rapeli (1):
  arm/optee-client: fix systemd service dependencies

 .gitlab-ci.yml                                |  1 +
 ci/uefi-secureboot.yml                        | 37 +++++++++++++
 meta-arm/classes/sbsign.bbclass               | 31 +++++++++++
 .../lib/oeqa/runtime/cases/uefi_secureboot.py | 29 +++++++++++
 .../u-boot/u-boot-uefi-secureboot.inc         | 17 ++++++
 .../u-boot/u-boot/uefi-secureboot.cfg         | 10 ++++
 meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend |  2 +
 meta-arm/recipes-bsp/uefi/gen-sbkeys.bb       | 48 +++++++++++++++++
 .../recipes-bsp/uefi/gen-sbkeys/gen_sbkeys.sh | 52 +++++++++++++++++++
 .../systemd/systemd-boot-uefi-secureboot.inc  |  7 +++
 .../systemd/systemd-boot_%.bbappend           |  1 +
 meta-arm/recipes-core/systemd/systemd-efi.inc |  1 +
 .../recipes-core/systemd/systemd_%.bbappend   |  1 +
 .../linux/linux-yocto%.bbappend               |  2 +
 .../linux/linux-yocto-uefi-secureboot.inc     | 14 +++++
 .../recipes-security/optee/optee-client.inc   |  8 ++-
 .../optee/optee-client/optee-udev.rules       |  6 +++
 .../optee-client/tee-supplicant@.service      | 10 ++--
 18 files changed, 272 insertions(+), 5 deletions(-)
 create mode 100644 ci/uefi-secureboot.yml
 create mode 100644 meta-arm/classes/sbsign.bbclass
 create mode 100644 meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot/uefi-secureboot.cfg
 create mode 100644 meta-arm/recipes-bsp/uefi/gen-sbkeys.bb
 create mode 100755 meta-arm/recipes-bsp/uefi/gen-sbkeys/gen_sbkeys.sh
 create mode 100644 meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
 create mode 100644 meta-arm/recipes-core/systemd/systemd-boot_%.bbappend
 create mode 100644 meta-arm/recipes-core/systemd/systemd-efi.inc
 create mode 100644 meta-arm/recipes-core/systemd/systemd_%.bbappend
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc
 create mode 100644 meta-arm/recipes-security/optee/optee-client/optee-udev.rules

-- 
2.39.5


